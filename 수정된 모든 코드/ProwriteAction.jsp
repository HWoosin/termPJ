<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "pro.ProDAO" %>
<%@ page import= "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="pro" class= "pro.Pro" scope="page"/>
<jsp:setProperty name = "pro" property="PName"/>
<jsp:setProperty name = "pro" property="PPrice"/>
<jsp:setProperty name = "pro" property="PPexplain"/>

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
			if(pro.getPName() == null || pro.getPPrice() == null || pro.getPPexplain() == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
			}else {
				ProDAO proDAO = new ProDAO();
				int result = proDAO.write(pro.getPName(), pro.getPPrice(), pro.getPPexplain());
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
					script.println("location.href = 'Rproducts.jsp'");
					script.println("</script>");
				}
			}
			
		}

		
			
	%>
	
</body>
</html>