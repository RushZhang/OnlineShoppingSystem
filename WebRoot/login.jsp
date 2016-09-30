<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/1.css">
	<script type="text/javascript">
		function next(){
			alert("Click login or sign up");
		}
	</script>
  </head>
  
  <body topmargin="0" background="images/bg.bmp">
  	
  	
    <table width="80%" border="1" align="center">
  <tr>
    <td align="center"><jsp:include flush="true" page="head.jsp"></jsp:include></td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="1">
      <tr align="center">
        <td><img src="images/cartnavi-2.gif" width="599" height="49" align="middle" /></td>
      </tr>
      <tr align="center">
        <td>
        <form action="LoginValidator" method="post">
        <!-- 隐藏表单 -->
        <input type="hidden" name="type" value="normal"/>
        <table width="45%" border="1" bordercolor="#33CC66">
          <tr align="center">
            <td colspan="2"><img src="images/dl.gif" width="149" height="63" /></td>
            </tr>
          <tr align="right">
            <td width="239">Username：</td>
            <td width="239" align="left"><label>
              <input name="username" type="text" size="18" />
            </label></td>
          </tr>
          <tr align="right">
            <td width="239">Password：</td>
            <td width="239" align="left"><input name="password" type="password" size="18" /></td>
          </tr>
          <tr align="right">
            <td width="239"><label>
              <input type="submit" name="Submit" value="Login" />
            </label></td>
            <td width="239" align="left"><input type="button" name="Submit2" value="Sign Up" /></td>
          </tr>
        </table>
        </form>
        </td>
      </tr>
      <tr align="right">
        <td><img src="images/cartnext.gif" width="87" onclick="next();" height="19" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center"><jsp:include flush="true" page="tail.jsp"></jsp:include></td>
  </tr>
</table>
  </body>
</html>
