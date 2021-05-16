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
<script type="text/javascript">

			$.ajax({
                url: "AnalisisRealizadosServlet",
                type: "get",
                               
            });	
			
</script>
<body>
     <ul>
        <li class="title">ELECTOLAB</li>
        <li><a class="navbar" href="index.html">Inicio</a></li>
        <li><a class="navbaractive" href="AnalisisRealizados.jsp">Análisis Realizados</a></li>
        <li><a class="navbar" href="ResultadosPrevios.jsp">Resultados Previos</a></li>
        <li><a class="navbar" href="SimulacionBasica.jsp">Simulación</a></li>
        <li><a class="loginloc" href="Login.jsp">Log In</a></li>
    </ul>
 
<div>
<h2>Seleccione el análisis que desea ver</h2>
</div>
<div class= "results">
<table>
	 <tr>
		<th scope="col">Análisis número</th>
		<th scope="col">Analista</th>
		<th scope="col">Descripcion</th>
		<th scope="col">Fecha de realización</th>
	 </tr>

	<c:set var="i" value="${0}"/>
	<c:forEach items="${simulaciones}" var="escenario">
	 		<tr>
			<td class="border">${escenario.id}</td>
			<td class="border">${escenario.analista.name}</td>
			<td class="border">${escenario.descripcion}</td>
			<td class="border">${escenario.fecha}</td>
			<td>
				<form action="VisualizarSimulacionServlet">
			    <input type="hidden" id="idSimulacion" name="idSimulacion" value="${escenario.id}">
				<input type="submit" id="submit" class="visualizar" value="Visualizar">
				</form>
			</td>
		    <c:set var="i" value="${i+1}"/>
		     </tr>
	</c:forEach>

</table>
</div>
</body>

<script>
		function reloadIt() {
		    if (window.location.href.substr(-2) !== "?r") {
		        window.location = window.location.href + "?r";
		    }
		}

		setTimeout('reloadIt()', 0000)();
</script>
</html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <style type="text/css">
    * {
     box-sizing: border-box;
    padding: 0;
    margin: 0;
    }
    .results{
            margin-top:5%;
    }
	table{
            margin-left: auto;
            margin-right: auto;
            margin-bottom:30;
            width: 50%; 
            font-size: 18px;  
        }
        
        .border{
        	margin:5px;
        	padding: 15px;
            text-align: center;
        }
    .infoDiv{        
        text-align: center;
        margin-left: 20%;
        margin-right: 20%;
        font-size: 20px;
    }

    .column {
    float: left;
    width: 33.33%;
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
        margin:30;
        height: 100;
        width: 100;
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
        margin: 25;
        text-align: center
    }

        h2 {
            margin: 25px;
            text-align: center;
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
    </style>
    </head>