<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'signUp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <table width="80%" border="1">
  <tr>
    <td><jsp:include flush="true" page="head.jsp"></jsp:include></td>
  </tr>
  <tr>
    <td><form action="Register" method="post"><table width="100%" border="1">
      <tr>
        <td colspan="2" class="llh"><center><img src="images/signUp.gif"></center></td>
        </tr>
    
      <tr>
        <td width="551" align="right" class="llh">User Name: </td>
        <td align="left" class="llh"><label>
          <input type="text" name="username" />
        </label></td>
      </tr>
      <tr>
        <td width="551" align="right" class="llh">Real Name: </td>
        <td align="left" class="llh"><input type="text" name="truename" /></td>
      </tr>
      <tr>
        <td width="551" align="right" class="llh">Password:</td>
        <td align="left" class="llh"><input type="password" name="passwd" /></td>
      </tr>
      <tr>
        <td width="551" align="right" class="llh">Email:</td>
        <td align="left" class="llh"><input type="text" name="email" /></td>
      </tr>
      <tr>
        <td width="551" align="right" class="llh">Phone:</td>
        <td align="left" class="llh"><input type="text" name="phone" /></td>
      </tr>
      <tr>
        <td width="551" align="right" class="llh">Address:  </td>
        <td align="left" class="llh"><input type="text" name="address" /></td>
      </tr>
      <tr>
        <td width="551" align="right" class="llh">Postcode:</td>
        <td align="left" class="llh"><input type="text" name="postcode" /></td>
      </tr>
      <tr>
        <td colspan="2" align="right" class="llh">&nbsp;</td>
        </tr>
      <tr>
        <td width="551" align="right" class="llh"><label>
          <input type="submit" name="Submit" value="Submit" />
        </label></td>
        <td align="left" class="llh"><input type="reset" name="Submit2" value="Reset" /></td>
      </tr>
    </table></form></td>
  </tr>
  <tr>
    <td><jsp:include flush="true" page="tail.jsp"></jsp:include></td>
  </tr>
</table>
  </body>
</html>
