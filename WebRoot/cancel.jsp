<%@ page language="java"
	import="java.util.*,java.sql.*,cn.edu.dhu.*,java.util.regex.Matcher,java.util.regex.Pattern"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cancel.jsp</title>
</head>
<body>
	<%
		Pattern p = Pattern.compile("[^0-9]");

		String userid = (String) session.getAttribute("userid");

		String username = request.getParameter("applyname");
		String classroom = request.getParameter("classroom");
		String period = request.getParameter("period");
		String weekday = request.getParameter("weekday");
		String week = request.getParameter("week");
		String activity = request.getParameter("activity");

		/*
		System.out.println(userid);
		System.out.println(username);
		System.out.println(classroom);
		System.out.println(period);
		System.out.println(weekday);
		System.out.println(week);
		System.out.println(activity);
		 */

		Matcher m;
		//System.out.println("执行到了");

		m = p.matcher(period);
		period = m.replaceAll("").trim();

		m = p.matcher(weekday);
		weekday = m.replaceAll("").trim();

		m = p.matcher(week);
		week = m.replaceAll("").trim();

		//System.out.println("username:" + username);
		//System.out.println("account:" + account);
		//System.out.println("password:" + pswd);
		//System.out.println("email:" + email);

		if (userid != null && username != null && classroom != null
				&& period != null && weekday != null && week != null) {

			String sql = "delete from apply where userid = '"
					+ userid + "' and username = '"
					+ username + "' and classroom = '"
					+ classroom + "' and period = "
					+ Integer.parseInt(period) + " and weekday = "
					+ Integer.parseInt(weekday) + " and week = "
					+ Integer.parseInt(week);

			//System.out.println("执行到了");
			Connection conn = DB.getConn();
			//System.out.println("执行到了");
			Statement stmt = DB.createStmt(conn);
			//System.out.println("执行到了");
			DB.executeUpdate(stmt, sql);
			//System.out.println("执行到了");		

			conn.close();
			stmt.close();
			
			out.print("<script>alert('已取消！');window.location.href('result-datatable.jsp');</script>");

		}
	%>
</body>
</html>