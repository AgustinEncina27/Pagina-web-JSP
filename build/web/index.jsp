<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script> 
        <script src="JS/main.js"></script>
        <link rel="stylesheet" href="style.css" type = "text/css"><link>
        
    </head>
    <body>
        <h1>Iniciar Sesion</h1>
          <form action="iniciar" method="post" id="forminicio"><br>
            <p>
                <label>Nombre</label>  
                <input type="text" name="usuario" id="txtusuario"/><br>
                <label>Contraseña</label>
                <input type="password" name="pass" id="txtpass"/>
            </p>
            <h2><input type="button" value="Iniciar Sesion" id="btniniciar"/></h2>
        </form>
       <p>${param.message}</p> 
        
    </body>
</html>