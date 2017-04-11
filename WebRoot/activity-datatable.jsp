<%@ page contentType="text/html; charset=utf-8"%>

<%@ page import="java.sql.*,java.io.*,cn.edu.dhu.*,java.util.*,java.util.Date,java.lang.*,java.text.SimpleDateFormat" %>


<%
String userid = (String)session.getAttribute("userid");

session.setAttribute("pageid", "8");

String username = new String();
String account = new String();
String password = new String();
String email = new String();

Connection conn0=null;
Statement stmt0=null;
ResultSet rs0=null;

try {
	
	conn0=DB.getConn();
	stmt0=DB.createStmt(conn0);
	String sql0 = "select * from user where userid = '" + userid + "';";
	rs0= DB.executeQuery(stmt0, sql0);

    while (rs0.next()) {
		username = (String) rs0.getString("username");
		account = (String) rs0.getString("account");
		password = (String) rs0.getString("password1");
		email = (String) rs0.getString("email");
	}
	
} catch (Exception e) {

} finally {
	
	rs0.close();
	conn0.close();
	stmt0.close();
	
}

	/* System.out.println("name:" + username);
	System.out.println("password:" + password);
	System.out.println("email:" + email); */
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />
	
	<title>教室管理系统</title>
	
	<link rel="stylesheet" href="http://fonts.useso.com/css?family=Arimo:400,700,400italic">
	<link rel="stylesheet" href="assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/xenon-core.css">
	<link rel="stylesheet" href="assets/css/xenon-forms.css">
	<link rel="stylesheet" href="assets/css/xenon-components.css">
	<link rel="stylesheet" href="assets/css/xenon-skins.css">
	<link rel="stylesheet" href="assets/css/custom.css">

	<script src="assets/js/jquery-1.11.1.min.js"></script>
</head>

