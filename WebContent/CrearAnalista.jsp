<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ElectoLab</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.2/xlsx.full.min.js"></script>
</head>
<body>
<ul>
    <li class="title">ELECTOLAB</li>
    <li><a class="navbar" href="Admin.jsp">${analista.name}</a></li>
    <li class="loginloc"><a class="navbar" href="CrearAnalista.jsp">Crear Análisis</a></li>
    <li><a class="navbar" href="MisAnalisis.jsp">Mis Análisis</a></li>
    <li><a class="logout" href="Login.jsp">Log Out</a></li>
</ul>

     <div>
    	<h1>Realiza tu simulación</h1>
	</div>
	
	
 <div class= "row">
        <div class= "column"> 
        
            <div class= "infoDiv">              
       			<img class="españa" src="MapaEspaña.png">
       			<button class="nacional" onclick="window.location.href='SimulacionNacionalAnalista.jsp'">Parlamento Nacional</button>
            </div>
        </div>  
        
        <div class= "column"> 
        
            <div class= "infoDiv">
               <img class="ccaa" src="MapaCCAA.png">   
      			<button class="autonomico" onclick="window.location.href='SimulacionAutonomicaAnalista.jsp'">Parlamentos Autonómicos</button>
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
        margin-left: 30%;
        margin-right: 20%;
        font-size: 20px;
    }
        
        .visualizar {
 			background-color:#2f4f4f;
            display: block;
            margin: auto;
            color: white;
            height: 30;
            width:120;
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


       button {
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

        h1 {
            margin: 25px;
            text-align: center
        }

        h2 {
            margin: 50px;
            text-align: center;
        }

        h3 {
            margin: 40px;
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
        
                .excel {
            width: 100px;
            height: 50px;

            color: black;
        }

        .plantilla-text {
            margin-bottom: 20px;
            margin-top: -20px;
        }

        .plantilla-box, .subida-box {
            margin: 80px;
            text-align: center;
        }

        .subida-box {
            margin-top: 50px;
        }
        
        .buttons {
        	margin-left: 200px;
    	}
        
		 .visualizar {
 			background-color:#2f4f4f;
            display: block;
            margin: auto;
            margin-top: 30px;
            color: white;
            height: 30;
            width:120;
        }
        
        .simulations {
        	margin-left: 250px;
    	}
        
        img {
       		height: 350px;
        	width: 400px;
    	}
   
	    .nacional, .autonomico {
	        width: 100px;
	        height: 50px;
	        margin-right: auto;
	        margin-left: auto;
	    }
    </style>
</head>