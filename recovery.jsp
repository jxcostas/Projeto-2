<%--
    Document   : login
    Created on : 12/05/2014, 18:15:05
    Author     : jackson
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Properties"%>  
<%@ page import="javax.mail.*"%>  
<%@ page import="javax.mail.internet.*"%>
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
        String login = request.getParameter("email");
	String senha = request.getParameter("password");
		
	Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
        PreparedStatement ps = conn.prepareStatement("SELECT COUNT(`CL_EMAIL`) as Total FROM `Colaboradores` WHERE `CL_EMAIL`='"+login+"'");
        ResultSet rs = ps.executeQuery();
         
        while(rs.next()){
        	 if (rs.getInt("Total")==1) {
        		 //Envia email
 String smtphost = "localhost";  
InternetAddress remetente = new   
 //Este email deve ser válido e existir como conta de email para o domí­nio  
InternetAddress("suporte@mackenzie.br");  
InternetAddress destinatario = new InternetAddress(login);  
String assunto  = "Nova Senha";  
String conteudo = "Sua nova senha é: ";  
  
Properties p = new Properties();  
p.put ("mail.smtp.host", smtphost);  
  
Session email = Session.getInstance(p, null);  
MimeMessage msg = new MimeMessage(email);  
  
msg.setFrom(remetente);  
msg.setRecipient(Message.RecipientType.TO, destinatario);  
msg.setSubject(assunto);  
msg.setContent(conteudo,"text/html");  
msg.saveChanges();  
  
Transport transport = email.getTransport("smtp");  
transport.connect(smtphost,"");  
transport.sendMessage(msg, msg.getAllRecipients());  
transport.close();  
                     
        		 %>
                        
                         
                         <br/>
        		 <div class="box box-success"><p>Email enviado para, <%=login %><br/>
                              Volte para a tela inicial                
                         </div>	
                              <br/>
                         
				<%
	        	 }
        	 else {
        		 //Nãp enmvia
        		 %>
                         <br/>
     		 	    <div class="box box-error">Email Invalido</div>
					<div class="box box-error-msg">
						<ol>
							<li>Este email não existe!</li>
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
                
