<%@ page language="java" import="java.util.*,java.sql.*,cn.edu.dhu.*"%>
<%@ page contentType="text/html,charset=gbk" pageEncoding="utf-8"%>
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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  	<%
  	    
  	  String userid = request.getParameter("useridsignup");
  		String name = request.getParameter("usernamesignup");
    	String account = userid;
    	String pswd1 =  request.getParameter("passwordsignup");
    	String pswd2 =  request.getParameter("passwordsignup_confirm");
    	
    	//name = new String(name.getBytes("iso8859_1"),"utf-8");
    	//System.out.println("name="+name);
    	//System.out.println("name="+account);
    	//System.out.println("name="+pswd1);
    	//System.out.println("name="+pswd2);
    	
   		if(account !=null && pswd2!=null){
   			//System.out.println("执行到了");
   			String sql = "insert into user values('"+userid+"','"+name+"','"+account+"','"+pswd1+"','"+pswd2+"','')";
   			//System.out.println("执行到了");
    		Connection conn=DB.getConn();
    		//System.out.println("执行到了");
    		Statement stmt = DB.createStmt(conn);
    		//System.out.println("执行到了");
    		int n = DB.executeUpdate(stmt, sql);
    		//System.out.println("n="+n);
	    	response.sendRedirect("index.jsp");
	    	System.out.println("执行到了");
   		}
    	
     %>
  <body>
  	
  </body>
</html>
