<%@page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Formulários</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="apple-touch-icon" HREF="img/favicons/apple.png" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/custom.css" type="text/css" />
<script type="text/javascript" SRC="js/swfobject.js"></script>
<!-- jQuery -->
<script type="text/javascript" SRC="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.core.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.widget.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.tabs.min.js"></script>
<script type="text/javascript" SRC="js/jquery.tipTip.min.js"></script>
<script type="text/javascript" SRC="js/jquery.superfish.min.js"></script>
<script type="text/javascript" SRC="js/jquery.supersubs.min.js"></script>
<script type="text/javascript" SRC="js/jquery.nyroModal.pack.js"></script>
<script type="text/javascript" SRC="js/jquery.validate_pack.js"></script>
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
	
	/* progress bar animations - setting initial values */
	Administry.progress("#progress1", 1, 6);
	
	// validate form on keyup and submit
	var validator = $("#sampleform").validate({
		rules: {
			nome: "required",
			//lastname: "required",
                       data: "required",
			terms: "required",
                        lastname: {
				required: true,
				minlength: 15
			}
		},
		messages: {
			nome: "Digite seu nome",
			data: "Digite a data",
                        desc: "Digite a descrição",
			terms: " "
		},
		// the errorPlacement has to take the layout into account
		errorPlacement: function(error, element) {
			error.insertAfter(element.parent().find('label:first'));
		},
		// specifying a submitHandler prevents the default submit, good for the demo
		submitHandler: function() {
			alert("Dados enviados!");
		},
		// set new class to error-labels to indicate valid fields
		success: function(label) {
			// set &nbsp; as text for IE
			label.html("&nbsp;").addClass("ok");
		}
	});
	
	// propose username by combining first- and lastname
	$("#username").focus(function() {
		var firstname = $("#firstname").val();
		var lastname = $("#lastname").val();
		if(firstname && lastname && !this.value) {
			this.value = firstname + "." + lastname;
		}
	});

});
</script>
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
			<!-- End of Top navigation -->
			
		</div>
	</header>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>Cadastro de Colaboradores</h1>
		</div>
	</div>
	<!-- End of Page title -->
	
	<!-- Page content -->
	<div id="page">
		<!-- Wrapper -->
		<div class="wrapper">
				<!-- Left column/section -->
				<section class="column width6 first">	
                                    
                                    
                                    <%
//nome data sala desc colaborador
    int nivel = Integer.parseInt(request.getParameter("nivel")); 
    String login = request.getParameter("login");
    String nome = request.getParameter("nome");
    String pass = request.getParameter("pass");
    String email = request.getParameter("email");
    
             //nome login pass nivel email
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn2 = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
        PreparedStatement ps2 = conn2.prepareStatement("SELECT COUNT(`cl_id`) as Total FROM `colaboradores` WHERE cl_email = '" + email + "' and cl_login = '"+ login + "'");
        ResultSet rs2 = ps2.executeQuery();
         
        while(rs2.next()){
        	 if (rs2.getInt("Total")==1) {
        
        
%>

<br/>
        		 <div class="box box-error"><p>Ops, Já existe um usuário com este email!</p>                  
                         </div>	
                              <br/>
<% 
                 } else {
                     
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
        PreparedStatement ps = conn.prepareStatement("INSERT INTO colaboradores (cl_login, cl_pass, cl_nome, cl_nivel, cl_email) VALUES('" + login + "','" + pass + "','" + nome + "'," + nivel + ",'" + email + "')");
        ps.executeUpdate();       
                     %>
                     
                             		 <div class="box box-success"><p>Evento Cadastrado!</p>                  
                         </div>	
                              <br/>
                              
                              <% } }%>
				
				</section>
				<!-- End of Left column/section -->
				
				<!-- Right column/section -->
				<aside class="column width2">
				
					<div class="content-box">
						<header>
							<h3>Informação Rápida</h3>
						</header>
						<section>
							<q>Complete o formulário corretamente com dados reais. Colocar dados não legitimos pode ocasionar em problemas no futuro.
							<cite>Para sua segurança,</cite> tudo irá gerar um log de segurança.</q>							
						</section>
					</div>
				</aside>
				<!-- End of Right column/section -->
				
		</div>
		<!-- End of Wrapper -->
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

<!-- User interface javascript load -->
<script type="text/javascript" SRC="js/adm.js"></script>
<% } %>
</body>
</html>
