

<%@page import="Controlador.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objsesion = request.getSession(true);
    String usuario = (String)objsesion.getAttribute("usuario");
    if(usuario.equals("")){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu <% out.println(usuario); %></title>
        <link rel="stylesheet" href="style.css" type = "text/css"><link>
    </head>
    <body>
        <li>
            <a href="${pageContext.request.contextPath}/index.jsp">| Cerrar Sesión |</a>
        </li>
            <h1>Inmobiliaria</h1>
            <h2>Boletas a pagar</h2>
            

        <%
            Conexion con= new Conexion();
            /*Connection con;
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/Prueba", "postgres", "oscar1432");*/
                PreparedStatement pst = null;
                ResultSet rs = null;

                try {
                    String consulta = "select * from locatario l inner join contrato c on l.idcontrato = c.idcontrato inner join cuota cuo on cuo.idcronograma=c.cronograma  where l.usuario= '"+ usuario +"'";
                    pst = con.getConexion().prepareStatement(consulta);
                    rs = pst.executeQuery();
                } catch(Exception e) {
                    System.err.println("ERROR + e");
                } /*finally{
                    try {
                        if(con != null) con.close();
                        if(pst != null) pst.close();
                        if(rs != null) rs.close();
                    } catch (Exception e) {
                    System.err.println("Error"+e);
                    }
                }*/
                int le;
                Boolean e;
        %>
            <div id="main-container">
                <table>
                    <thead>
                        <tr>
                            <th>Numero de Boleta</th>
                            <th>Primer Vencimiento</th>
                            <th>Segundo Vencimiento</th> 
                            <th>Estado</th>
                            <th>Descargar</th>
                        </tr>
                    </thead>
                    <% 
                        while(rs.next()){
                          le=rs.getInt("numerocuota");
                    %>

                    <tr>
                        <td><%=rs.getInt("numerocuota")%></td>
                        <td><%=rs.getDate("primerfechadepago")%></td>
                        <td><%=rs.getDate("segundafechadepago")%></td>
                        <%
                        e=rs.getBoolean("pagado");
                        if(e == false){
                        %>
                        <td>Adeuda</td>
                        <%}else{%>
                        <td>Pagado</td>
                        <%}%>
                        <td><a href="${pageContext.request.contextPath}/boleta.jsp?id=<%=rs.getInt("numerocuota")%>">descargar</a></td>
                    </tr>
                    <%}%>
                </table>
            </div>   
    </body>
</html>
