//得到数据库的链接
package com.rush.model;

import java.sql.*;

public class ConnDB {
	private Connection ct=null;
	public Connection getConn(){
		try{
			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
			ct=DriverManager.getConnection("jdbc:microsoft:sqlserver://127.0.0.1:1433;databaseName=shopping", "sa", "" );
		}catch(Exception e){
			e.printStackTrace();
		}
		return ct;
	}
}
