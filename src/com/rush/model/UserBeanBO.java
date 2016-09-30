package com.rush.model;
import java.sql.*;

public class UserBeanBO {
	private Connection ct=null;
	private ResultSet rs=null;
	private PreparedStatement ps=null; 
//=====================================Get User======================================
	public UserBean getUserBean(String u){ //通过一个userid返回整个user信息
		UserBean ub=new UserBean();
		try {
			ct=new ConnDB().getConn()	;
			ps=ct.prepareStatement("select top 1 * from users where username=?");
			ps.setString(1, u);
			rs=ps.executeQuery();
			if(rs.next()){
				ub.setUserid(rs.getLong(1));
				ub.setUsername(rs.getString(2));
				ub.setTruename(rs.getString(3));
				ub.setPasswd(rs.getString(4));
				ub.setEmail(rs.getString(5));
				ub.setPhone(rs.getString(6));
				ub.setAddress(rs.getString(7));
				ub.setPostcode(rs.getString(8));
				ub.setGrade(rs.getInt(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return ub;
		
	}
//******************************************************************************************************	
	
//================================Check User=========================================
	public boolean checkUser(String u, String p){
		boolean b=false;
		try {
			ct=new ConnDB().getConn();
			ps=ct.prepareStatement("select top 1 passwd from users where username=?");//添加top可以加快效率
			ps.setString(1,u);
			rs=ps.executeQuery();
			if(rs.next()){
				String dbPasswd=rs.getString(1);
				if(dbPasswd.equals(p)){
					b=true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.close();
		}
		return b;
	}
//******************************************************************************************************
	

//==================================Add User========================================
	public boolean addUser(String[] users){
		boolean flag=false;
		UserBean ub=new UserBean();
		try {
			ct=new ConnDB().getConn();
			ps=ct.prepareStatement("insert into users(username,truename,passwd,email,phone,address,postcode) values (?,?,?,?,?,?,?)");
			for(int i=0; i<users.length; i++){
				ps.setString(i+1, users[i]);
			}
			int resultOfUpdate=ps.executeUpdate();
			if(resultOfUpdate==1){
				flag=true;
			}
			return flag;
		}catch(Exception e){
			return false;
		}finally{
			this.close();
		}	
	}
//******************************************************************************************************
	
//==================================Update User========================================
		public boolean updateUser(String[] alteredUsers){
			
			try{
				ct=new ConnDB().getConn();
				ps=ct.prepareStatement("update users set username=?,  truename=?, address=?, phone=?, email=?, postcode=? where userid=?");
				for(int i=0; i<alteredUsers.length-1;i++){
					ps.setString(i+1, alteredUsers[i]);
				}
				int j=alteredUsers.length;
				ps.setInt(j, Integer.parseInt(alteredUsers[j-1]));
				
				int resultCount=ps.executeUpdate();
				if(resultCount==1){
					return true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.close();
			}
			return false;	
		}
	//******************************************************************************************************

//----------------------------------------------------------------------------------	
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
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
}
