<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<title>ElectoLab</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.2/xlsx.full.min.js"></script>
</head>
<body>
     <ul>
        <li class="title">ELECTOLAB</li>
        <li><a class="navbar" href="index.html">Inicio</a></li>
        <li><a class="navbar" href="AnalisisRealizados.jsp">Análisis Realizados</a></li>
        <li><a class="navbaractive" href="ResultadosPrevios.jsp">Resultados Previos</a></li>
        <li><a class="navbar" href="SimulacionBasica.jsp">Simulación</a></li>
        <li><a class="loginloc" href="Login.jsp">Log In</a></li>
    </ul>
    
    
 <h2>Seleccione la fecha de las elecciones que desea ver</h2>   

	    
    <div class= "row">
    
        <div class= "column"> 
            <div class= "infoDiv2">
			<img  height ="450" width="900" name="congreso" src="fotos/1979.png"/>
			</div>
        </div> 
        
        <div class= "column">         
            <div class= "infoDiv">
             <form name="form" action="ResultadosPreviosServlet">
			 <select name="fecha"  id="fecha" onChange="switchData()">
			 	 <option value="1979">1979</option>
				 <option value="1982">1982</option>  
				 <option value="1986">1986</option>
				 <option value="1989">1989</option>
				 <option value="1993">1993</option>
				 <option value="1996">1996</option>
				 <option value="2000">2000</option>
				 <option value="2004">2004</option>
				 <option value="2008">2008</option>
				 <option value="2011">2011</option>
				 <option value="2015">2015</option>
				 <option value="2016">2016</option>
				 <option value="2019">2019</option> 
			</select>
			</form>
			
			<iframe id="myHtml" width="450" height="450"  frameBorder="0" src="previos/1979.html"></iframe>
			<form name="descarga" method="get" action="previos/1979.xlsx">
				<button type ="submit">Descargar Datos</button>
			</form>
			</div>
        </div> 
     </div>   
	
		
	<script type="text/javascript">
	
	var selectedFile;
	var jsondata;	
	
	function switchData() {
	    var date = document.form.fecha.options[document.form.fecha.selectedIndex].value;
	    document.congreso.src = "fotos/" + date + ".png";
	    document.descarga.action = "previos/"+ date + ".xlsx";
	    document.getElementById('myHtml').src = "previos/"+ date + ".html";
	}	
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
        select{
	        height:12%;
	        width: 30%;  
	         text-align-last:center;
        margin-bottom : 5%; 
        }
        .infoDiv2{        
        text-align: center;
        margin-left: 5%;
        margin-right: 30%;
    	}
        .infoDiv{        
        text-align: center;
        margin-left: 40%;
        margin-right: 20%;
        font-size: 20px;
    	}
        .userinput{
            height: 30;
            width:220;
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
	        width: 150px;
	        height: 40px;
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
	        display: block;
	        color: white;
	        text-align: center;
	        padding: 14px 16px;
	        text-decoration: none;
	        width: 95px;
        margin-left: 390px;
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
            margin-left: 500px;
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
        


    </style>
</head>