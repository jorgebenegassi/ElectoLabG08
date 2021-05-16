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
        <li><a class="navbaractive" href="SimulacionBasica.jsp">Simulación</a></li>
        <li><a class="loginloc" href="Login.jsp">Log In</a></li>
    </ul>
    
    
    
    <h1>Realiza tu simulación</h1>
	
	
 <div class= "row">
        <div class= "column"> 
        
            <div class= "infoDiv">              
       			<img class="españa" src="MapaEspaña.png">
       			<button class="nacional" onclick="window.location.href='SimulacionNacional.jsp'">Parlamento Nacional</button>
            </div>
        </div>  
        
        <div class= "column"> 
        
            <div class= "infoDiv">
               <img class="ccaa" src="MapaCCAA.png">   
      			<button class="autonomico" onclick="window.location.href='SimulacionAutonomica.jsp'">Parlamentos Autonómicos</button>
         </div>
        </div>   

  </div>
    
</body>
</html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <style type="text/css">
    * {
     box-sizing: border-box;
    padding: 0;
    margin: 0;
    }

    .infoDiv{        
        text-align: center;
        margin-left: 30%;
        margin-right: 20%;
        font-size: 20px;
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

    /* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
    @media screen and (max-width: 600px) {
    .column {
        width: 100%;
    }
    }

    img{
        height: 350px;
        width: 400px;
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
        margin: 25px	;
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

    .loginloc{
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        width: 95px;
        margin-left: 390px;
    }
    
    .intro {
        text-align: center;
        margin-left: 20%;
        margin-right: 20%;
        font-size: 20px;
    }
    
    .simulations {
        text-align: center;
        margin-left: 250px;
    }

    .buttons {
	  margin-left: auto;
	  margin-right: auto;
    }

	button {
		  margin-left: auto;
		  margin-right: auto;
         background-color:#2f4f4f;
         color: white;
         height: 30;
         width:220;
     }
     
    .nacional, .autonomico {
        width: 100px;
        height: 50px;
		  margin-left: auto;
		  margin-right: auto;
    }
    
    </style>
    </head>