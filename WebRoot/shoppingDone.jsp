<%@ page language="java" import="java.util.*, com.rush.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//订单详细信息取出来
OrderInfoBean oib=(OrderInfoBean)request.getAttribute("detailbean");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shoppingDone.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/1.css">
	<link rel="stylesheet" type="text/css" href="css/llh.css">
	

  </head>
  
  <body topmargin="0" background="images/bg.bmp">
  	<center>
    <table width="80%" border="1">
  <tr>
    <td><jsp:include flush="true" page="head.jsp"></jsp:include></td>
  </tr>
  <tr class="llh">
    <td><table width="100%" border="1" bordercolor="#3333FF">
      <tr>
        <td align="center" colspan="9"><img src="images/done.jpg"></td>
        </tr>
      <tr>
        <td colspan="9" align="center">Order's Detail </td>
        </tr>
      <tr>
        <td align="center">Order NO. </td>
        <td align="center">Receiver</td>
        <td align="center">Address</td>
        <td align="center">Postcode</td>
        <td align="center">Phone</td>
        <td align="center">Total Price </td>
        <td align="center">Username</td>
        <td align="center">Email</td>
       
      </tr>
      <tr align="center">
        <td><%=oib.getOrdersId() %></td>
        <td><%=oib.getTruename() %></td>
        <td><%=oib.getAddress() %></td>
        <td><%=oib.getPostcode() %></td>
        <td><%=oib.getPhone() %></td>
        <td>$<%=oib.getTotalPrice() %></td>
        <td><%=oib.getUsername() %></td>
        <td><%=oib.getEmail() %></td>
      </tr>
      <tr align="center">
        <td colspan="9">Your order has affirmed, goods will be delivered to your address. Click <a href="index.jsp">here</a> to continue the shopping.</td>
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
