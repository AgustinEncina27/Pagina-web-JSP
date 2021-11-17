<%@page import="net.sf.jasperreports.engine.JasperRunManager" %>
<%@page import="net.sf.jasperreports.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page import="Controlador.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Boleta</title>
    </head>
    <body>
        <%
            Connection con;
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/Prueba", "postgres", "oscar1432");
            int id=Integer.parseInt(request.getParameter("id"));
            HttpSession objsesion = request.getSession(true);
            String usuario = (String)objsesion.getAttribute("usuario");
            File reportFile = new File(application.getRealPath("reporte/boleta.jasper"));
            Map parametro = new HashMap();
            parametro.put("id",id);
            parametro.put("usuario2",usuario);
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametro, con);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(bytes, 0, bytes.length);
            outputStream.flush();
            outputStream.close();
          %>
    </body>
</html>

