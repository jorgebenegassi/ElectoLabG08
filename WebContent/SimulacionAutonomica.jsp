<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>ElectoLab</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.2/xlsx.full.min.js"></script>
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
    
    <h2>Seleccione la Comunidad Autónoma que desea simular</h2>
    <select class="select" id="mySelect">
   	 	<option id="Andalucia">Andalucía</option>
   	 	<option id="Aragon">Aragón</option>
   	 	<option id="Asturias">Asturias</option>
   	 	<option id="Baleares">Baleares</option>
   	 	<option id="Canarias">Canarias</option>
   	 	<option id="Cantabria">Cantabria</option> 	 	
   	 	<option id="CastillaLaMancha">Castilla-La Mancha</option>
   	 	<option id="CastillaYLeon">Castilla y León</option>
   	 	<option id="Cataluña">Cataluña</option>
   	 	<option id="ComunidadValenciana">Comunidad Valenciana</option>
   	 	<option id="Extremadura">Extremadura</option>
   	 	<option id="Galicia">Galicia</option>
   	 	<option id="LaRioja">La Rioja</option>
   	 	<option id="Madrid">Madrid</option>
   	 	<option id="Murcia">Murcia</option>
   	 	<option id="Navarra">Navarra</option>
   	 	<option id="PaisVasco">País Vasco</option>
	</select>
    <h2>Descargue la plantilla para realizar una simulación electoral autonomica</h2>
	<div class="plantilla-box">
		<div id="excel" class="plantilla-text">Plantilla</div>
			<a id="excelPrincipal" download="Plantilla_simulacion_andalucia.xlsx" href="url">
				<img class="excel" src="Excel.png"/>
			</a>
		</div>
	<div>
		<div>
   			<h2>Suba su simulación</h2>
			<div class="subida-box">
				<input class="form-control" type="file" id="input" name="inputFile" accept=".xls,.xlsx">
			</div>
		</div>
	</div>

	<script type="text/javascript">
		let selectedFile;
		let jsondata;	
		document.getElementById("input").addEventListener("change", (event)=>{
			selectedFile = event.target.files[0];
		})
		document.getElementById("input").addEventListener("change", ()=>{
			if(selectedFile){
				let fileReader = new FileReader();
				fileReader.readAsBinaryString(selectedFile);
				fileReader.onload = (event)=>{
					let data = event.target.result;
					let workbook = XLSX.read(data,{type:"binary"});
					workbook.SheetNames.forEach(sheet =>{
						let rowObject = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheet]);
						jsondata = JSON.stringify(rowObject,undefined,4);	
						//jsondata = JSON.parse(jsondata);
						console.log(jsondata);
						if(jsondata !=''){
							$.ajax({
				                url: "SimulacionAutonomicaServlet",
				                type: "POST",
				                data: { "json": jsondata },
				                datatype: "json",
								succes: function(data){
									if(data){
										window.href("ResultadoSimulacionAutonomica.jsp");
									}
								},
				            });
						}
					})
				}
			}
			
		
		})
	</script>
	
	<script>
	document.getElementById("mySelect").addEventListener("change", (event)=>{
		if(document.getElementById("mySelect").value == "Asturias"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_asturias.xlsx\" href=\"Plantilla_simulacion_asturias.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Andalucía"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_andalucia.xlsx\" href=\Plantilla_simulacion_andalucias.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Aragón"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_aragon.xlsx\" href=\"Plantilla_simulacion_aragon.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Baleares"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_baleares.xlsx\" href=\"Plantilla_simulacion_baleares.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Canarias"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_canarias.xlsx\" href=\"Plantilla_simulacion_canarias.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Cantabria"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_cantabria.xlsx\" href=\"Plantilla_simulacion_cantabria.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Castilla-La Mancha"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_castillalamancha.xlsx\" href=\"Plantilla_simulacion_castillalamancha.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Castilla y León"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_castillayleon.xlsx\" href=\"Plantilla_simulacion_castillayleon.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Cataluña"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_cataluña.xlsx\" href=\"Plantilla_simulacion_cataluña.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Comunidad Valenciana"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_comunidadvalenciana.xlsx\" href=\"Plantilla_simulacion_comunidadvalenciana.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Extremadura"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_extremadura.xlsx\" href=\"Plantilla_simulacion_extremadura.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Galicia"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_galicia.xlsx\" href=\"Plantilla_simulacion_galicia.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "La Rioja"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_larioja.xlsx\" href=\"Plantilla_simulacion_larioja.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Madrid"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_madrid.xlsx\" href=\"Plantilla_simulacion_madrid.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Murcia"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_murcia.xlsx\" href=\"Plantilla_simulacion_murcia.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "Navarra"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_navarra.xlsx\" href=\"Plantilla_simulacion_navarra.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		} else if(document.getElementById("mySelect").value == "País Vasco"){
			document.getElementById("excelPrincipal").innerHTML = "";
			document.getElementById("excel").innerHTML ="<div id=\"excel\" class=\"plantilla-text\">Plantilla</div><a id=\"excel\" download=\"Plantilla_simulacion_paisvasco.xlsx\" href=\"Plantilla_simulacion_paisvasco.xlsx\"><img class=<\"excel\" src=\"Excel.png\" style=\"width: 100px;\"/></a></div>";
		}
	})
	</script>
	
	
 	<form action="SimulacionAutonomicaServlet">
		<input type="submit" class="visualizar" value="Visualizar">
	</form> 
	
	
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
        
        .select {
        	display: block;
            margin: auto;
        }
        
        .visualizar {
 			background-color:#2f4f4f;
            display: block;
            margin: auto;
            margin-top: 0px;
            color: white;
	        width: 150px;
	        height: 40px;
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
        }

        .plantilla-text {
            margin-bottom: 20px;
            margin-top: -20px;
        }

        .plantilla-box, .subida-box {
            margin: 40px;
            text-align: center;
        }

        .subida-box {
            margin-top: 50px;
        }
        


    </style>
</head>