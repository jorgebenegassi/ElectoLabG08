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
<h1>Resultados obtenidos por el analista ${analista.name}</h1>


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
        </div>
        <button class="volver" onclick="window.location.href='SimulacionNacionalAnalista.jsp'">Volver</button>
    </div>

    <div class= "column">    
        <div id="donutchart" ></div>
    </div>  
           
<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Madrid'}">
		<input type="hidden" id="MadridCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type="hidden" id="MadridPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type="hidden" id="MadridVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Barcelona'}">
			<input type="hidden" id="BarcelonaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type="hidden" id="BarcelonaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type="hidden" id="BarcelonaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>	    
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Valencia'}">
			<input type="hidden" id="ValenciaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type="hidden" id="ValenciaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type="hidden" id="ValenciaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>    
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Alicante'}">
			<input type="hidden" id="AlicanteCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type="hidden" id="AlicantePartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type="hidden" id="AlicanteVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Sevilla'}">	
			<input type="hidden" id="SevillaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type="hidden" id="SevillaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type="hidden" id="SevillaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>    
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Malaga'}">
			<input type="hidden" id="MalagaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type="hidden" id="MalagaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type="hidden" id="MalagaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Murcia'}">
			<input type ="hidden" id="MurciaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="MurciaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="MurciaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Cadiz'}">
			<input type ="hidden" id="CadizCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="CadizPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="CadizVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Baleares'}">
			<input type ="hidden" id="BalearesCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="BalearesPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="BalearesVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'La Coruna'}">
			<input type ="hidden" id="La CorunaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="La CorunaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="La CorunaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Las Palmas'}">
			<input type ="hidden" id="Las PalmasCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="Las PalmasPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="Las PalmasVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Vizcaya'}">
			<input type ="hidden" id="VizcayaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="VizcayaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="VizcayaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Asturias'}">
			<input type ="hidden" id="AsturiasCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="AsturiasPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="AsturiasVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Granada'}">
			<input type ="hidden" id="GranadaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="GranadaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="GranadaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Pontevedra'}">
			<input type ="hidden" id="PontevedraCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="PontevedraPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="PontevedraVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Santa Cruz de Tenerife'}">
			<input type ="hidden" id="Santa Cruz de TenerifeCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="Santa Cruz de TenerifePartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="Santa Cruz de TenerifeVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Zaragoza'}">
			<input type ="hidden" id="ZaragozaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="ZaragozaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="ZaragozaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Almeria'}">
			<input type ="hidden" id="AlmeriaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="AlmeriaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="AlmeriaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Badajoz'}">
			<input type ="hidden" id="BadajozCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="BadajozPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="BadajozVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Cordoba'}">
			<input type ="hidden" id="CordobaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="CordobaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="CordobaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Gerona'}">
			<input type ="hidden" id="GeronaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="GeronaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="GeronaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Guipuzcoa'}">
			<input type ="hidden" id="GuipuzcoaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="GuipuzcoaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="GuipuzcoaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Tarragona'}">
			<input type ="hidden" id="TarragonaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="TarragonaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="TarragonaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Toledo'}">
			<input type ="hidden" id="ToledoCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="ToledoPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="ToledoVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Cantabria'}">
			<input type ="hidden" id="CantabriaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="CantabriaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="CantabriaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Castellon'}">
			<input type ="hidden" id="CastellonCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="CastellonPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="CastellonVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Ciudad Real'}">
			<input type ="hidden" id="Ciudad RealCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="Ciudad RealPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="Ciudad RealVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Huelva'}">
			<input type ="hidden" id="HuelvaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="HuelvaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="HuelvaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Jaen'}">
			<input type ="hidden" id="JaenCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="JaenPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="JaenVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Navarra'}">
			<input type ="hidden" id="NavarraCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="NavarraPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="NavarraVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Valladolid'}">
			<input type ="hidden" id="ValladolidCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="ValladolidPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="ValladolidVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Alava'}">
			<input type ="hidden" id="AlavaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="AlavaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="AlavaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Albacete'}">
			<input type ="hidden" id="AlbaceteCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="AlbacetePartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="AlbaceteVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Burgos'}">
			<input type ="hidden" id="BurgosCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="BurgosPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="BurgosVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Caceres'}">
			<input type ="hidden" id="CaceresCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="CaceresPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="CaceresVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Leon'}">
			<input type ="hidden" id="LeonCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="LeonPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="LeonVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Lerida'}">
			<input type ="hidden" id="LeridaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="LeridaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="LeridaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Lugo'}">
			<input type ="hidden" id="LugoCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="LugoPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="LugoVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Orense'}">
			<input type ="hidden" id="OrenseCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="OrensePartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="OrenseVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'La Rioja'}">
			<input type ="hidden" id="La RiojaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="La RiojaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="La RiojaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Salamanca'}">
			<input type ="hidden" id="SalamancaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="SalamancaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="SalamancaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Avila'}">
			<input type ="hidden" id="AvilaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="AvilaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="AvilaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Cuenca'}">
			<input type ="hidden" id="CuencaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="CuencaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="CuencaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Guadalajara'}">
			<input type ="hidden" id="GuadalajaraCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="GuadalajaraPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="GuadalajaraVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Huesca'}">
			<input type ="hidden" id="HuescaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="HuescaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="HuescaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Palencia'}">
			<input type ="hidden" id="PalenciaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="PalenciaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="PalenciaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Segovia'}">
			<input type ="hidden" id="SegoviaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="SegoviaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="SegoviaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Teruel'}">
			<input type ="hidden" id="TeruelCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="TeruelPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="TeruelVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Zamora'}">
			<input type ="hidden" id="ZamoraCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="ZamoraPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="ZamoraVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Soria'}">
			<input type ="hidden" id="SoriaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="SoriaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="SoriaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Ceuta'}">
			<input type ="hidden" id="CeutaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="CeutaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="CeutaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
	      	<c:set var="i" value="${i+1}"/>
	</c:if>
