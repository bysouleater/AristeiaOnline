<html>
    <head>
       
    </head>
    <body>
    	<h2>Guerreros</h2>	

	<g:if test="${warriorlist}">
	       	<g:each in="${warriorlist}">
			<div style="float:left;width:250px">
				<img style="float:left" src="/images/male_paladin.png"/>
				<div style="float:left;width:120px">${it.name}</div>
				<div style="float:left;width:120px">HP: ${5} / ${15}</div>
				<div style="float:left;width:120px">MP: ${5} / ${15}</div>
				<div style="float:left;width:120px">Paladin Lv. ${99}</div>
			</div> 	
		</g:each>
	</g:if>
	<g:else>
     		<div>No tienes ningun guerrero.</div>
	</g:else>
	<div style="clear:both"></div>		
	<div style="float:right"><g:link action="create" controller="warrior">Crear un guerrero</g:link></div>
    </body>
</html>
