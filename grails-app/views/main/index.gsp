<html>
    <head>
		<style>
			body{
				font-family:"Arial";
				font-size:12px;
			}	
			.fleft{
				float:left;
			}
			.fright{
				float:right;
				text-align:right;
			}
			.charsheet{
				float:left;
				width:250;
				margin-top:10px;
			}
			.charbut{
				float:left;
				width:240;
				margin-left:5px;
			}
			.charinfo{
				width:120px;
			}
			.red{
				color:#FF5555;
			}
			.clear{
				clear:both;
			}
			.normal{
				color:#4444FF;
			}	
			.status{
				margin-top:10px;
				font-weight:bold;
				text-align:center;
			}
		</style>
    </head>
    <body>
    	<h2>Mis Guerreros</h2>	

		<g:if test="${warriorlist}">
	       	<g:each in="${warriorlist}">
			<div class="charsheet"> 
				<img class="fleft" src="/images/male_paladin.png"/>
				<label class="charinfo fright"><a href="">x</a></label>
				<label class="charinfo fleft">${it.name}</label>
				<label class="charinfo fleft">HP: ${it.actualHP} / ${it.maxHP}</label>
				<label class="charinfo fleft">${it.job} Lvl ${it.level}</label>
				<label class="charinfo fleft status normal">Pescando...</label>
				<input type="button" value="Entrar con ${it.name}" class="charbut"/>
			</div> 	
		</g:each>
	</g:if>
	<g:else>
     		<div>No tienes ningun guerrero.</div>
	</g:else>
		<div class="clear"></div>
		<div class="fright" style="margin-top:20px;"><g:link action="create" controller="warrior">Crear un guerrero</g:link></div>
    </body>
</html>
