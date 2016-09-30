//如果一个servlet只处理一逻辑，就没必要用type参数
//这个servlet用于检测有没有登录过，可以查看session中有没有用户登录信息
package com.rush.servlet;

import com.rush.model.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String type=request.getParameter("type");
		UserBean ub=(UserBean)request.getSession().getAttribute("userInfo");
//=================================1. 购物前点右上角================================
		if(type.equals("new")){
			if(ub==null){		//说明用户没有登录
				request.getRequestDispatcher("preLogin.jsp").forward(request, response);
			}else{	//Session里已经有了，说明登录过了
				request.getRequestDispatcher("index.jsp?state=logged").forward(request, response);
			}
//******************************************************************************************************			
//=================================2. 购物中(正常情况)==============================
		
		}else if(type.equals("normal")){
			
			if(ub==null){
				//说明用户没有登录，就跳转到login.jsp
				request.getRequestDispatcher("login.jsp").forward(request,response);
			}else{
				//2. 把购物车的信息取出来，准备进入下一个页面显示
				MyCartBO mcb=(MyCartBO)request.getSession().getAttribute("mycart");
				ArrayList al=mcb.showMyCart();
				request.setAttribute("mycartInfo",al);  //因为购物信息太大，不适合放入Session，放入request就行
				request.getRequestDispatcher("order.jsp").forward(request,response);
				
			}
		}
	}
//******************************************************************************************************

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request,response);

	}

}
