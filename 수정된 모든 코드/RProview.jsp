<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="pro.Pro" %>
<%@ page import="pro.ProDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
<title>WS Shopping</title>
</head>
<body>
<%
    String RID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("RID") != null)
    {
        RID = (String)session.getAttribute("RID");
    }
    int PNum = 0;
    if (request.getParameter("PNum") != null)
    {
    	PNum = Integer.parseInt(request.getParameter("PNum"));
    }
    if (PNum == 0)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다')");
        script.println("location.href = 'RQnA.jsp'");
        script.println("</script>");
    }
    Pro pro = new ProDAO().getPro(PNum);
%>
    <nav class ="navbar navbar-default">
        <div class="navbar-header"> <!-- 홈페이지의 로고 -->
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expand="false">
                <span class ="icon-bar"></span> <!-- 줄였을때 옆에 짝대기 -->
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
            </button>
            <a class ="navbar-brand" href="Rmain.jsp">WS Shopping 관리자 모드</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="Rmain.jsp">메인</a></li>
                <li><a href="Rannounce.jsp">공지사항</a></li>
                <li class="active"><a href="Rproducts.jsp">제품</a></li>
				<li><a href="RQnA.jsp">QnA</a></li>
				<li><a href="ROrder.jsp">주문현황</a></li>
            </ul>
            <%
            // 접속하기는 로그인이 되어있지 않은 경우만 나오게한다
                if(RID == null)
                {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">접속하기<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="login.jsp">로그인</a></li>
                        <li><a href="join.jsp">회원가입</a></li>                    
                    </ul>
                </li>
            </ul>
            <%
            // 로그인이 되어있는 사람만 볼수 있는 화면
                } else {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">회원관리<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="AdloginAction.jsp">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="3" style="background-color:#eeeeee; text-align:center;">게시판 글 보기</th>
 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width:20%;">제품명</td>
                        <td colspan="2"><%= pro.getPName()%></td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td colspan="2"><%= pro.getPPrice()%></td>
                    </tr>

                       
                    <tr>
                        <td>제품설명</td>
                        <td colspan="2" style="min-height:200px; text-align:left;">
                        
                        <%= pro.getPPexplain()%></td>    
                    </tr>
                </tbody>
            </table>
            <a href="Rproducts.jsp" class="btn btn-primary">목록</a>
            
          
                
      
        </div>
    </div>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
