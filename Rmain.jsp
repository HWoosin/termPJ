<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>WS Shopping Main</title>
</head>
<body>
	<%
		String RID = null;
		if (session.getAttribute("RID") != null) {
			RID =(String) session.getAttribute("RID");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="Rmain.jsp">WS Shopping 관리자 모드</a>
		</div>
		<div class="collaspe navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class ="nav navbar-nav">
				<li class="active"><a href="Rmain.jsp">메인</a></li>
				<li><a href="Rannounce.jsp">공지사항</a></li>
				<li><a href="Rproducts.jsp">제품</a></li>
				<li><a href="RQnA.jsp">QnA</a></li>
				<li><a href="ROrder.jsp">주문현황</a></li>
			</ul>
			<%
				if(RID == null) {
			%>
			<ul class ="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="AdlogoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else {
			%>
			<ul class ="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="AdlogoutAction.jsp">로그아웃</a></li>
						
					</ul>
				</li>
			</ul>
			<%
				}
			%>	
			
		</div>
	</nav>	

	<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src ="js/bootstrap.min.js"></script>
</body>
</html>