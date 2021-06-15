<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="pro.ProDAO" %>
<%@ page import="pro.Pro" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>WS Shopping Product</title>
<style type = "text/css">
    a, a:hover
    {
        color: #000000;
        text-decoration: none;
    }
</style>
</head>
<body>
	<%
		String RID = null;
		if (session.getAttribute("RID") != null) {
			RID =(String) session.getAttribute("RID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
				<li><a href="Rmain.jsp">메인</a></li>
				<li><a href="Rannounce.jsp">공지사항</a></li>
				<li class="active"><a href="Rproducts.jsp">제품</a></li>
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
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
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
	<div class="container">
		<div class ="row">
			<table class="table table-striped" style="text-align; center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">제품번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제품이름</th>
						
						<th style="background-color: #eeeeee; text-align: center;">가격</th>
						
					</tr>
				</thead>
				<tbody>
					<%
						ProDAO proDAO = new ProDAO();
						ArrayList<Pro> list = proDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%= list.get(i).getPNum() %></td>
						<td><a href="RProview.jsp?PNum=<%=list.get(i).getPNum() %>"><%= list.get(i).getPName() %></a></td>
						<td><%= list.get(i).getPPrice() %></td>
						
						
						
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			 <%
                if(pageNumber != 1) {
            %>
                <a href="products.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
            <%
                } if (proDAO.nextPage(pageNumber + 1)) {
            %>
                <a href="products.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
            
            <%
                }
            %>
			<a href="Prowrite.jsp" class="btn btn-primary pull-right">제품올리기</a>
		</div>
	</div>
	<script src ="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src ="js/bootstrap.min.js"></script>
</body>
</html>