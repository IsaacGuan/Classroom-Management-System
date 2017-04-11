<%@ page language="java" import="java.util.*,java.sql.*,cn.edu.dhu.*" pageEncoding="GBK"%>
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
    <title>login</title>
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
    	String account = request.getParameter("username");
    	String pswd =  request.getParameter("password");
    	String userid = new String();
    	if(account!=null && account !="" && pswd !=null && pswd!=""){
    		
	    	String sql = "select * from jsgl.user where account ='"+ account+ "' and password1 = '"+ pswd+"'";
	    	Connection conn=DB.getConn();
	    	Statement stmt = DB.createStmt(conn);
	    	ResultSet rs = DB.executeQuery(stmt, sql);
	    		    		    	
	    	if(rs.next()){
	    	    userid = (String) rs.getString("userid");
	    	    session.setAttribute("userid", userid);
	    	    if (userid.equals("000000000")){
	    	        response.sendRedirect("manager1-datatable.jsp");
	    	        return;
	    	    }
	    	    else{	    	        
	    		    response.sendRedirect("tables-datatables.jsp");
	    		    return;
	    		}
	    	}
	    	else{
	    		request.getRequestDispatcher("index.jsp").forward(request, response);
	    	}
    	}
     %>
     
  </body>
</html>
