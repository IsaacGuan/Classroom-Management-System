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
<title>approve.jsp</title>
</head>
<body>
	<%
		Pattern p = Pattern.compile("[^0-9]");

		String userid = request.getParameter("applyuserid");
		String username = request.getParameter("applyname");
		String classroom = request.getParameter("classroom");
		String period = request.getParameter("period");
		String weekday = request.getParameter("weekday");
		String week = request.getParameter("week");
		String activity = request.getParameter("activity");

		System.out.println(userid);
		System.out.println(username);
		System.out.println(classroom);
		System.out.println(period);
		System.out.println(weekday);
		System.out.println(week);
		System.out.println(activity);

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

		int startweek0 = 0, endweek0 = 0, startperiod0 = 0, endperiod0 = 0, weekday0 = 0;

		Connection conn0 = null;
		Statement stmt0 = null;
		ResultSet rs0 = null;

		try {

			conn0 = DB.getConn();
			stmt0 = DB.createStmt(conn0);
			String sql0 = "select * from classroom where weekday = "
					+ Integer.parseInt(weekday) + " and startweek <= "
					+ Integer.parseInt(week) + " and endweek >= "
					+ Integer.parseInt(week) + " and startperiod <= "
					+ Integer.parseInt(period) + " and endperiod >= "
					+ Integer.parseInt(period);
			rs0 = DB.executeQuery(stmt0, sql0);

			if (rs0.next()) {
				startweek0 = Integer.parseInt(rs0.getString("startweek"));
				endweek0 = Integer.parseInt(rs0.getString("endweek"));
				startperiod0 = Integer.parseInt(rs0
						.getString("startperiod"));
				endperiod0 = Integer.parseInt(rs0.getString("endperiod"));
				weekday0 = Integer.parseInt(rs0.getString("weekday"));
			}

		} catch (Exception e) {

		} finally {
			rs0.close();
			conn0.close();
			stmt0.close();
		}

		if (userid != null && username != null && classroom != null
				&& period != null && weekday != null && week != null) {

			//System.out.println("执行到了");
			Connection conn = DB.getConn();
			//System.out.println("执行到了");
			Statement stmt = DB.createStmt(conn);
			//System.out.println("执行到了");

			String sql1 = "delete from classroom where weekday = "
					+ Integer.parseInt(weekday) + " and startweek <= "
					+ Integer.parseInt(week) + " and endweek >= "
					+ Integer.parseInt(week) + " and startperiod <= "
					+ Integer.parseInt(period) + " and endperiod >= "
					+ Integer.parseInt(period);
			DB.executeUpdate(stmt, sql1);

			String sql11 = "insert into classroom (num, isempty, weekday, startweek, endweek, startperiod, endperiod) values('"
					+ classroom
					+ "',"
					+ 1
					+ ","
					+ weekday0
					+ ","
					+ startweek0
					+ ","
					+ (Integer.parseInt(week) - 1)
					+ ","
					+ startperiod0 + "," + endperiod0 + ")";
			String sql12 = "insert into classroom (num, isempty, weekday, startweek, endweek, startperiod, endperiod) values('"
					+ classroom
					+ "',"
					+ 1
					+ ","
					+ weekday0
					+ ","
					+ (Integer.parseInt(week) + 1)
					+ ","
					+ endweek0
					+ ","
					+ startperiod0 + "," + endperiod0 + ")";
			String sql13 = "insert into classroom (num, isempty, weekday, startweek, endweek, startperiod, endperiod) values('"
					+ classroom
					+ "',"
					+ 1
					+ ","
					+ weekday0
					+ ","
					+ Integer.parseInt(week)
					+ ","
					+ Integer.parseInt(week)
					+ ","
					+ startperiod0
					+ ","
					+ (Integer.parseInt(period) - 1) + ")";
			String sql14 = "insert into classroom (num, isempty, weekday, startweek, endweek, startperiod, endperiod) values('"
					+ classroom
					+ "',"
					+ 1
					+ ","
					+ weekday0
					+ ","
					+ Integer.parseInt(week)
					+ ","
					+ Integer.parseInt(week)
					+ ","
					+ (Integer.parseInt(period) + 1)
					+ ","
					+ endperiod0 + ")";

			if (startweek0 != endweek0 && startperiod0 != endperiod0) {
				if (Integer.parseInt(week) > startweek0
						&& Integer.parseInt(week) < endweek0
						&& Integer.parseInt(period) > startperiod0
						&& Integer.parseInt(period) < endperiod0
						&& startweek0 != endweek0
						&& startperiod0 != endperiod0) {
					DB.executeUpdate(stmt, sql11);
					DB.executeUpdate(stmt, sql12);
					DB.executeUpdate(stmt, sql13);
					DB.executeUpdate(stmt, sql14);
				}

				if (Integer.parseInt(week) == startweek0
						&& Integer.parseInt(period) > startperiod0
						&& Integer.parseInt(period) < endperiod0
						&& startweek0 != endweek0
						&& startperiod0 != endperiod0) {
					DB.executeUpdate(stmt, sql12);
					DB.executeUpdate(stmt, sql13);
					DB.executeUpdate(stmt, sql14);
				}

				if (Integer.parseInt(week) == endweek0
						&& Integer.parseInt(period) > startperiod0
						&& Integer.parseInt(period) < endperiod0
						&& startweek0 != endweek0
						&& startperiod0 != endperiod0) {
					DB.executeUpdate(stmt, sql11);
					DB.executeUpdate(stmt, sql13);
					DB.executeUpdate(stmt, sql14);
				}

				if (Integer.parseInt(week) > startweek0
						&& Integer.parseInt(week) < endweek0
						&& Integer.parseInt(period) == startperiod0
						&& startweek0 != endweek0
						&& startperiod0 != endperiod0) {
					DB.executeUpdate(stmt, sql11);
					DB.executeUpdate(stmt, sql12);
					DB.executeUpdate(stmt, sql14);
				}

				if (Integer.parseInt(week) > startweek0
						&& Integer.parseInt(week) < endweek0
						&& Integer.parseInt(period) == endperiod0
						&& startweek0 != endweek0
						&& startperiod0 != endperiod0) {
					DB.executeUpdate(stmt, sql11);
					DB.executeUpdate(stmt, sql12);
					DB.executeUpdate(stmt, sql13);
				}

				if (Integer.parseInt(week) == startweek0
						&& Integer.parseInt(period) == startperiod0
						&& startweek0 != endweek0
						&& startperiod0 != endperiod0) {
					DB.executeUpdate(stmt, sql12);
					DB.executeUpdate(stmt, sql14);
				}

				if (Integer.parseInt(week) == endweek0
						&& Integer.parseInt(period) == endperiod0
						&& startweek0 != endweek0
						&& startperiod0 != endperiod0) {
					DB.executeUpdate(stmt, sql11);
					DB.executeUpdate(stmt, sql13);
				}
			}

			if (startweek0 == endweek0 && startperiod0 != endperiod0) {
				if (Integer.parseInt(period) > startperiod0
						&& Integer.parseInt(period) < endperiod0) {
					DB.executeUpdate(stmt, sql13);
					DB.executeUpdate(stmt, sql14);
				}

				if (Integer.parseInt(period) == startperiod0
						&& Integer.parseInt(period) < endperiod0) {
					DB.executeUpdate(stmt, sql14);
				}

				if (Integer.parseInt(period) > startperiod0
						&& Integer.parseInt(period) == endperiod0) {
					DB.executeUpdate(stmt, sql13);
				}
			}

			if (startweek0 != endweek0 && startperiod0 == endperiod0) {
				if (Integer.parseInt(week) > startweek0
						&& Integer.parseInt(week) < endweek0) {
					DB.executeUpdate(stmt, sql11);
					DB.executeUpdate(stmt, sql12);
				}

				if (Integer.parseInt(week) == startweek0
						&& Integer.parseInt(week) < endweek0) {
					DB.executeUpdate(stmt, sql12);
				}

				if (Integer.parseInt(week) > startweek0
						&& Integer.parseInt(week) == endweek0) {
					DB.executeUpdate(stmt, sql11);
				}
			}

			String sqlapprove = "update apply set status = 1 where userid = '"
					+ userid
					+ "' and username = '"
					+ username
					+ "' and classroom = '"
					+ classroom
					+ "' and period = "
					+ Integer.parseInt(period)
					+ " and weekday = "
					+ Integer.parseInt(weekday)
					+ " and week = "
					+ Integer.parseInt(week);
			String sqlinvalid = "update apply set status = 2 where classroom = '"
					+ classroom
					+ "' and period = "
					+ Integer.parseInt(period)
					+ " and weekday = "
					+ Integer.parseInt(weekday)
					+ " and week = "
					+ Integer.parseInt(week) + " and userid <> " + userid;
			String sqlinsert = "insert into classroom (num, isempty, weekday, course, startweek, endweek, startperiod, endperiod, teacherName, activityName) values('"
					+ classroom
					+ "',"
					+ 2
					+ ","
					+ Integer.parseInt(weekday)
					+ ", '申请活动',"
					+ Integer.parseInt(week)
					+ ","
					+ Integer.parseInt(week)
					+ ","
					+ Integer.parseInt(period)
					+ ","
					+ Integer.parseInt(period)
					+ ", '"
					+ username
				    + "', '"
				    + activity + "')";

			DB.executeUpdate(stmt, sqlapprove);
			DB.executeUpdate(stmt, sqlinvalid);
			DB.executeUpdate(stmt, sqlinsert);

			response.sendRedirect("manager1-datatable.jsp");

			conn.close();
			stmt.close();

		}
	%>
</body>
</html>