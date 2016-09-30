//Viewer调用Controller通过传参数，Controller调用Model就是用过model包里的对象方法调用
//Controller再调用viewer就response.sendRedirect(..), 或者request.getRequestDispatcher(...).forward(req,res);
package com.rush.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rush.model.MyCartBO;

public class ShoppingServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//得到type值，判断用户是要怎样的操作
		String type=request.getParameter("type");
//-------------------------------拿到购物车---------------------------------------
		//调用MyCartBO,完成购物.  因为购物车是各种操作公用的，所以放到外边
		//但是不能这样写，会导致有多个购物车，改为session。MyCartBO mcb=new MyCartBO();
		MyCartBO mcb=(MyCartBO)request.getSession().getAttribute("mycart");
		if(mcb==null){ //说明用户第一次购物,则创建一个购物车放到session
			mcb=new MyCartBO();
			request.getSession().setAttribute("mycart", mcb);
		}
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		//一个servlet有多个操作，用参数来做判断
		if(type.equals("addGoods")){ //添加
		
			//获得要购买的货物的id
			String goodsId=request.getParameter("goodsId");
			
			//默认购买一本书，之后可以再进行修改
			mcb.addGoods(goodsId, "1");
			
		}else if(type.equals("delGoods")){	//删除
			String goodsId=request.getParameter("goodsId");
			mcb.delGoods(goodsId);
		}
		else if(type.equals("show")){	} //什么都不做，用公共代码
		else if(type.equals("delAll")){  //全部删除
			mcb.clear();
		}else if(type.equals("updateGoods")){ //用户希望修改数量
			//怎么在servlet中得到货物的id和新的数量（难点），这里使用隐藏表单！！隐藏表单可以传多个参数
			String goodsId[]=request.getParameterValues("goodsId");//注意！getParameterValues得到的是数组
			String newNums[]=request.getParameterValues("newNums");
			for(int i=0; i<goodsId.length;i++){  //循环修改
				mcb.updateGoods(goodsId[i], newNums[i]);
			}
		}

//-------------------------------很多操作都公用这段代码---------------------------
		//把购物车的货物取出来，准备在下一个页面显示
		ArrayList al=mcb.showMyCart();
		request.setAttribute("mycartinfo",al);
		request.getRequestDispatcher("showMyCart.jsp").forward(request,response);
	
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request,response);
	}

}
