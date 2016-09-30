<%@ page language="java" import="java.util.*, com.rush.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//取出要显示的信息，也就是goodsBean
GoodsBean gb=(GoodsBean)request.getAttribute("goodsInfo");//直接request.getAttribute得到object

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showDetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/1.css">
	<script type="text/javascript">
		function returnHall(){
			//默认情况是打开新页面，如果后边加上_self则替换原页面
			window.open("index.jsp","_self");
		}
		//响应点击购买货物的事件
		function addGoods(goodsId){  //这跟直接href有什么区别？
			//向ShoppingServlet请求添加货物
			window.open("ShoppingServlet?type=addGoods&goodsId="+goodsId,"_self");
			
		}
	</script>
	
	
  </head>
  
  <body topmargin="0" background="images/bg.bmp">
    <center>
    	<table width="80%" border="1">
  <tr>
    <td align="center">
    	<jsp:include flush="true" page="head.jsp"></jsp:include>	
    </td>
  </tr>
  <tr>
    <td align="center"><table class="abc" width="100%" border="1">
      <tr>
        <td colspan="2">&nbsp;</td>
        </tr>
      <tr>
        <td width="25%" rowspan="8"><img src="logo/<%=gb.getPhoto() %>" width="186" height="202" /></td>
        <td align="center"><%=gb.getGoodsName() %></td>
      </tr>
      <tr>
        <td align="left">Price: <%=gb.getGoodsPrice() %> </td>
      </tr>
      <tr>
        <td align="left">&nbsp;</td>
      </tr>
      <tr>
        <td align="left">ISBN: <%=gb.getGoodsId() %> </td>
      </tr>
      <tr>
        <td>Type: <%=gb.getType() %> </td>
      </tr>
      <tr>
        <td>Publisher: <%=gb.getPublisher() %> </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="73" valign="top"><%=gb.getGoodsIntro() %> </td>
      </tr>
      <tr>
        <td colspan="2"><form id="form1" name="form1" method="post" action="">
          <label>
            <input type="button" name="Submit" onclick="addGoods(<%=gb.getGoodsId() %>);" value="Purchase" />
            </label>
          <input type="button" name="Submit2"  onclick="returnHall();" value="Back to Index" />
          <!-- 以前的方法input type写"submit" 再在form的action里写要跳转的url -->
        </form>
        </td>
        </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center"><jsp:include flush="true" page="tail.jsp"></jsp:include></td>
  </tr>
</table>
    </center>
  </body>
</html>
