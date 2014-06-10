"<%@page import="java.sql.*" %>
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
			<h1>Cadastro de Eventos</h1>
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
    int sala = Integer.parseInt(request.getParameter("sala"));   
    int colaborador = Integer.parseInt(request.getParameter("colaborador")); 
    String data = request.getParameter("data");
    String nome = request.getParameter("nome");
    String desc = request.getParameter("desc");
    
             
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn2 = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
        PreparedStatement ps2 = conn2.prepareStatement("SELECT COUNT(`rs_ID`) as Total FROM `reserva` WHERE `sala_id`="+sala+" and `data_evento`='"+data+"'");
        ResultSet rs2 = ps2.executeQuery();
         
        while(rs2.next()){
        	 if (rs2.getInt("Total")==1) {
        
        
%>

<br/>
        		 <div class="box box-error"><p>Ops, A sala já está ocupada neste mesmo dia!</p>                  
                         </div>	
                              <br/>
<% 
                 } else {
                     
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
        PreparedStatement ps = conn.prepareStatement("INSERT INTO eventos(ev_nome, ev_data, ev_sala, ev_desc, ev_colaborador) VALUES('" + nome + "','" + data + "'," + sala + ",'" + desc + "'," + colaborador + ")");
        ps.executeUpdate();       
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn3 = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
        PreparedStatement ps3 = conn.prepareStatement("INSERT INTO reserva(colaborador_id, sala_id, data_evento) VALUES(" + colaborador + "," + sala + ",'" + data + "')");
        ps3.executeUpdate();   

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
							<q>Infraestrutura das Salas. Sala1: ('TV',1)Sala 2:('MICROFONE,PROJETOR',2)Sala 3:('MESAS REDONDAS',3)Sala 4:('SISTEMA MULTIMIDIA',4)Sala 5:('PROJETOR',5).
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
