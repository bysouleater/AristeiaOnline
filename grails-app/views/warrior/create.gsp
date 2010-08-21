<html>
	<head>
		<meta name="layout" content="main"></meta>
		<style>
			.regForm{
				margin-top:15px;
				padding-left:30px;
			}
			.regInput{
				float:left
				width:200px;
				margin-left:15px;
			}
			.regFields{
				width:400px;
			}
			.regInputLbl{
				margin-top:5px;
				float:left;
				font-weight:bold;
				width:70px;
			}
			.regRadios{
				float:left;
				width:400;
				margin-top:5px;
				padding-left:20px;
			}
			.regRadios input{
				margin-right:5px;
				margin-left:15px;
			}
		</style>
	</head>
	<body>
		<h2>Crear nuevo guerrero</h2>
		<div class="regForm">	
			<g:form method="get" controller="warrior">
				<div class="regFields">
					<div class="regInputLbl">Nombre:</div><div class="regInput"><g:textField name="name" value=""/></div>
					<div class="regRadios"><input name="sex" type="radio" value="M" checked/>Masculino <input name="sex" type="radio" value="F"/>Femenino</div>
				</div>

				<div style="clear:both"></div>
				<div style="text-align:center;margin-top:20px;">
					<g:actionSubmit value="Crear guerrero" action="save"/>
				</div>
			</g:form>
		</div>
		<div style="clear:both"></div>
		<div style="float:right" style="margin-top:20px;"><g:link action="index" controller="main">Volver</g:link></div>
	</body>
</html>
