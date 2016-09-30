package com.rush.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rush.model.MyCartBO;
import com.rush.model.OrderBeanBO;
import com.rush.model.OrderInfoBean;
import com.rush.model.UserBean;

public class Order extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//处理订单任务
		OrderBeanBO obb=new OrderBeanBO();
		MyCartBO mcb=(MyCartBO)request.getSession().getAttribute("mycart");
		long userId=((UserBean)request.getSession().getAttribute("userInfo")).getUserid();
		OrderInfoBean oib=obb.addOrder(mcb, userId+"");
		if(oib!=null){
			//准备订单详细信息给下个页面显示
			request.setAttribute("detailbean", oib);
			request.getRequestDispatcher("shoppingDone.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("http://www.baidu.com").forward(request, response);
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
