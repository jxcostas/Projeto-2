<%-- 
    Document   : login
    Created on : 12/05/2014, 18:15:05
    Author     : jackson
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log-In</title>
        <link rel="shortcut icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="apple-touch-icon" HREF="img/favicons/apple.png" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/custom.css" type="text/css" />
<script type="text/javascript" SRC="js/swfobject.js"></script>
<!-- jQuery  -->
<script type="text/javascript" SRC="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.core.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.widget.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.tabs.min.js"></script>
<script type="text/javascript" SRC="js/jquery.tipTip.min.js"></script>
<script type="text/javascript" SRC="js/jquery.superfish.min.js"></script>
<script type="text/javascript" SRC="js/jquery.supersubs.min.js"></script>
<script type="text/javascript" SRC="js/jquery.validate_pack.js"></script>
<script type="text/javascript" SRC="js/jquery.nyroModal.pack.js"></script>
<!-- Internet Explorer Fixes --> 
<!--[if IE]>
<link rel="stylesheet" type="text/css" media="all" href="css/ie.css"/>
<script src="js/html5.js"></script>
<![endif]-->
<!--Upgrade MSIE5.5-7 to be compatible with MSIE8: http://ie7-js.googlecode.com/svn/version/2.1(beta3)/IE8.js -->
<!--[if lt IE 8]>
<script src="js/IE8.js"></script>
<![endif]-->
    </head>
    <body>
        
       	<!-- Header -->
	<header id="top">
		<div class="wrapper-login">
			<div id="title"><img SRC="img/logo.png" alt="Logo" /></div>
			<!-- Main navigation -->
			<nav id="menu">
				<ul class="sf-menu">
					<li class="current"><a href="index.jsp">Login</a></li>
				</ul>
			</nav>
			<!-- End of Main navigation -->
		</div>
	</header>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper-login"></div>
	</div>
	<!-- End of Page title -->
	
	<div id="page">
            <div class="wrapper">
		<!-- Wrapper -->
	
        <%
        String login = request.getParameter("username");
	String senha = request.getParameter("password");
        
        
		
	Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
        PreparedStatement ps = conn.prepareStatement("SELECT COUNT(`CL_LOGIN`) as Total, CL_ID as ID, CL_NIVEL as Nv  FROM `Colaboradores` WHERE `CL_LOGIN`='"+login+"'AND `CL_PASS`='"+senha+"'");
        ResultSet rs = ps.executeQuery();
        
        
        
         while(rs.next()){
                   int id = rs.getInt("ID");
                   int nv = rs.getInt("Nv");
        	 if (rs.getInt("Total")==1) {
        		 session.setAttribute("login", login);
                         session.setAttribute("iduser", id);
                         session.setAttribute("nvuser", nv);
        		 %>
                         <br/>
        		 <div class="box box-success"><p>Bem-vindo, <%=login %><br/>
                              
                              <a href="dashboard.jsp">Clique aqui para continuar.. </a>-->
                         </div>	
                              <br/>
                         
				<%
	        	 }
        	 else {
        		 session.invalidate();
        		 %>
                         <br/>
     		 	    <div class="box box-error">Login Invalido</div>
					<div class="box box-error-msg">
						<ol>
							<li>Verifique se o nome de usuário foi digitado corretamente</li>
							<li>Verifique se a senha foi digitada corretamente</li>
                            <li>Caso necessário consulte o administrador</li>
						</ol>
					</div>
                            <br/>
				<%
        	 }
         }
	%>
        
    
		<!-- End of Wrapper -->
	</div></div>
	<!-- End of Page content -->
	
	<!-- Page footer -->
	<footer id="bottom">
		<div class="wrapper-login">
			<%@ include file="includes/copyright.jsp" %>
                </div>
	</footer>
	<!-- End of Page footer -->

<!-- User interface javascript load -->
<script type="text/javascript" SRC="js/adm.js"></script>
</body>
	
    </body>
</html>
                
