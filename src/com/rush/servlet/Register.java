package com.rush.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rush.model.*;
public class Register extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username=request.getParameter("username");
		String truename=request.getParameter("truename");
		String passwd=request.getParameter("passwd");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String postcode=request.getParameter("postcode");
		String[] users={username,truename,passwd,email,phone,address,postcode};
		UserBeanBO ubb=new UserBeanBO();
		if(ubb.addUser(users)){
			request.getRequestDispatcher("index.jsp?state=signUpOK").forward(request,response);
		}else{
			request.getRequestDispatcher("index.jsp?state=signUpError").forward(request,response);
		}
		
		
		
		
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
