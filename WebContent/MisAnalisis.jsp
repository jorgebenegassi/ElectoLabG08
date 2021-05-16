<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="ISO-8859-1">
<title>ElectoLab</title>
</head>

<body>


<ul>
    <li class="title">ELECTOLAB</li>
    <li><a class="navbar" href="Admin.jsp">${analista.name}</a></li>
    <li><a class="navbar" href="CrearAnalista.jsp">Crear Análisis</a></li>
    <li class="loginloc"><a class="navbar" href="MisAnalisis.jsp">Mis Análisis</a></li>
    <li><a class="logout" href="Login.jsp">Log Out</a></li>
</ul>

<h2>Seleccione el análisis que desea ver</h2>

<table id = "tabla">
	 <tr>
		<th scope="col">Análisis número</th>
		<th scope="col">Fecha de realización</th>
		<th scope="col">Descripción</th>
	 </tr>

	<c:set var="i" value="${0}"/>
	<c:forEach items="${simulacionesAnalista}" var="escenario">
	 		<tr>
			<td class="border">${escenario.id}</td>
			<td class="border">${escenario.descripcion}</td>
			<td class="border">${escenario.fecha}</td>
			<td>
			<form action="VisualizarSimulacionAnalistaServlet">
			    <input type="hidden" id="idSimulacion" name="idSimulacion" value="${escenario.id}">
				<input type="submit" id="submit" class="visualizar" value="Visualizar">
				</form>
        	</td>
		    <c:set var="i" value="${i+1}"/>
		     </tr>
	</c:forEach>

</table>




<script type="text/javascript">


		$.ajax({
                url: "MisAnalisisServlet",
                type: "get",
                data: { "idAnalista": ${analista.id}},
                datatype: "json",
                               
            });	

		function reloadIt() {
		    if (window.location.href.substr(-2) !== "?r") {
		        window.location = window.location.href + "?r";
		    }
		}

		setTimeout('reloadIt()', 0000)();
		
</script>

</body>
</html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        * {
            padding: 0;
            margin: 0;
        }
        table{
            margin-left: auto;
            margin-right: auto;
            margin-top: 20px;
            width: 50%; 
            font-size: 18px;  
        }
        
        .border{
        	margin:5px;
        	padding: 15px;
            text-align: center;
        }
        .userinput{
            height: 30;
            width:220;
        }

        .column {
            float: left;
            width: 50%;
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
            margin: 25px;
            margin-bottom : 70px;
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


    </style>
</head>