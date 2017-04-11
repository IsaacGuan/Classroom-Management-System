<%@ page language="java" import="java.util.*,java.sql.*,cn.edu.dhu.*" pageEncoding="utf-8" contentType="text/html,charset=gbk"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>userupdate.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<%
		String username = request.getParameter("username");
		String account = request.getParameter("account");
		String pswd = request.getParameter("password1");
		String pswd2 = request.getParameter("password2");
		String email = request.getParameter("email");

		String pageid = (String) session.getAttribute("pageid");

		//System.out.println("username:" + username);
		//System.out.println("account:" + account);
		//System.out.println("password:" + pswd);
		//System.out.println("email:" + email);

		if (!pswd.equals(pswd2)) {

			if (pageid.equals("1")) {
				response.sendRedirect("tables-datatables.jsp");
				return;
			}
			if (pageid.equals("2")) {
				response.sendRedirect("today-datatable.jsp");
				return;
			}
			if (pageid.equals("3")) {
				response.sendRedirect("free-datatable.jsp");
				return;
			}
			if (pageid.equals("4")) {
				response.sendRedirect("apply-datatable.jsp");
				return;
			}
			if (pageid.equals("5")) {
				response.sendRedirect("result-datatable.jsp");
				return;
			}
			if (pageid.equals("6")) {
				response.sendRedirect("manager1-datatable.jsp");
				return;
			}
			if (pageid.equals("7")) {
				response.sendRedirect("manager2-datatable.jsp");
				return;
			}
			if (pageid.equals("8")) {
				response.sendRedirect("activity-datatable.jsp");
				return;
			}

		}

		if (account != null && account != "" && pswd != null && pswd != "") {

			String sql = "update jsgl.user set account = '" + account
					+ "', password1 = '" + pswd + "', password2 = '" + pswd
					+ "', email = '" + email + "' where username ='"
					+ username + "';";
			//System.out.println("执行到了");
			Connection conn = DB.getConn();
			//System.out.println("执行到了");
			Statement stmt = DB.createStmt(conn);
			//System.out.println("执行到了");
			DB.executeUpdate(stmt, sql);
			//System.out.println("执行到了");

			session.setAttribute("account", account);
			
			if (pageid.equals("1")) {
				response.sendRedirect("tables-datatables.jsp");
				return;
			}
			if (pageid.equals("2")) {
				response.sendRedirect("today-datatable.jsp");
				return;
			}
			if (pageid.equals("3")) {
				response.sendRedirect("free-datatable.jsp");
				return;
			}
			if (pageid.equals("4")) {
				response.sendRedirect("apply-datatable.jsp");
				return;
			}
			if (pageid.equals("5")) {
				response.sendRedirect("result-datatable.jsp");
				return;
			}
			if (pageid.equals("6")) {
				response.sendRedirect("manager1-datatable.jsp");
				return;
			}
			if (pageid.equals("7")) {
				response.sendRedirect("manager2-datatable.jsp");
				return;
			}
			if (pageid.equals("8")) {
				response.sendRedirect("activity-datatable.jsp");
				return;
			}

		}
	%>
</body>
</html>
