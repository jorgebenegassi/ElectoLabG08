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



    <h2>Descargue la plantilla para realizar una simulación electoral nacional</h2>
	    

<div class= "row">

    <div class= "column">   
    
			<div class="plantilla-box">
			    <div class="plantilla-text">Pulse en el icono para descargar la Plantilla</div>
			    <a download="plantilla_simulacion_nacional.xlsx" href="Plantilla_simulacion_nacional.xlsx"><img class="excel" src="Excel.png"></a>
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
	
	<form action="SimulacionNacionalAnalistaServlet">
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
						if(jsondata !=''){
							$.ajax({
				                url: "SimulacionNacionalAnalistaServlet",
				                type: "POST",
				                data: { "json": jsondata, "idAnalista": idAnalista , "descripcion" :descripcion, "nacional" : "true"},
				                datatype: "json",
							//	succes: function(data){
								//	if(data){
									//	window.href("ResultadoSimulacionNacionalAnalista.jsp");
									//}
								//},
				            });
							
						}
					})
				}
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
        .textinput{
            margin-top: 20;
            margin-bottom: 20
          
        }
        
        .visualizar {
 			background-color:#2f4f4f;
            display: block;
            margin: auto;
            margin-top: 30px;
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

        /* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 600px) {
            .column {
                width: 100%;
            }
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
        


    </style>
</head>