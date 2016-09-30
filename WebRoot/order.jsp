<%@ page language="java" import="java.util.*, com.rush.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//得到用户信息
UserBean ub=(UserBean)session.getAttribute("userInfo");
//得到购物车信息
ArrayList al=(ArrayList)request.getAttribute("mycartInfo");
//还需要得到购物车，不然不知道商品的数量
MyCartBO mcb=(MyCartBO)session.getAttribute("mycart");
String type=request.getParameter("type");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/llh.css">
	<link rel="stylesheet" type="text/css" href="css/yyy.css">
	<link rel="stylesheet" type="text/css" href="css/1.css">
	<script type="text/javascript">
		function backToCart(){
			window.open("ShoppingServlet?type=show","_self");
		}
		function altered(){
			alert("You have successfully changed your user information!");
		}
		
	</script>
  </head>
  
  <body topmargin="0" background="images/bg.bmp">
  <%if(type.equals("altered")){
	  %>
	  <script type="text/javascript">
	  	altered();
	  </script>
	  <% 
  }	
  %>
  
  
  <center>
   <table width="80%" border="1">
  <tr>
    <td><jsp:include flush="true" page="head.jsp"></jsp:include></td>
  </tr>
  <tr>
    <td><table width="100%" border="1">
      <tr align="center">
        <td><img src="images/cartnavi-3.gif" width="599" height="49" /></td>
      </tr>
      <tr align="center">
        <td><form action="LoginValidator?type=alter" method="post"><table width="60%" border="1">
        <!-- 隐藏表单 -->
        <input type="hidden" name="id" value="<%=ub.getUserid() %>"/>
          <tr align="center">
            <td colspan="2" class="llh">Buyer's Information </td>
          </tr>
          <tr align="center">
            <td width="321" align="right" class="llh">UserName:</td>
            <td width="321" align="left" class="llh"><label>
              <input type="text" name="username" value="<%=ub.getUsername() %>"/>
            </label></td>
          </tr>
          <tr align="center">
            <td width="321" align="right" class="llh">RealName:</td>
            <td width="321" align="left" class="llh"><input type="text" name="truename" value="<%=ub.getTruename() %>"/></td>
          </tr>
          <tr align="center">
            <td width="321" align="right" class="llh">Home Address:</td>
            <td width="321" align="left" class="llh"><input type="text" name="address" value="<%=ub.getAddress() %>"/></td>
          </tr>
          <tr align="center">
            <td width="321" align="right" class="llh">Phone Number: </td>
            <td width="321" align="left" class="llh"><input type="text" name="phone" value="<%=ub.getPhone() %>"/></td>
          </tr>
          <tr align="center">
            <td width="321" align="right" class="llh">Email:</td>
            <td width="321" align="left" class="llh"><input type="text" name="email" value="<%=ub.getEmail() %>"/></td>
          </tr>
          <tr align="center">
            <td width="321" align="right" class="llh">PostCode:</td>
            <td width="321" align="left" class="llh"><input type="text" name="postcode" value="<%=ub.getPostcode() %>"/></td>
          </tr>
          <tr align="center">
            <td colspan="2" align="center" class="llh"><label></label>
            <input type="submit" name="Submit2" onclick="alter();" value="Alter Info" /></td>
          </tr>
        </table></form></td>
      </tr>
      <tr align="center">
        <td><table width="60%" border="1">
          <tr align="center" class="llh">
            <td colspan="4" class="yyy">My Shopping Cart </td>
          </tr>
          <tr align="center" class="llh">
            <td width="158" class="yyy">NO.</td>
            <td width="158" class="yyy">Goods Name </td>
            <td width="158" class="yyy">Unit Price </td>
            <td width="158" class="yyy">Quantity</td>
          </tr>
          
          
      	  <%//显示购物车的信息
	         for(int i=0;i<al.size();i++){
	         GoodsBean gb=(GoodsBean)al.get(i);
         %>
	          
	          <tr align="center" class="llh">
	            <td width="158" class="yyy"><%=gb.getGoodsId() %></td>
	            <td width="158" class="yyy"><%=gb.getGoodsName() %></td>
	            <td width="158" class="yyy"><%=gb.getGoodsPrice() %></td>
	            <td width="158" class="yyy"><%=mcb.getGoodsNumById(gb.getGoodsId()+"") %></td>
	          </tr>
        <%
         }
          %>
          
          
          <tr align="left" class="llh">
            <td colspan="4" class="yyy">You have ordered $<%=mcb.getAllPrice() %> goods. </td>
          </tr>
          <tr align="center" class="llh">
            <td colspan="4" class="llh"><label>
              <input type="submit" name="Submit3" onclick="backToCart();"value="Back to Cart" />
            </label></td>
          </tr>
        </table></td>
      </tr>
      <tr align="right">
        <td><a href="LoginValidator?type=normal"><img border='0' src="images/cartpre.gif" width="87" height="19" /></a><a href="Order"><img border="0" src="images/cartnext.gif" width="87" height="19" /></a></td>
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
