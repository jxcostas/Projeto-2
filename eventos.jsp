<!DOCTYPE html>
<html>
<head>
<title>Painel de Controle</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- We need to emulate IE7 only when we are to use excanvas -->
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<![endif]-->
<link rel="shortcut icon" type="image/png" href="img/favicons/favicon.png"/>
<link rel="icon" type="image/png" href="img/favicons/favicon.png"/>
<link rel="apple-touch-icon" href="img/favicons/apple.png" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<script type="text/javascript" SRC="js/swfobject.js"></script>
<!-- jQuery -->
<script type="text/javascript" SRC="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.core.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.widget.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.tabs.min.js"></script>
<script type="text/javascript" SRC="js/jquery.tipTip.min.js"></script>
<script type="text/javascript" SRC="js/jquery.superfish.min.js"></script>
<script type="text/javascript" SRC="js/jquery.supersubs.min.js"></script>
<script type="text/javascript" SRC="js/jquery.validate_pack.js"></script>
<script type="text/javascript" SRC="js/jquery.nyroModal.pack.js"></script>
<!--[if IE]><script type="text/javascript" src="js/flot/excanvas.min.js"></script><![endif]-->
<script type="text/javascript" SRC="js/flot/jquery.flot.min.js"></script>
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
        <%
        	if(session.getAttribute("login")==null){
                response.sendRedirect("index.jsp");    
        	} else { 
                    
        %>
	<!-- Header -->
	<header id="top">
		<div class="wrapper">
			<div id="title"><img SRC="img/logo.png" alt="Logo" /></div>
			<!-- Top navigation -->
			<%@ include file="includes/login.jsp" %> 
			<!-- End of Top navigation -->
			<!-- Main navigation -->
			<%@ include file="includes/menu.jsp" %>
			<!-- End of Main navigation -->
		</div>
	</header>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>Cadastros</h1>
		</div>
	</div>
	<!-- End of Page title -->
	
	<!-- Page content -->
	<div id="page">
            <div class="wrapper">
	  <table width="200" border="0" align="center" cellpadding="2" cellspacing="2">
	    <tr>
	      <td><a href="cad_eventos.jsp"><img src="img/cad_ev.png" width="200" height="200" alt="Cadastrar Eventos"></a></td>
	      <td><a href="ger_eventos.jsp"><img src="img/ger_ev.png" width="200" height="200" alt="Gerenciar Eventos"></a></td>
        </tr>
      </table>
            </div>
	</div>
	<!-- End of Page content -->
	
	<!-- Page footer -->
	<footer id="bottom">
		<div class="wrapper">
                    <%@ include file="includes/copyright.jsp" %>
		</div>
	</footer>
	<!-- End of Page footer -->
	
	<!-- Scroll to top link -->
	<a href="#" id="totop">^ voltar para o topo</a>

<!-- Admin template javascript load -->
<script type="text/javascript" SRC="js/adm.js"></script>

<% } %>
</body>
</html>
