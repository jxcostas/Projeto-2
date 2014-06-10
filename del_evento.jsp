<%@page import="java.sql.*" %>       


<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
            PreparedStatement ps = conn.prepareStatement("DELETE FROM eventos WHERE ev_id = "+ request.getParameter("id"));
            ps.executeUpdate();
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn2 = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
            PreparedStatement ps2 = conn2.prepareStatement("DELETE FROM reserva WHERE rs_id = " + request.getParameter("id"));
            ps2.executeUpdate();
            
            response.sendRedirect("ger_eventos.jsp");
%>

