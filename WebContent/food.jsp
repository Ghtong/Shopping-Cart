<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import='java.util.List'%>
<%@ page import='Module.FoodBean'%>
<%@ page import='DAO.FoodDAO'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		List<FoodBean> foodList = FoodDAO.getFood();
	%>
	<%
		for (int i = 0; i < foodList.size(); ++i) {
	%>
	<div class="media">
		<div class="media-left">
			<a href="#"> <img class="media-object"
				src=<%=foodList.get(i).getImg()%> alt="img" />
			</a>
		</div>
		<div class="media-body">
			<h4 class="media-heading"><%=foodList.get(i).getItemName()%></h4>
			<span class="mu-menu-price">$<%=foodList.get(i).getPrice()%></span><br>
			<span class="mu-menu-count">Count : <%=foodList.get(i).getItemCount()%></span>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>