</c:forEach>

<c:set var="i" value="${0}"/>
<c:forEach items="${votos}" var="votosi">
	<c:if test="${votosi.circunscripcion == 'Melilla'}">
			<input type ="hidden" id="MelillaCircunscripcion${i}" name="circunscripcion" value="${votosi.circunscripcion}" />
	      	<input type ="hidden" id="MelillaPartido${i}" name="partido" value="${votosi.partido}" />
	      	<input type ="hidden" id="MelillaVotosPartido${i}" name="votosPartido" value="${votosi.numVotosPartido}" />
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
var partidosTotal = new Array();
var info = "" ;

var  abc = [
	['Task', 'Escaños'],              
    [,    350],     
];

var  colores = ['transparent'];

function updateValues(){
	var basecolor = "#FF33C"
	
	for(let i=1; i < partidosTotal.length; i++){
		
	
			abc[abc.length] = [partidosTotal[i].nomPart, partidosTotal[i].escaños];
			
		    info = info + "<br><strong>"+ partidosTotal[i].nomPart +"</strong>: " + partidosTotal[i].escaños + " escaños y  un total de " + partidosTotal[i].votos *1000 + " votos.</br>"
			
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
			}else if(partidosTotal[i].nomPart == "MASPAIS"){
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
    	for(let i = 0; i < 5 ; i++){
    		partidos[i] = new Partido();
    		partidos[i].nomPart = document.getElementById(circunscripcion+"Partido"+i).value;
    		partidos[i].votos = document.getElementById(circunscripcion+"VotosPartido"+i).value;
    		partidos[i].votos = parseInt(partidos[i].votos);
    		numTotalVotos += partidos[i].votos;
    	}
    	if(circunscripcion == "Madrid"){
    		numEscaños = 37;    	  
    	} else if(circunscripcion == "Barcelona"){
    		numEscaños = 32;
    	} else if(circunscripcion == "Valencia"){
    		numEscaños = 15;
    	} else if((circunscripcion == "Alicante") ||
    			(circunscripcion == "Sevilla")){
    		numEscaños = 12;
    	} else if(circunscripcion == "Malaga"){
    		numEscaños = 11;
    	} else if(circunscripcion == "Murcia"){
    		numEscaños = 10;
    	} else if(circunscripcion == "Cadiz"){
    		numEscaños = 9;
    	} else if((circunscripcion == "Baleares") ||
    			(circunscripcion == "La Coruna") ||
    			(circunscripcion == "Las Palmas") ||
    			(circunscripcion == "Vizcaya")){
    		numEscaños = 8;
    	} else if((circunscripcion == "Asturias") ||
    			(circunscripcion == "Granada") ||
    			(circunscripcion == "Pontevedra") ||
    			(circunscripcion == "Santa Cruz de Tenerife") ||
    			(circunscripcion == "Zaragoza")){
    		numEscaños = 7;
    	} else if((circunscripcion == "Almeria") ||
    			(circunscripcion == "Badajoz") ||
    			(circunscripcion == "Cordoba") ||
    			(circunscripcion == "Gerona") ||
    			(circunscripcion == "Guipuzcoa") ||
    			(circunscripcion == "Tarragona") ||
    			(circunscripcion == "Toledo")){
    		numEscaños = 6;
    	} else if((circunscripcion == "Cantabria") ||
    			(circunscripcion == "Castellon") ||
    			(circunscripcion == "Ciudad Real") ||
    			(circunscripcion == "Huelva") ||
    			(circunscripcion == "Jaen") ||
    			(circunscripcion == "Navarra") ||
    			(circunscripcion == "Valladolid")){
    		numEscaños = 5;
    	} else if((circunscripcion == "Alava") ||
    			(circunscripcion == "Albacete") ||
    			(circunscripcion == "Burgos") ||
    			(circunscripcion == "Caceres") ||
    			(circunscripcion == "Leon") ||
    			(circunscripcion == "Lerida") ||
    			(circunscripcion == "Lugo") ||
    			(circunscripcion == "Orense") ||
    			(circunscripcion == "La Rioja") ||
    			(circunscripcion == "Salamanca")){
    		numEscaños = 4;
    	} else if((circunscripcion == "Avila") ||
    			(circunscripcion == "Cuenca") ||
    			(circunscripcion == "Guadalajara") ||
    			(circunscripcion == "Huesca") ||
    			(circunscripcion == "Palencia") ||
    			(circunscripcion == "Segovia") ||
    			(circunscripcion == "Teruel") ||
    			(circunscripcion == "Zamora")){
    		numEscaños = 3;
    	} else if(circunscripcion == "Soria"){
    		numEscaños = 2;
    	} else if((circunscripcion == "Ceuta") ||
    			(circunscripcion == "Melilla")){
    		numEscaños = 1;
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
			 if(partidos[i].porcentaje >= 3){ //Si pasa el corte de más del 3% de los votos:
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

					partidosTotal[j].votos += partidos[i].votos;
					partidosTotal[j].escaños += partidos[i].escaños;
					
				}
				
				if( posicion == partidosTotal.length){
					
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
	updateVars()
}

let circunscripciones = ["Madrid", "Barcelona", "Valencia", "Alicante", "Sevilla", "Malaga", "Murcia",
	"Cadiz", "Baleares", "La Coruna", "Las Palmas", "Vizcaya", "Asturias", "Granada", "Pontevedra",
	"Santa Cruz de Tenerife", "Zaragoza", "Almeria", "Badajoz", "Cordoba", "Gerona", "Guipuzcoa", 
	"Tarragona", "Toledo", "Cantabria", "Castellon", "Ciudad Real", "Huelva", "Jaen", "Navarra",
	"Valladolid", "Alava", "Albacete", "Burgos", "Caceres", "Leon", "Lerida", "Lugo", "Orense", "La Rioja",
	"Salamanca", "Avila", "Cuenca", "Guadalajara", "Huesca", "Palencia", "Segovia", "Teruel", "Zamora",
	"Soria", "Ceuta", "Melilla"];

for(let i = 0; i < circunscripciones.length; i++){
	Simular(circunscripciones[i]);
}


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
	        height: 40px;
        }

        .volver {
            display: block;            margin-left: auto;
            margin-right: auto;
	        width: 150px;
	        height: 40px;
        }

    </style>
</head>














