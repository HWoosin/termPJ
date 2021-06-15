<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "anc.AnCDAO" %>
<%@ page import= "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="anc" class= "anc.AnC" scope="page"/>
<jsp:setProperty name = "anc" property="ATitle"/>
<jsp:setProperty name = "anc" property="AContents"/>

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
		if(RID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'Rlogin.jsp'");
			script.println("</script>");
		}else{
			if(anc.getATitle() == null || anc.getAContents() == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
			}else {
				AnCDAO ancDAO = new AnCDAO();
				int result = ancDAO.write(anc.getATitle(), anc.getAContents(),anc.getAID());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'Rannounce.jsp'");
					script.println("</script>");
				}
			}
			
		}

		
			
	%>
	
</body>
</html>