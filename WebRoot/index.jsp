<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String state=request.getParameter("state");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--这里引入css-->
	<link rel="stylesheet" type="text/css" href="css/1.css">
	<link rel="stylesheet" type="text/css" href="css/2.css">
	<script type="text/javascript">
		function ok(){
			alert("Login succeed");
		}	
		function error(){
			alert("Username or Password Wrong!");
		}
		function logged(){
			alert("You have already logged");
		}
		function signUpOK(){
			alert("You have already signed up, please remember your Username and Password");
		}
		function signUpError(){
			alert("Something wrong with your input");
		}
	</script>
  </head>
  
  <body topmargin="5" background="images/bg.bmp">
  
  	<%if(state!=null){	
		  	if (state.equals("ok")){
		  		%>
		  		<script type="text/javascript">ok();</script>
		  		<%
		  	}else if(state.equals("error")){
		  		%>
		  		<script type="text/javascript">error();</script>
		  		<%
		  	}else if(state.equals("logged")){
		  		%>
		  		<script type="text/javascript">logged();</script>
		  		<%
		  	}else if(state.equals("signUpOK")){
		  		%>
		  		<script type="text/javascript">signUpOK();</script>
		  		<%
		  	}else if(state.equals("signUpError")){
		  		%>
		  		<script type="text/javascript">signUpError();</script>
		  		<%
		  	}else if(state.equals("logout")){
		  		request.getSession().removeAttribute("userInfo");
		  		request.getSession().removeAttribute("mycart");
		  	}
  	}	  
	%>
  	
    <table width="80%" border="1" align="center">
  <tr>
    <td height="60" colspan="2" align="center" valign="middle">
    <!-- 引入head.jsp -->
    <jsp:include flush="true" page="head.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td width="21%" height="120" align="center" valign="middle">
    <jsp:include flush="true" page="left.jsp"></jsp:include>
    </td>
    <td width="81%" align="center" valign="middle">
    <jsp:include flush="true" page="right.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td height="116" colspan="2" align="center" valign="middle">
    <jsp:include flush="true" page="tail.jsp"></jsp:include>
    </td>
  </tr>
</table>
  </body>
</html>
