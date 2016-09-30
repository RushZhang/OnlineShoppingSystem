//处理与goods表相关的业务逻辑
package com.rush.model;
import java.sql.*;
import java.util.*;


public class GoodsBeanBO {
	//定义一些变量
	private Connection ct=null;
	private ResultSet rs=null;
	private PreparedStatement ps=null; //这里是过去时
//=======================根据商品的货物id来得到具体信息的函数=====================
	public GoodsBean getGoodsBean(String id){
		GoodsBean gb=new GoodsBean();
		try{
			ct=new ConnDB().getConn();
			ps=ct.prepareStatement("select * from goods where goodsId=?");//这里不是过去式
			ps.setString(1, id);//ps里这个可以设置？号
			rs=ps.executeQuery();
			if(rs.next()){  //下面这段代码记下来
				gb.setGoodsId(rs.getInt(1));
				gb.setGoodsName(rs.getString(2));
				gb.setGoodsIntro(rs.getString(3));
				gb.setGoodsPrice(rs.getFloat(4));
				gb.setGoodsNum(rs.getInt(5));
				gb.setPublisher(rs.getString(6));
				gb.setPhoto(rs.getString(7));
				gb.setType(rs.getString(8));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.close();
		}
		return gb;
	}
//******************************************************************************************************
	
//=============================返回有多少页码======================================
	public int getPageCount(int pageSize){
		int pageCount=0;
		int rowCount=0;
		try {
			ct=new ConnDB().getConn();
			ps=ct.prepareStatement("select count(*) from goods");
			rs=ps.executeQuery();
			if(rs.next()){
				rowCount=rs.getInt(1);
			}
			if(rowCount%pageSize==0){
				pageCount=rowCount/pageSize;
			}else{
				pageCount=rowCount/pageSize+1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return pageCount;
	}
//******************************************************************************************************
	
//=============================分页显示货物信息====================================
	/*
	 * @parameter int pageSize: 每页几条记录
	 * @parameter int pageNow: 现在要显示第几页
	 * @return ArrayList: 就是要显示的货物 
	 */
	public ArrayList getGoodsByPage(int pageSize, int pageNow){
		ArrayList al=new ArrayList();
		try {
			ct=new ConnDB().getConn();
			ps=ct.prepareStatement("select top "+pageSize+" * from goods where goodsId not in (select top "+(pageNow-1)*pageSize+" goodsId from goods)");
			rs=ps.executeQuery();
			while(rs.next()){
				GoodsBean gb=new GoodsBean();
				gb.setGoodsId(rs.getInt(1));
				gb.setGoodsName(rs.getString(2));
				gb.setGoodsIntro(rs.getString(3));
				gb.setGoodsPrice(rs.getFloat(4));
				gb.setGoodsNum(rs.getInt(5));
				gb.setPublisher(rs.getString(6));
				gb.setPhoto(rs.getString(7));
				gb.setType(rs.getString(8));
				al.add(gb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	
	
	
	
	
	
//*****************************************************************************************************	

	
//=====================================CLOSE=======================================
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
//*****************************************************************************************************
	
	
	
}
