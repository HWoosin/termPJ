<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>WS Shopping</title>
</head>
<body>
		<%
		String ID = null;
		if (session.getAttribute("ID") != null) {
			ID =(String) session.getAttribute("ID");
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
			<a class="navbar-brand" href="main.jsp">WS Shopping</a>
		</div>
		<div class="collaspe navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class ="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="announce.jsp">공지사항</a></li>
				<li class="active"><a href="products.jsp">제품</a></li>
				<li><a href="QnA.jsp">QnA</a></li>
			</ul>
			<%
				if(ID == null) {
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
						<li><a href="logoutAction.jsp">로그아웃</a></li>
						
					</ul>
				</li>
			</ul>
			<%
				}
			%>	
			
		</div>
	</nav>	
	<div class ="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px">
				<form method="post" action="OrderAction.jsp">
					<h3 style="text-align; center;">주문 화면</h3>
				
					<div class="form-group">
						<input type="text" class="form-control" placeholder="주문제품" name="OOproduct" maxlength="20">
					</div>
					
					
					  <div class ="form-group" style="text-align: center;">
                        <div class="btn-group" data-toggle="buttons">
                            <label class="btn btn-primary active">
                                <input type="radio" name="OOsize" autocomplete="off" value="S" checked>S
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="OOsize" autocomplete="off" value="M" checked>M
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="OOsize" autocomplete="off" value="L" checked>L
                            </label>
                            </div>    
                    </div>
					<input type="submit" class="btn btn-primary form-control" value="주문하기">
				</form>
			</div>
		</div>	
		<div class="col-lg-4"></div>
	</div>	

	<script src ="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src ="js/bootstrap.min.js"></script>
</body>
</html>