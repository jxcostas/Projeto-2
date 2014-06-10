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
			firstname: "required",
			//lastname: "required",
                       endereco: "required",
			terms: "required",
                        lastname: {
				required: true,
				minlength: 15
			}
		},
		messages: {
			firstname: "Digite seu nome",
			lastname: "Digite seu telefone",
                        endereco: "Digite o Endereço",
			terms: " "
		},
		// the errorPlacement has to take the layout into account
		errorPlacement: function(error, element) {
			error.insertAfter(element.parent().find('label:first'));
		},
		// specifying a submitHandler prevents the default submit, good for the demo
		//submitHandler: function() {
		//	alert("Dados enviados!");
		//},
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
			<h1>Editar Eventos</h1>
		</div>
	</div>
	<!-- End of Page title -->
	
	<!-- Page content -->
	<div id="page">
		<!-- Wrapper -->
		<div class="wrapper">
				<!-- Left column/section -->
				<section class="column width6 first">					

					<h3>Editar Eventos</h3>
					<div class="box box-info">Todos os campos são obrigatórios</div>
					
					<form id="sampleform" method="post" action="edi_eventos_do.jsp">

                                            <%
                              String id = request.getParameter("id"); 
                              Class.forName("com.mysql.jdbc.Driver");
                              Connection conn3 = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
                              PreparedStatement ps3 = conn3.prepareStatement("SELECT EV_ID, EV_NOME, EV_DATA, EV_SALA, EV_DESC, EV_COLABORADOR, cl_nome, sl_sala FROM Eventos INNER JOIN salas on sl_id = ev_sala INNER JOIN colaboradores on ev_colaborador = cl_id Where ev_id = " +id);
                              
                              
                              ResultSet rs3 = ps3.executeQuery();
                                            %>
                                            
						<fieldset>
							<legend></legend>
<%        while(rs3.next()){   %>
							<p>
								<label class="required" for="nome">Nome:</label><br/>
                                                                <input type="hidden" id="id" class="half" value="<%=rs3.getString("ev_id")%>" name="id"/>
								<input type="text" id="nome" class="half" value="<%=rs3.getString("ev_nome")%>" name="nome"/>
							</p>
                                                        
                                                        <p>
								<label class="required" for="data">Data:</label><br/>
								<input type="date" id="data" class="half" value="<%=rs3.getString("ev_data")%>" name="data"/>
							</p>

							
                                                        <p>
                                                            
                                                             <%
                                         
                              Class.forName("com.mysql.jdbc.Driver");
                              Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
                              PreparedStatement ps = conn.prepareStatement("SELECT sl_id, sl_sala FROM Salas");
                              ResultSet rs = ps.executeQuery();
                                            %>
                                                            
                                                        <label for="select">Sala: </label><br/>
                                                        <select name="sala" id="sala">
                                                            <option value ="<%=rs3.getString("ev_sala")%>"><%=rs3.getString("sl_sala")%></option>
                                                            <%        while(rs.next()){   %>                                                        
                                                              
                                                              <option value="<%=rs.getString("sl_id")%>"><%=rs.getString("sl_sala")%></option>
                                                              <% } %>
                                                              </select>
                                                            
                                                        </p>
                                                        <p>
								<label class="required" for="Descricao">Descrição:</label><br/>
								<textarea name="desc" class="half" id="desc"><%=rs3.getString("ev_desc")%></textarea>
							</p>
                                                        
                                                        
  <p>
                                                            
                                                             <%
                                         
                              Class.forName("com.mysql.jdbc.Driver");
                              Connection conn2 = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
                              PreparedStatement ps2 = conn2.prepareStatement("SELECT CL_ID, CL_NOME FROM Colaboradores");
                              ResultSet rs2 = ps2.executeQuery();
                                            %>
                                                            
                                                        <label for="select">Colaborador: </label><br/>
                                                        <select name="colaborador" id="colaborador">
                                                            <option value ="<%=rs3.getString("ev_colaborador")%>"><%=rs3.getString("cl_nome")%></option>
                                                            <%        while(rs2.next()){   %>                                                        
                                                              
                                                              <option value="<%=rs2.getString("CL_ID")%>"><%=rs2.getString("CL_NOME")%></option>
                                                              <% } %>
                                                              </select>
                                                            
                                                        </p>
		
							
							<p>
								<input type="checkbox" id="terms" class="" value="1" name="terms"/>
								<label class="choice" for="terms">Confirmo que este dados são reais.</label>
							</p>
							
                                                        <% } %>
							<p class="box"><input type="submit" class="btn btn-green big" value="Editar"/> ou <input type="reset" class="btn" value="Limpar"/></p>

						</fieldset>

					</form>

				
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
