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
	    <li><a class="navbar" href="Admin.jsp">${analista.name}</a></li>
	    <li class="loginloc"><a class="navbar" href="CrearAnalista.jsp">Crear Análisis</a></li>
	    <li><a class="navbar" href="MisAnalisis.jsp">Mis Análisis</a></li>
	    <li><a class="logout" href="Login.jsp">Log Out</a></li>
	</ul>
    
    <div class = "titleIntro">
    <h2>Seleccione la Comunidad Autónoma que desea simular y descargue la plantilla para realizar una simulación electoral autonomica</h2>
    </div>
    
    
    
<div class= "row">

    <div class= "column">   
	    <div class="plantilla-box">
			   
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
				<br></br>
				<br></br>	
			<div id="excel" class="plantilla-text">Descargue la Plantilla</div>
				<a id="excelPrincipal" download="Plantilla_simulacion_andalucia.xlsx" href="Plantilla_simulacion_andalucia.xlsx">
					<img class="excel" src="Excel.png"/>
				</a>
			</div>
	</div>	
				
        <div class= "column"> 
			<div class="subida-box">
   			<h2>Suba su simulación</h2>
				Introduzca una breve descripción
				<br></br>
				<input class= "textinput" type="text" id="descripcion" name="descripcion" size="40" required>
				<br></br>
				<input class="form-control" type="file" id="input" name="inputFile" accept=".xls,.xlsx">
			</div>
		</div>
	</div>

	<form action="SimulacionAutonomicaAnalistaServlet">
		<input type=hidden id="json2" name="json2" value="">
	    <input type="hidden" id="idAnalista" name="idAnalista" value="${analista.id}">
		<input type="submit" id="submit" class="visualizar" value="Visualizar">
	
	</form>
	
	<script type="text/javascript">
		let selectedFile;
		let jsondata;	
		document.getElementById("input").addEventListener("change", (event)=>{
			selectedFile = event.target.files[0];
		})
		document.getElementById("submit").addEventListener("click", ()=>{
			if(selectedFile){
				let fileReader = new FileReader();
				fileReader.readAsBinaryString(selectedFile);
				fileReader.onload = (event)=>{
					let data = event.target.result;
					let workbook = XLSX.read(data,{type:"binary"});
					workbook.SheetNames.forEach(sheet =>{
						let rowObject = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheet]);
						jsondata = JSON.stringify(rowObject,undefined,4);	
						idAnalista = document.getElementById("idAnalista").value;
						descripcion = document.getElementById("descripcion").value;
						//jsondata = JSON.parse(jsondata);
						console.log(jsondata);
						if(jsondata !=''){
							$.ajax({
				                url: "SimulacionAutonomicaAnalistaServlet",
				                type: "POST",
				                data: { "json": jsondata, "idAnalista": idAnalista , "descripcion" :descripcion, "nacional" : "false" , "autonomia" : document.getElementById("mySelect").value},
				                datatype: "json",
								
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
	        height:12%;
	        width: 30%;
            margin-top: 10;
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
        	margin: 25px;
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
         .titleIntro{
            margin-left: 10%;
            margin-right: 10%;
            text-align: center;
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