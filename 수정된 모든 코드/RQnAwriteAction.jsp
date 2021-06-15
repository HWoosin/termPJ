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
		String RID = null;
		if(session.getAttribute("RID") != null ) {
			RID = (String) session.getAttribute("RID");
		}
		if(RID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'Adlogin.jsp'");
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
				int result = qnaDAO.write(qna.getQTitle(), qna.getQContents(),qna.getQID());
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
					script.println("location.href = 'RQnA.jsp'");
					script.println("</script>");
				}
			}
			
		}

		
			
	%>
	
</body>
</html>