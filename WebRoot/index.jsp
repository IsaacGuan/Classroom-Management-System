<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js"> 
    <head>
        <meta charset="UTF-8" />
        <title>东华大学教室管理系统</title>
        <link rel="stylesheet" type="text/css" href="assets/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
		<link rel="stylesheet" type="text/css" href="assets/css/animate-custom.css" />
    </head>
    <body>
        <div class="container">
            <header>
                <h1><span>教室管理系统</span></h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="login.jsp" autocomplete="on" method="post"> 
                                <h1>登录</h1>                                
                                <p> 
                                    <label for="username" class="uname" data-icon="u" >您的学号或用户名</label>
                                    <input id="username" name="username" required="required" type="text" placeholder="myusername or mymail@mail.com"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p">密码</label>
                                    <input id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO" /> 
                                </p>
                                <p class="keeplogin">
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for ="loginkeeping">记住登录状态</label>
								</p>
                                <p class="login button"> 
                                    <input type="submit" value=" 登 录 " />
								</p>
                                <p class="change_link">
									没有账号？
									<a href="#toregister" class="to_register">加入我们</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                            <form  action="register.jsp" autocomplete="on" method="post"> 
                                <h1> 注册 </h1> 
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">学号 </label>
                                    <input id="useridsignup" name="useridsignup" required="required" type="text" placeholder="mysuperuserid" />
                                </p>
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">姓名 </label>
                                    <input id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="mysuperusername690" />
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">请输入密码 </label>
                                    <input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">请确认密码 </label>
                                    <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                </p>
                                <p class="signin button"> 
									<input type="submit" value=" 注 册  "/> 
								</p>
                                <p class="change_link">  
									已有账号 ?
									<a href="#tologin" class="to_register"> 去登录 </a>
								</p>
                            </form>
                        </div>	
                    </div>
                </div>  
            </section>	
        </div>
    </body>
</html>