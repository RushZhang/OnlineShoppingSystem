<%@ page language="java" import="java.util.*, com.rush.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//===============================使用BO完成分页（这样不完美，应该调用controller）==========================
	GoodsBeanBO gbb=new GoodsBeanBO();
	//接受最新的page
	String changedPage=(String)request.getAttribute("changedPage");
	int intChangedPage=1;
	if(changedPage!=null){
		intChangedPage=Integer.parseInt(changedPage);
	}
	ArrayList al=gbb.getGoodsByPage(6,intChangedPage);//默认第一页
	//得到共有多少页
	int pageCount=gbb.getPageCount(6);
%>

<table width="100%" border="1">
  <tr>
    <td colspan="3"><div align="left"><img src="images/untitled.bmp" height="50"/></div></td>
  </tr>
  
  <%
  	int time=0;
  	for(int i=0; i<2; i++){
  		//打印两大行（每行三个，但也可能不够显示器）;
  		%>
  		<tr>
  		<%
  		//取出3个
  		for(int j=0; j<3; j++){
  			GoodsBean gb=new GoodsBean();
  			if(time>=al.size()){ //此时不能再取了
  				//默认给一个goodsBean（荷花）
  				gb.setGoodsId(0);
  				gb.setGoodsIntro("There is no more goods");
  				gb.setPhoto("none.gif");
  				gb.setGoodsPrice(0.0f);
  				gb.setGoodsName("None");
  				gb.setType("None");
  			}else{
  				gb=(GoodsBean)al.get(time++);
  			}
  		%>
  	<td width="33%"><table width="100%" border="1">
      <tr>
        <td width="18%" rowspan="3"><img src="logo/<%=gb.getPhoto() %>" width="138" height="217" /></td>
        <td width="82%" height="100"><a href="ShowGoodsServlet?type=showDetail&id=<%=gb.getGoodsId() %>">Title:<%=gb.getGoodsName() %></a></td>
      </tr>
      <tr>
        <td height="95">Type: <%=gb.getType() %></td>
      </tr>
      <tr>
        <td height="33%">Price: <%=gb.getGoodsPrice() %> </td>
      </tr>
      <tr>
        <td height="25" colspan="2">Description: <%=gb.getGoodsIntro() %> </td>
        </tr>
    </table></td>
  			<%
  		}
  		%>
  		</tr>
  		<%
  		//判断是否第一大行结束
  		if(i==0){
  			%>
  			<tr>
    			<td colspan="3" bgcolor="#FFFFCC">&nbsp;</td>
 			</tr>
  			<%
  		}
  	}
  %>
 
 
  <tr>
    <td colspan="3"><div align="center">
		<%
			for(int i=1; i<=pageCount; i++){
				%>
				<a href="ShowGoodsServlet?type=page&pageNow=<%=i %>">[<%=i %>]&nbsp;&nbsp;</a>
				<%
			}
		%>
	</td>
  </tr>
</table>