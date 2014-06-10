<%@page import="java.sql.*" %>       


<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/projeto2?useUnicode=true","root","admin");
            PreparedStatement ps = conn.prepareStatement("DELETE FROM colaboradores WHERE cl_id = "+ request.getParameter("id"));
            ps.executeUpdate();
         
            
            response.sendRedirect("ger_colab.jsp");
%>

