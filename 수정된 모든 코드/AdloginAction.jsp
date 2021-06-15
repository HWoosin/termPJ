<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "adm.AdminDAO" %>
<%@ page import= "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="adm" class="adm.Admin" scope="page"/>
<jsp:setProperty name = "adm" property="RID"/>
<jsp:setProperty name = "adm" property="RPW"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>WS Shopping</title>
</head>
<body>
	<%
		String RID = null;
		if(session.getAttribute("RID") != null ) {
			RID = (String) session.getAttribute("RID");
		}
		if(RID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href = 'Rmain.jsp'");
			script.println("</script>");
		}
		AdminDAO adminDAO = new AdminDAO();
		int result  = adminDAO.Admlogin(adm.getRID(), adm.getRPW());
		if (result == 1){ 
			session.setAttribute("RID", adm.getRID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'Rmain.jsp'");
			script.println("</script>");
		}
		else if (result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀렸습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			
			
		}
	%>
	
</body>
</html>