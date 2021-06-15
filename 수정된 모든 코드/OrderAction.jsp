<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "ord.OrdDAO" %>
<%@ page import= "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ord" class= "ord.Ord" scope="page"/>
<jsp:setProperty name = "ord" property="OOproduct"/>
<jsp:setProperty name = "ord" property="OOsize"/>

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
			script.println("location.href = 'Rlogin.jsp'");
			script.println("</script>");
		}else{
			if(ord.getOOproduct() == null || ord.getOOsize() == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
			}else {
				OrdDAO ordDAO = new OrdDAO();
				int result = ordDAO.order(ord.getOOproduct(), ord.getOOsize(),ord.getOOID());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('주문에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('주문을 완료했습니다.')");
					script.println("location.href = 'products.jsp'");
					script.println("</script>");
				}
			}
			
		}

		
			
	%>
	
</body>
</html>