<body class="page-body">
	 
	<div class="page-container">
		<div class="sidebar-menu toggle-others fixed">
			
			<div class="sidebar-menu-inner">	
				
				<header class="logo-env">
					
					<!-- logo -->
					<div class="logo">
						<a class="logo-expanded">
							<h2 align="center" >
								<font color="#FFFFFF">教室管理系统
								</font>
							</h2>
							
						</a>
						
						<a class="logo-collapsed">
							<h3 align="center" >
								<font color="#FFFFFF">欢迎</font>
							</h3>
						</a>
					</div>
					
					<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
					<div class="mobile-menu-toggle visible-xs">
						<a href="#" data-toggle="user-info-menu">
							<i class="fa-bell-o"></i>
							<span class="badge badge-success"></span>
						</a>
						
						<a href="#" data-toggle="mobile-menu">
							<i class="fa-bars"></i>
						</a>
					</div>
				</header>
		
				<ul id="main-menu" class="main-menu">
					<!-- add class "multiple-expanded" to allow multiple submenus to open -->
					<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
					<li>
						<a href="tables-datatables.jsp">
							<i class="linecons-database"></i>
							<span class="title">课程表</span>						</a>
					</li>
					<li>
						<a href="today-datatable.jsp">
							<i class="linecons-cog"></i>
							<span class="title">今日课程</span>
						</a>
					</li>
					<li>
						<a href="free-datatable.jsp">
							<i class="linecons-desktop"></i>
							<span class="title">我要自习</span>						</a>
					</li>

					<li class="active opened active expanded has-sub">
						<a href="#">
							<i class="linecons-params"></i>
							<span class="title">教室申请</span>
						</a>
						<ul>
							<li>
								<a href="apply-datatable.jsp">
									<span class="title">我要申请</span>
								</a>
							</li>
							<li>
								<a href="result-datatable.jsp">
									<span class="title">申请结果</span>
								</a>
							</li>
							<li class="active">
								<a>
									<span class="title">活动分布</span>
								</a>
							</li>
						</ul>
					</li>
				</ul>
						
			</div>
			
		</div>
		
	  <div class="main-content">
	  <!-- User Info, Notifications and Menu Bar -->
			<nav class="navbar user-info-navbar" role="navigation">
				
				<!-- Left links for user info navbar -->
				<ul class="user-info-menu left-links list-inline list-unstyled">
				
				
					
					<li class="hidden-sm hidden-xs">
					<a href="#" data-toggle="sidebar">
							<i class="fa-bars"></i>
					</a>
					</li>
				</ul>
				
				
				<!-- Right links for user info navbar -->
				<ul class="user-info-menu right-links list-inline list-unstyled">
					
					<li class="dropdown user-profile">
						<a href="#" data-toggle="dropdown">
							<img src="assets/images/user-4.png" alt="user-image" class="img-circle img-inline userpic-32" width="28" />
							<span>
							<%= account%>
								<!--UserName-->			
								<i class="fa-angle-down"></i>
							</span>
						</a>
						
						<ul class="dropdown-menu user-profile-menu list-unstyled">
							
							<li>
							    <a href="javascript:;" onclick="jQuery('#modal-6').modal('show', {backdrop: 'fade'});">
							        <i class="fa-user"></i>
									     个人信息
							    </a>
							</li>
							
							<li class="last">
								<a href="index.jsp">
									<i class="fa-lock"></i>
									     注销
								</a>
							</li>
						</ul>
					</li>
					
					
					
				</ul>
				
			</nav>
	 <%
         Connection conn=null;
	 	 Statement stmt=null;
	 	 ResultSet rs=null;
	 	 //ResultSet rs0=null;
	 	 try{
	 	    
	 	    
		 	conn=DB.getConn();
		 	stmt=DB.createStmt(conn);
		 	String sql = "select * from classroom where isempty = 2";
		 	//String sql0 = "select * from user where account = '" + account + "'";
		 	rs= DB.executeQuery(stmt, sql);
		 	//rs0 = DB.executeQuery(stmt, sql0);
		 	
		 	//username = rs0.getString(0);
		 	//password = rs0.getString(2);
		 	
  	%>
			<div class="page-title">
				
				<div class="title-env">
					<h1 class="title">活动分布</h1>
					<p class="description">本学期各教室活动分布情况</p>
				</div>
			</div>
			
			<!-- Basic Setup -->
			<div class="panel panel-default">
				
				<div class="panel-body">
					
					<script type="text/javascript">
					jQuery(document).ready(function($)
					{
						$("#example-1").dataTable({
							aLengthMenu: [
								[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]
							]
						});
					});
					</script>
					
					<table id="example-1" class="table table-striped table-bordered" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>教室</th>
								<th>活动</th>
								<th>星期</th>
								<th>时间</th>
								<th>周数</th>
								<th>申请人</th>
							</tr>
						</thead>
					
						<tfoot>
							<tr>
								<th>教室</th>
								<th>活动</th>
								<th>星期</th>
								<th>时间</th>
								<th>周数</th>
								<th>申请人</th>
							</tr>
						</tfoot>
					
						<tbody>
						<%  
           					 while (rs.next()) {  
        				%> 
							<tr>


								<td>
									<%
										out.print(rs.getString(2));
									%>
								</td>
								<td>
									<%
										out.print(rs.getString(11));
									%>
								</td>

								<td>星期<%
									out.print(rs.getString(4));
								%></td>


								<td>第<%
									out.print(rs.getString(9));
								%>节
								</td>
								<td>第<%
									out.print(rs.getString(6));
								%>周
								</td>
								<td>
									<%
										out.print(rs.getString(10));
									%>
								</td>
							</tr>

							<%  
           							 }
           					}catch(Exception e){
           						
           				}    finally{
           					rs.close();
           					//rs0.close();
        					stmt.close();  
        					conn.close(); 
           				}
        					%> 
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

    <script>
    
	function checkfrm() {
		if (document.form1.password1.value != document.form1.password2.value) {
			alert("你输入的密码不一样！");
			return false;
		}
		return true;
	}
	</script>

	<!-- Modal 6 (Long Modal)-->
	<div class="modal fade" id="modal-6">
		<div class="modal-dialog">
			<div class="modal-content">
			<form id="form1" name="form1" action="userupdate.jsp" autocomplete="on" method="post">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">个人信息</h4>
				</div>
				
				<div class="modal-body">
				
					<div class="row">
						<div class="col-md-6">
							
							<div class="form-group">
								<label for="username" class="control-label">姓名</label>

								<input type="text" class="form-control" id="username" name="username" value="<%= username%>" readonly>
							</div>	
							
						</div>
					
						<div class="col-md-6">
							
							<div class="form-group">
								<label for="userid" class="control-label">学号</label>
								
								<input type="text" class="form-control" id="userid" name="userid" value="<%= userid%>" required="required" readonly>
							</div>	
							
						</div>
					</div>
					
					<div class="row">

					    <div class="col-md-6">
							
							<div class="form-group">
								<label for="account" class="control-label">用户名</label>
								
								<input type="text" class="form-control" id="account" name="account" value="<%= account%>" required="required">
							</div>	
							
						</div>

						<div class="col-md-6">
							
							<div class="form-group">
								<label for="email" class="control-label">电子邮件</label>
								
								<input type="text" class="form-control" id="email" name="email" value="<%= email%>">
							</div>	
							
						</div>
					</div>
				
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="password1" class="control-label">密码</label>
								
								<input type="password" class="form-control" id="password1" name="password1" placeholder="当前密码：<%= password%>" required="required">
							</div>	
							
						</div>
						
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="password2" class="control-label">密码确认</label>
								
								<input type="password" class="form-control" id="password2" name="password2" placeholder="密码确认" required="required"  onchange="checkfrm()">
							</div>	
						
						</div>
					</div>
					
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<input type="submit" class="btn btn-info" value="保存修改" onclick="checkfrm()">
				</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="assets/js/datatables/dataTables.bootstrap.css">

	<!-- Bottom Scripts -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/TweenMax.min.js"></script>
	<script src="assets/js/resizeable.js"></script>
	<script src="assets/js/joinable.js"></script>
	<script src="assets/js/xenon-api.js"></script>
	<script src="assets/js/xenon-toggles.js"></script>
	<script src="assets/js/datatables/js/jquery.dataTables.min.js"></script>

	<!-- Imported scripts on this page -->
	<script src="assets/js/datatables/dataTables.bootstrap.js"></script>
	<script src="assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
	<script src="assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>

	<!-- JavaScripts initializations and stuff -->
	<script src="assets/js/xenon-custom.js"></script>

</body>
</html>