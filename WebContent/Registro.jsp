<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ElectoLab</title>
</head>
<body>
     <ul>
        <li class="title">ELECTOLAB</li>
        <li><a class="navbar" href="index.html">Inicio</a></li>
        <li><a class="navbar" href="AnalisisRealizados.jsp">Análisis Realizados</a></li>
        <li><a class="navbar" href="ResultadosPrevios.jsp">Resultados Previos</a></li>
        <li><a class="navbar" href="SimulacionBasica.jsp">Simulación</a></li>
        <li><a class="loginloc" href="Login.jsp">Log In</a></li>
    </ul>

<div class= "intro" >
<form action="RegistroServlet">
		<br></br>
		<br>Correo electrónico</br> 
		<input type="email" class="userinput" name="email" id="emailinput" placeholder="Introduzca su email">
		<br></br>
		<br>Nombre de usuario</br>
		<input	type="text" class="userimput" name="username" id="usernameinput" placeholder="Introduzca su nombre de usuario">
		<br></br>
		<br>Contraseña</br>
		<input type="password"	class="form-control" name="password1" id="passwordinput" placeholder="Introduzca su contraseña">
		<br></br>
		<br>Repita su contraseña</br>
		<input	type="password" class="form-control" name="password2" id="passwordinput2" placeholder="Repita su contraseña">
		<br></br>
		<input type="submit" class="registrar" value="Registrarse">
</form>
</div>

</body>
</html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        * {
            padding: 0;
            margin: 0;
        }
        .userinput{
            height: 30;
            width:220;
        }

        .entrar, .registrar{
            background-color:#2f4f4f;
            color: white;
            height: 30;
            width:220;
        }
        
        ul {
            font-size: 20px;
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #2f4f4f;
        }
        .loginloc{
            margin-left: 30%;
        }

        h1 {
            margin: 25;
            text-align: center
        }

        li {
            float: left;
        }

        li:last-child {
            border-right: none;
        }

        .title{
            margin-left: 10%;
            margin-right: 3%;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .login{
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .loginloc{
            display: block;
	        color: white;
	        text-align: center;
	        padding: 14px 16px;
	        text-decoration: none;
	        width: 95px;
        	margin-left: 390px;
	        background-color: #5f9ea0;
	    }

        .navbar{
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbaractive{
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            background-color: #5f9ea0;
        }
        .intro {
            text-align: center;
            /*margin-left: 20%;
            margin-right: 20%;*/
            font-size: 25px;
        }
    </style>
