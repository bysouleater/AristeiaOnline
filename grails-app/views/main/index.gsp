<html>
    <head>
       
    </head>
    <body>
    	<g:if test="${warriorlist}">
			<ul>
	        	<g:each in="${warriorlist}">
	     			<li>${it.name}</li>
				</g:each>
	        </ul>
		</g:if>
		<g:else>
     		<div>No tienes ningun guerrero.</div>
		</g:else>
		
		<div><g:link action="create" controller="warrior">Crear un guerrero</g:link></div>
    </body>
</html>
