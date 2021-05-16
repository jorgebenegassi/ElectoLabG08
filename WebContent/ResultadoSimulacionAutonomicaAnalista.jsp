<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta charset="ISO-8859-1">
<title>ElectoLab</title>
</head>
<body>

	<ul>
	    <li class="title">ELECTOLAB</li>
	    <li><a class="navbar" href="Admin.jsp">${analista.name}</a></li>
	    <li class="loginloc"><a class="navbar" href="CrearAnalista.jsp">Crear Análisis</a></li>
	    <li><a class="navbar" href="MisAnalisis.jsp">Mis Análisis</a></li>
	    <li><a class="logout" href="Login.jsp">Log Out</a></li>
	</ul>


<h1>Resultados obtenidos</h1>


<div class= "row">

    <div class= "column">     

        <div class= "infoDiv">
            <h2>Reparto de votos </h2>
            <br>
            <div id = "TOTALVOTOS"></div>
            <br>
            <div id = "PP"></div>
            <br>
            <div id = "PSOE"></div>
            <br>
            <div id = "CIU"></div>
            <br>
            <div id = "VOX"></div>
            <br>
            <div id = "UP"></div>
            <br>
            <div id = "MASMADRID"></div>
        </div>
        <button class="volver" onclick="window.location.href='SimulacionAutonomicaAnalista.jsp'">Volver</button>
    </div>

    <div class= "column">    
        <div id="donutchart" ></div>
    </div>  
           
    </div>  

 <!-- PARA VER TODOS LOS RESULTADOS:
	<c:forEach items="${votos}" var="votosi">
        <tr>
        <input type ="hidden" id="circunscripcion" name="circunscripcion" value="${votosi.circunscripcion}" />
        <input type ="hidden" id="escano" name="escano" value="${votosi.partido}" />
        <input type ="hidden" id="votosPartido" name="votosPartido" value="${votosi.numVotosPartido}" />
        </tr>
	</c:forEach>
</table> -->
<c:forEach items="${votos}" var="votosi">
<input type="hidden" id="simulacion" value="${votosi.circunscripcion}"/>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Madrid'}">
		<input type="hidden" id="NumPartidos" value="6"/>
		<input type="hidden" id="MadridCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
      	<input type="hidden" id="MadridPartido${i}" name="partido" value="${votosi.partido}" />
      	<input type="hidden" id="MadridVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Asturias Central'}">
		<input type="hidden" id="NumPartidos" value="5"/>
		<input type="hidden" id="Asturias CentralCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
      	<input type="hidden" id="Asturias CentralPartido${i}" name="partido" value="${votosi.partido}" />
      	<input type="hidden" id="Asturias CentralVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Asturias Occidental'}">
		<input type="hidden" id="NumPartidos" value="5"/>
		<input type="hidden" id="Asturias OccidentalCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
      	<input type="hidden" id="Asturias OccidentalPartido${i}" name="partido" value="${votosi.partido}" />
      	<input type="hidden" id="Asturias OccidentalVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Asturias Oriental'}">
		<input type="hidden" id="NumPartidos" value="5"/>
		<input type="hidden" id="Asturias OrientalCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
      	<input type="hidden" id="Asturias OrientalPartido${i}" name="partido" value="${votosi.partido}" />
      	<input type="hidden" id="Asturias OrientalVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<script type="text/javascript">
if (localStorage.getItem('loadedOnce') === 'true') {
    // don't reload page, but clear localStorage value so it'll get reloaded next time
    localStorage.removeItem('loadedOnce');
} else {
    // set the flag and reload the page
    localStorage.setItem('loadedOnce', 'true');
    document.location.reload(true);
}
</script>

<script> //SCRIPT QUE TE SACA EL NÚMERO DE ESCAÑOS

var censoElectoral = 0;

var numPartidos = document.getElementById("NumPartidos").value;

var partidosTotal = new Array();
var info = "" ;

var  abc = [
	['Task', 'Escaños'],     
];

var  colores = ['transparent'];

