package com.rush.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class OrderBeanBO {
	
	private Connection ct=null;
	private ResultSet rs=null;
	private PreparedStatement ps=null; 
//===============================1. 添加order=======================================	
	public OrderInfoBean addOrder(MyCartBO mbo, String userId	){
		OrderInfoBean oib=new OrderInfoBean();
		boolean b=true;
		try{
			ct=new ConnDB().getConn();
			ps=ct.prepareStatement("insert into orders (userId, isPayed, totalPrice) values (?,?,?)");
			ps.setString(1, userId);
			ps.setByte(2, (byte)0);
			ps.setFloat(3, mbo.getAllPrice());
			int a=ps.executeUpdate();
			if(a==1){
				//----------------把最近的ordersId取出来---------------
				ps=ct.prepareStatement("select max (ordersId) from orders");
				rs=ps.executeQuery();
				int orderId=0;
				if(rs.next()){
					orderId=rs.getInt(1);
				}
				//++++++++++++++++++++++++++++++++++++++++++++++++++++++++
				//orders表添加成功, 添加ordersDetail
				ArrayList al=mbo.showMyCart(); //从购物车取出选购的商品
				//添加到orderDetail表,但循环操作数据库不好
				//最好是有个buffer，能够批量操作数据库(要用statement)
				Statement sm=ct.createStatement(); //注意格式，这里是空参数构造器，下边才sm.addBatch()
				for(int i=0;i<al.size();i++){ 	
					GoodsBean gb=(GoodsBean)al.get(i);
					sm.addBatch("insert into orderDetail values('"+orderId+"','"+gb.getGoodsId()+"','"+mbo.getGoodsNumById(gb.getGoodsId()+"")+"')"); //这个batch可以批量操作数据库
				}
				sm.executeBatch();
				String sql="select ordersId, truename, address, postcode, phone, totalPrice, username, email from users, orders"+
				" where ordersId=? and users.userid=(select orders.userid from orders where ordersId=?)";
				
				ps=ct.prepareStatement(sql);
				ps.setInt(1, orderId);
				ps.setInt(2, orderId);
				rs=ps.executeQuery();
				if(rs.next()){ //封装到orderinfobean
					oib.setOrdersId(rs.getInt(1));
					oib.setTruename(rs.getString(2));
					oib.setAddress(rs.getString(3));
					oib.setPostcode(rs.getString(4));
					oib.setPhone(rs.getString(5));
					oib.setTotalPrice(rs.getFloat(6));
					oib.setUsername(rs.getString(7));
					oib.setEmail(rs.getString(8));
				}
			}
		}catch(Exception e){
			b=false;
			e.printStackTrace();
		}finally{
			this.close();
		}
		if(b){
			return oib;
		}else{
			return null;
		}
		
	}
	
//*******************************************************************************************************

	
//===================================================================================	
	public void close(){
		try{
			if(rs!=null){
				rs.close();
				rs=null;
			}
			if(ps!=null){
				ps.close();
				ps=null;
			}if(!ct.isClosed()){   //ct有它自己的这个函数
				ct.close();
				ct=null;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
