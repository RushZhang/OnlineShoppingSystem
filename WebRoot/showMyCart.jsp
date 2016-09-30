<%@ page language="java" import="java.util.*, com.rush.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//取出al,这些只是购物车里的东西(注意这里是attribute不是parameter)
ArrayList al=(ArrayList)request.getAttribute("mycartinfo");
//从session中取出购物车(就只是为了调用一下mcb.getGoodsNumById（）这个函数)
MyCartBO mcb=(MyCartBO)session.getAttribute("mycart");//再次注意这里用的是session取购物车，而不是新建
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showMyCart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/1.css">
	<script type="text/javascript">
	//响应删除全部
		function delAll(){
		window.open("ShoppingServlet?type=delAll","_self");
	}
	</script>
	
	
  </head>
  
  <body topmargin="0" background="images/bg.bmp">
  <center>
    <table width="80%" border="1">
  <tr>
    <td><jsp:include flush="true" page="head.jsp"></jsp:include></td>
  </tr>
  <tr>
    <td>
    <form action="ShoppingServlet?type=updateGoods" method="post">
    <table width="100%" border="1">
    
      <tr>
        <td colspan="6"><div align="center"><img src="images/cartnavi-1.gif" width="659" height="49" /></div></td>
        </tr>
      <tr>
        <td width="202" align="center">No.</td>
        <td width="235" align="center">Name</td>
        <td width="235" align="center">Unit Price </td>
        <td colspan="3" align="center">Quantity</td>
      </tr>
      <%
      	for(int i=0;i<al.size();i++){
      		//从al中取出货物
      		GoodsBean gb=(GoodsBean)al.get(i);
      		%>
		      <tr align="center">
		        <td width="202"><%=gb.getGoodsId() %></td>
		        <td width="235"><%=gb.getGoodsName() %></td>
		        <td width="235"><%=gb.getGoodsPrice() %></td>
		        <!-- 下面的就是隐藏表单 -->
		        <td width="126"><input type="hidden" name="goodsId" value="<%=gb.getGoodsId() %>"><input name="newNums" type="text" size="14" value="<%=mcb.getGoodsNumById(gb.getGoodsId()+"") %>"/></td>
		        <td width="143"><label><a href="ShoppingServlet?type=delGoods&goodsId=<%=gb.getGoodsId() %>">delete</a></label></td>
		        <td width="122"><a href="ShowGoodsServlet?type=showDetail&id=<%=gb.getGoodsId() %>">view</a></td>
		      </tr>
		      		
      		<%
      	}
      %>
    
      <tr>
        <td width="202">&nbsp;</td>
        <td width="235" align="center" valign="top">
          <label>
            <input type="button" onclick="delAll();" name="Submit" value="Delete All" />
            </label>
               </td>
        <td width="235" align="center" valign="top"><input name="Submit2" type="submit" value="Alter Quantity" /></td>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="6">&nbsp;</td>
        </tr>

    </table>
    </form>
      <table width="100%" border="1">
        <tr>
          <td>You have selected $<%=mcb.getAllPrice() %> goods, click <a href="index.jsp">here</a> to continue the shopping </td>
          <td align="right"><a href="LoginServlet?type=normal"><img src="images/cartnext.gif" width="87" height="19" /></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><jsp:include flush="true" page="tail.jsp"></jsp:include></td>
  </tr>
</table>

  </center>
  </body>
</html>