function updateValues(){
	var basecolor = "#FF33C"
	
	for(let i=1; i < partidosTotal.length; i++){
		
	
			abc[abc.length] = [partidosTotal[i].nomPart, partidosTotal[i].escaños];
			
		    info = info + "<br><strong>"+ partidosTotal[i].nomPart +"</strong>: " + partidosTotal[i].escaños + " escaños y  un total de " + partidosTotal[i].votos * 1000 + " votos.</br>"
			
		    censoElectoral += partidosTotal[i].votos;
		    
		    if(partidosTotal[i].nomPart == "PP"){
		    	colores[colores.length] = 'blue'
			} else if(partidosTotal[i].nomPart == "PSOE"){
				colores[colores.length] = 'red'
			} else if(partidosTotal[i].nomPart == "VOX"){
				colores[colores.length] = '#32CD32'
			} else if(partidosTotal[i].nomPart == "CIUDADANOS"){
				colores[colores.length] = '#FF8C00'
			} else if(partidosTotal[i].nomPart == "PODEMOS"){
				colores[colores.length] = 'purple'
			} else if(partidosTotal[i].nomPart == "PNV"){
				colores[colores.length] = '#339933'
			}else if(partidosTotal[i].nomPart == "ERC"){
				colores[colores.length] = '#FFFF33'
			}else if(partidosTotal[i].nomPart == "JXCAT"){
				colores[colores.length] = '#CC0066'
			}else if(partidosTotal[i].nomPart == "MAS MADRID"){
				colores[colores.length] = '#22AA99'
			}else{
				colores[colores.length] = basecolor + i;
			}

		}
	
	
	document.getElementById("TOTALVOTOS").innerHTML="Ha habido un total de " + censoElectoral * 1000 + " votos.";    
	document.getElementById("PP").innerHTML= info;    

}

function Simular(circunscripcion){
	var partidos = new Array();
	var votos = new Array();
	var totalVotos = new Array();
	var reparteEscaños = new Array();
	var numTotalVotos = 0;
	var numEscaños;
	
	class Partido {
	    constructor(nomPart, votos, porcentaje, escaños) {
	        this.nomPart = nomPart;
	        this.votos = votos;
	        this.porcentaje = porcentaje;
	        this.escaños = escaños; 
	    }
	
	      //Método para calcular el porcentaje de votos
	    calcularPorc() {
	        this.porcentaje = Math.round((this.votos * 100) / numTotalVotos);
	    }
	}
	  
      //Funcion para cargar los datos
	function cargaDatos(){
    	for(let i = 0; i < numPartidos; i++){
    		partidos[i] = new Partido();
    		partidos[i].nomPart = document.getElementById(circunscripcion+"Partido"+i).value;
    		partidos[i].votos = document.getElementById(circunscripcion+"VotosPartido"+i).value;
    		partidos[i].votos = parseInt(partidos[i].votos);
    		numTotalVotos += partidos[i].votos;
    	}
    	if(circunscripcion == "Madrid"){
    		numEscaños = 136;    	  
    	} else if(circunscripcion == "Asturias Central"){
    		numEscaños = 34;    	  
    	} else if(circunscripcion == "Asturias Occidental"){
    		numEscaños = 6;    	  
    	} else if(circunscripcion == "Asturias Oriental"){
    		numEscaños = 5;    	  
    	} 
	}
      
    function calculaPorcentaje(){
    	for(let i = 0; i < partidos.length; i++){
    		partidos[i].calcularPorc();
    	}
    }
        	
	function ordenaPartidos(){
		partidos.sort(function(a, b){
			if(a.votos > b.votos){
				return -1;
			} else if(a.votos < b.votos){
				return 1;
			} else {
				return 0;
			}
		});
	}
    
        
	function tablaII(){
		let votoDiv; //Resultado de ir dividiendo los votos
		for(let k = 1; k <= numEscaños; k++){
		}
		 for(let i = 0; i < partidos.length; i++){
			 if(partidos[i].porcentaje >= 5){ //Si pasa el corte de más del 3% de los votos:
		         votos[i] = new Array();
				 for(j = 0; j < numEscaños; j++){
					 votoDiv = partidos[i].votos / (j+1); //Se hace la división de los votos
					 votoDiv = votoDiv.toFixed(2); //Saca dos decimales
					 votos[i].push([votoDiv, i]);
				 }
			 }
		 }
	}

	function rellenaVotos(){
		for(let i = 0; i < votos.length; i++){
			totalVotos = totalVotos.concat(votos[i]);
		}
	}
	
	function ordenarVotos(){
		totalVotos.sort(function(a, b){
			return b[0] - a[0];
		});
	}
	
	function repartirEscaños(){
		for(let i = 0; i < numEscaños; i++){
			reparteEscaños.push(totalVotos[i]);
		}
		for(var i = 0; i < partidos.length; i++){
			partidos[i].escaños = 0;
			for(let j = 0; j < reparteEscaños.length; j++){
				if(reparteEscaños[j][1] == [i] && [i] <= partidos.length){
					partidos[i].escaños = partidos[i].escaños + 1;
				}
			}
		}
	}

	function updateVars(){
		partidosTotal[0]=  new Partido();
		partidosTotal[0].nomPart = "";
		
		for(let i=0; i < partidos.length; i++){
			var posicion = 0;
			for(let j=0; j < partidosTotal.length; j++){
				
				if(partidosTotal[j].nomPart != partidos[i].nomPart ){
					posicion += 1;
					
				}else if (partidosTotal[j].nomPart == partidos[i].nomPart){

					console.log(partidos[i].nomPart )
					partidosTotal[j].votos += partidos[i].votos;
					partidosTotal[j].escaños += partidos[i].escaños;
					
				}
				
				if( posicion == partidosTotal.length){
					console.log(partidos[i].nomPart )
					
					partidosTotal[partidosTotal.length] = new Partido();
										
					partidosTotal[posicion].nomPart = partidos[i].nomPart;
					partidosTotal[posicion].votos = partidos[i].votos;
					partidosTotal[posicion].escaños = partidos[i].escaños;
					
					j++;
				}
					
				}
			}
	}
	
	//Llamo a las funciones.
	cargaDatos();
	calculaPorcentaje();
	ordenaPartidos();
	tablaII();
	rellenaVotos();
	ordenarVotos();
	repartirEscaños();
	updateVars();
}


