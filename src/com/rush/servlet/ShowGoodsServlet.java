//这个servlet做的事是，从主页得到一个商品的id，调用BO，返回整个商品信息到详细页面
package com.rush.servlet;
import java.io.IOException;
import com.rush.model.*;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowGoodsServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//如果要显示中文就需要加这一句话：
		response.setCharacterEncoding("utf-8");
		//得到type，判断用户是想分页还是想显示货物的详细信息
		String type=request.getParameter("type");
		if(type.equals("showDetail")){
			//得到要显示货物的id
			String goodsId=request.getParameter("id");//看来reqest接收到的都是string
			//调用Bo(可以帮助得到商品的具体信息）
			GoodsBean gb=new GoodsBeanBO().getGoodsBean(goodsId);
			//把gbb放到request
			request.setAttribute("goodsInfo", gb);
			//跳转（这里没用response.sendRedirect(url?x=...)
			request.getRequestDispatcher("showDetail.jsp").forward(request, response);
		}else if(type.equals("page")){
			//得到pageNow
			String pageNow=request.getParameter("pageNow");
			//调回购物大厅，把pageNow顺便放入request
			request.setAttribute("changedPage", pageNow);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
