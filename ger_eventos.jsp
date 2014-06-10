<%@page import="java.sql.*" %>
<%
 
    //verificar quem é que tá aqui!

           int nvuser=(Integer)session.getAttribute("nvuser"); 
           int iduser=(Integer)session.getAttribute("iduser"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Gerenciar</title>
<!-- Favicons --> 
<link rel="shortcut icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="apple-touch-icon" HREF="img/favicons/apple.png" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/custom.css" type="text/css" />
<script type="text/javascript" SRC="js/swfobject.js"></script>
<script type="text/javascript" SRC="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.core.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.widget.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.tabs.min.js"></script>
<script type="text/javascript" SRC="js/jquery.tipTip.min.js"></script>
<script type="text/javascript" SRC="js/jquery.superfish.min.js"></script>
<script type="text/javascript" SRC="js/jquery.supersubs.min.js"></script>
<script type="text/javascript" SRC="js/jquery.validate_pack.js"></script>
<script type="text/javascript" SRC="js/jquery.nyroModal.pack.js"></script>
<script type="text/javascript" SRC="js/jquery.dataTables.min.js"></script>
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
	Administry.setup();
	$('#example').dataTable();
	Administry.expandableRows();
});

</script>
</head>
<body>
	<!-- Header -->
	<header id="top">
		<div class="wrapper">
			<!-- Title/Logo - can use text instead of image -->
			<div id="title"><img SRC="img/logo.png" /></div>
			<!-- Top navigation -->
			<div id="topnav">
				<%@ include file="includes/login.jsp" %>
			</div>
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
			<h1>Gerenciar Eventos</h1>
			<!-- Quick search box -->
			<form action="" method="get"><input class="" type="text" id="q" name="q" /></form>
		</div>
	</div>
	<!-- End of Page title -->
	
	<!-- Page content -->
	<div id="page">
		<!-- Wrapper -->
		<div class="wrapper">
				<!-- Left column/section -->
				<section class="column width6 first">					
					
								
					<div class="clear">&nbsp;</div>
					
					<h3>Eventos</h3>
                                        <%
                               String SQL;
                                         if(nvuser==2){
              SQL = "SELECT ev_colaborador, ev_id,ev_nome,ev_data, sl_sala, sl_id FROM eventos INNER JOIN salas on ev_sala = sl_id";
          } 
                                         else  {
                                             SQL = "SELECT ev_colaborador, ev_id,ev_nome,ev_data, sl_sala, sl_id FROM eventos INNER JOIN salas on ev_sala = sl_id WHERE ev_colaborador = " + iduser;
                                         }
                              Class.forName("com.mysql.jdbc.Driver");
                              Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
                              PreparedStatement ps = conn.prepareStatement(SQL);
                              ResultSet rs = ps.executeQuery();
                                            %>
                                        
					<table class="display stylized" id="example">
						<thead>
							<tr>
								<th>ID</th>
								<th>Nome</th>
								<th>Data</th>
								<th>Sala</th>
								<th>Editar</th>
                                                                <th>Deletar</th>
							</tr>
						</thead>
						<tbody>
							
                                                            
                                                             <%        while(rs.next()){   %>
                                                             <tr class="gradea">
								<td><%=rs.getString("ev_id")%></td>
								<td><%=rs.getString("ev_nome")%></td>
                                                                <td><%=rs.getString("ev_data")%></td>
								<td><%=rs.getString("sl_sala")%></td>
								<td class="center"><a href="edi_eventos_verificar.jsp?id=<%=rs.getString("ev_id")%>&col=<%=rs.getString("ev_colaborador")%>">Alterar</a></td>
								<td class="center"><a href="del_evento.jsp?id=<%=rs.getString("ev_id")%>&?data=<%=rs.getString("ev_data")%>&?sala=<%=rs.getString("sl_id")%>">Deletar</a></td>
                                                          </tr>
                                                                <% }  %>
							
						</tbody>
					</table>
					
					<div class="clear">&nbsp;</div>
					
				</section>
				<!-- End of Left column/section -->
				
				<!-- Right column/section -->
				<aside class="column width2">
					
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
	
	<!-- Animated footer -->
		<!-- End of Animated footer -->
	
	<!-- Scroll to top link -->
	<a href="#" id="totop">^ scroll to top</a>

<!-- User interface javascript load -->
<script type="text/javascript" SRC="js/adm.js"></script>
</body>
</html>