if(document.getElementById("simulacion").value == "Asturias Central"){
	Simular("Asturias Central");
	Simular("Asturias Occidental");
	Simular("Asturias Oriental");

	abc[abc.length] = [,    45];
	
	updateValues();


	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
	    var data = google.visualization.arrayToDataTable(abc);
	    
	    var options = {
	    title: 'Resultados',
	    pieSliceText: 'none',
	    pieHole: 0.4,
	    'width':900,
	    tooltip: {
	        text: 'value'
	    },
	    'height':700,
	    pieStartAngle: 90, 
	    colors: colores
	    
	    };

	    var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	    chart.draw(data, options);
	}
}

if(document.getElementById("simulacion").value == "Madrid"){
	Simular("Madrid");
	
	abc[abc.length] = [,    136];
	
	updateValues();

	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
	    var data = google.visualization.arrayToDataTable(abc);
	    
	    var options = {
	    title: 'Resultados',
	    pieSliceText: 'none',
	    pieHole: 0.4,
	    'width':900,
	    tooltip: {
	        text: 'value'
	    },
	    'height':700,
	    pieStartAngle: 90, 
	    colors: colores
	    
	    };

	    var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	    chart.draw(data, options);
	}
}


</script>

	
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
        
       
        .selector{
            text-align-last:center;
            margin:20;
            height:12%;
            width: 70%;
        }
        .infoDiv{
            margin-top: 10%;
            margin-left: 5%;
            margin-right: 20%;
            font-size: 18px;
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

        /* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 600px) {
            .column {
                width: 100%;
            }
        }

        img{
            display: block;
            margin-right: auto;
            margin-left: auto;
            height: 700;
            width: 700;
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
            margin-top: 25px;
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
            margin-left: 20%;
            margin-right: 20%;
            font-size: 20px;
        }

        button {
            background-color:#2f4f4f;
            color: white;
	        width: 150px;
	        height: 40px;        }

        .volver {
            display: block;

            margin-left: auto;
            margin-right: auto;
	        width: 150px;
	        height: 40px;
        }

    </style>
</head>















