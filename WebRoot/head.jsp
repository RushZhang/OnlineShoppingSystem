<%@ page language="java" import="java.util.*, com.rush.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserBean ub=(UserBean)request.getSession().getAttribute("userInfo");
%>
<table width="100%" border="1">
  <tr>
    <td colspan="3" bgcolor="#66FF66">&nbsp;</td>
  </tr>
  <tr>
    <td width="13%"><a href="index.jsp"><img src="logo/000.jpg" width="168" height="123" /></a></td>
    <td width="70%"><div align="center"><img src="logo/logo.png" width="505" height="129" align="middle" /></div></td>
    <td width="17%" align="center"><p class="STYLE1"><img src="images/account.gif" width="19" height="14" /><a href="LoginServlet?type=new">[Log in/Sign up]</a></p>
    <p class="STYLE1"><img src="images/cart.gif" width="20" height="15" /><a href="ShoppingServlet?type=show">[My Order] </a></p></td>
  </tr>
  <tr>
    <td colspan="3" bgcolor="#66FF66"><%
    	if(ub!=null){
    		String uName=ub.getUsername();
    		%>
    		Welcome to my Website, <%=uName %>!   &nbsp;&nbsp;&nbsp;&nbsp;To log out, click <a href="index.jsp?state=logout">here</a>
    		<%
    	}
    %>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><table width="100%" border="1">
      <tr>
        <td width="8%" class="abc">&nbsp;</td>
        <td width="8%" class="navi"><a href="index.jsp">INDEX</a></td>
        <td width="8%" class="abc">&nbsp;</td>
        <td width="8%" class="navi">US MOVIE </td>
        <td width="8%" class="abc">&nbsp;</td>
        <td width="8%" class="navi">OTHER  </td>
        <td width="8%" class="abc">&nbsp;</td>
        <td width="8%" class="navi">ABOUT </td>
        <td width="8%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>