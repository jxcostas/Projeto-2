<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //Se Sessão não tiver sido criada
    if(session.getAttribute("login")==null){ 
        
       
 %>
<!DOCTYPE html>
<html>
<head>
<title>Painel de Controle: Log-in</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Favicons --> 
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
<script type="text/javascript">

$(document).ready(function(){
	
	/* setup navigation, content boxes, etc... */
	Administry.setup();
	
	// Validar Login
	var validator = $("#loginform").validate({
		rules: {
			username: "required",
			password: "required"
		},
		messages: {
			username: "Digite o nome de usuário",
			password: "Digite uma senha"
		},
		
		errorPlacement: function(error, element) {
			error.insertAfter(element.parent().find('label:first'));
		},
		
		success: function(label) {
			//para IE
			label.html("&nbsp;").addClass("ok");
		}
	});

});
</script>
</head>
<body>
	<!-- Header -->
	<header id="top">
		<div class="wrapper-login">
			<div id="title"><img SRC="img/logo.png" alt="Logo" /></div>
			<!-- Main navigation -->
			<nav id="menu">
				<ul class="sf-menu">
					<li class="current"><a href="#">Login</a></li>
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
	
	<!-- Page content -->
	<div id="page">
		<!-- Wrapper -->
		<div class="wrapper-login">
				<!-- Login form -->
				<section class="full">					
					
					<h3>Login</h3>
					
					<div class="box box-info">Digite o nome de usuário e senha</div>

					<form id="loginform" method="post" action="login.jsp">

						<p>
							<label class="required" for="username">Nome de Usuário:</label><br/>
							<input type="text" id="username" class="full" value="" name="username"/>
						</p>
						
						<p>
							<label class="required" for="password">Senha:</label><br/>
							<input type="password" id="password" class="full" value="" name="password"/>
						</p>
						
						<p>
							<input type="checkbox" id="remember" class="" value="1" name="remember"/>
							<label class="choice" for="remember">Manter Logado?</label>
						</p>
						<p>
							<input type="submit" class="btn btn-green big" value="Login"/> &nbsp; <a href="javascript: //;" onclick="$('#emailform').slideDown(); return false;">Esqueceu sua senha?</a>
						</p>
                                                
						<p>
							
						</p>
						<div class="clear">&nbsp;</div>

					</form>
					
					<form id="emailform" style="display:none" method="post" action="recovery.jsp">
						<div class="box">
							<p id="emailinput">
								<label for="email">Email:</label><br/>
								<input type="text" id="email" class="full" value="" name="email"/>
							</p>
							<p>
								<input type="submit" class="btn" value="Enviar"/>
							</p>
						</div>
					</form>
					
				</section>
				<!-- End of login form -->
				
		</div>
		<!-- End of Wrapper -->
	</div>
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
</html>

<% } else {
        
        response.sendRedirect("dashboard.jsp");
        
 }
        

%>
