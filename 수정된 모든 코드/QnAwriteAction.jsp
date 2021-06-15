<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "qna.QnADAO" %>
<%@ page import= "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="qna" class= "qna.QnA" scope="page"/>
<jsp:setProperty name = "qna" property="QTitle"/>
<jsp:setProperty name = "qna" property="QContents"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>WS Shopping</title>
</head>
<body>
	<%
		String ID = null;
		if(session.getAttribute("ID") != null ) {
			ID = (String) session.getAttribute("ID");
		}
		if(ID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}else{
			if(qna.getQTitle() == null || qna.getQContents() == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
			}else {
				QnADAO qnaDAO = new QnADAO();
				int result = qnaDAO.write(qna.getQTitle(), qna.getQID(), qna.getQContents());
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
					script.println("location.href = 'QnA.jsp'");
					script.println("</script>");
				}
			}
			
		}

		
			
	%>
	
</body>
</html>