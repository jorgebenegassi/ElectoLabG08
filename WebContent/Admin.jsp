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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
<ul>
    <li class="title">ELECTOLAB</li>
    <li class="loginloc"><a class="navbar" href="Admin.jsp">${analista.name}</a></li>
    <li><a class="navbar" href="CrearAnalista.jsp">Crear Análisis</a></li>
    <li><a class="navbar" id= "peticion" href="MisAnalisis.jsp">Mis Análisis</a></li>
    <li><a class="logout" href="Login.jsp">Log Out</a></li>
</ul>

<h1>Bienvenido a ElectoLab ${analista.name}</h1>
<h2>¿Qué desea hacer?</h2>
	
 <div class= "row">
        <div class= "column"> 
        
            <div class= "infoDiv">
                <img onclick="window.location.href='CrearAnalista.jsp'" src="crearAnalisis.png">
                <h3>Crear Análisis</h3>
                <br> Existe la capacidad de crear análisis autonómicos y nacionales.  Para ello pulse en la pestaña "Crear Análisis" de la barra de navegación superior o en la imagen superior. Una vez en la pestaña, podrá descargarse una plantilla que deberá subir con sus resultados para obtener una simulación. </br>
            </div>
        </div>  
        
        <div class= "column"> 
        
            <div class= "infoDiv">
                <img onclick="window.location.href='MisAnalisis.jsp'" src="history.png">
                <h3>Acceso a tus analisis</h3>
                <br> A través de la pestaña "Mis Análisis" de la barra de navegación superior, o pulsando la imagen, tendrá acceso a todos los análisis que haya realizado, pudiendo elegir el escenario a visualizar según la descripción y la fecha de realización.  </br>
            </div>
        </div>   

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

    .infoDiv{        
        text-align: center;
        margin-left: 20%;
        margin-right: 20%;
        font-size: 20px;
    }
    
    img{      
        margin:30px;
        height: 100px;
        width: 100px;
    }
        .column {
            float: left;
            width: 45%;
            padding: 10px;
            height: 300px; /* Should be removed. Only for demonstration */
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }


        button{
            background-color:#2f4f4f;
            display: block;
            margin: auto;
            color: white;
            height: 30;
            width:120;
        }
        ul {
            font-size: 20px;
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #2f4f4f;
        }

        h1 {
            margin: 25px;
            text-align: center
        }

        h2 {
            margin: 40px;
            text-align: center;
        }

        h3 {
            margin: 20px;
            text-align: center;
        }

        .bloque {
            margin-left: auto;
            margin-right: auto;
            margin-top: -40px;
            -webkit-border-horizontal-spacing: 100px;
            -webkit-border-vertical-spacing: 70px;
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
            color: white;
            text-decoration: none;
            background-color: #5f9ea0;
        }

        .navbar{
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .logout {
            display: block;
            color: white;
            margin-left: 620px;
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

        .imgCrear, .imgHistory {
            margin-top: -40px;
            width: 80px;
            height: 80px;
            margin-left: 20px;
        }


    </style>
</head>