//用于处理于购物相关的业务逻辑
package com.rush.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class MyCartBO {
	//定义一个hashmap集合，用于存放书的id和书的数量
	HashMap<String, String> hm=new HashMap<String, String>();
	private Connection ct=null;
	private ResultSet rs=null;
	private PreparedStatement ps=null; 
	private float allPrice=0.0f;
	
	//1.添加货物
	public void addGoods(String goodsId, String goodsNum){
		hm.put(goodsId, goodsNum);
	}
	//2.删除货物
	public void delGoods(String goodsId){
		hm.remove(goodsId);
	}
	//3.清空货物
	public void clear(){
		hm.clear();
	}
	//4.修改货物数量
	public void updateGoods(String goodsId, String newNum){
		hm.put(goodsId, newNum); //这个和add一样，因为hm可以用于更新
	}
	//5.穿入goodsId返回goods的数量
	public String getGoodsNumById(String goodsId){
		return hm.get(goodsId);
	}
	//6.返回总价
	public float getAllPrice(){  //其实顺便在showMyCart的函数中已经算过了
		return this.allPrice;
	}
	
	//7.显示购物车(hashmap的迭代器去keySet）
	public ArrayList showMyCart(){
		ArrayList<GoodsBean> al=new ArrayList<GoodsBean>();
		try {
			//组织sql语句
			String sql="select * from goods where goodsId in";
			//使用迭代器完成从hm中取出货物id的要求
			Iterator it=hm.keySet().iterator();
			String sub="(";
			while(it.hasNext()){
				String goodsId=(String)it.next();
				//判断是不是最后一个id
				if(it.hasNext()){
					sub+=goodsId+",";
				}else{
					sub+=goodsId+")";
				}
			}
			if(sub.equals("(")){
				sub+="0)";
			}
			sql+=sub;
			
			ct=new ConnDB().getConn();
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			//把总价清空
			this.allPrice=0;
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
				float unitPrice=rs.getFloat(4);
				float quantity=Integer.parseInt(this.getGoodsNumById(rs.getInt(1)+""));
				this.allPrice+=unitPrice*quantity;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}

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
