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
				background-color: #FFFFFF;
			}
			.charsheetH {
				float:left;
				width:250;
				margin-top:10px;
				background-color: #849CCF;
			}
			.charbut{
				float:left;
				width:240;
				margin-left: 5px;
				background-color: #FCFCFC;
				border: 1px solid #CCCCCC;
				font: 11px verdana,arial,helvetica,sans-serif;
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
			.nowarriors{
				margin-top:10px;
				margin-bottom:10px;
				font-weight:bold;
				text-align:center;
				font-size:14px;
			}
		</style>
    </head>
    <body>
		<g:if test="${warriorlist}">
    		<h2>Mis Guerreros</h2>	
	       	<g:each in="${warriorlist}">
				<div class="charsheet" onmouseover="this.className='charsheetH'" onmouseout="this.className='charsheet'"> 
				<img class="fleft" src="/images/male_paladin.png"/>
				<label class="charinfo fright" style="margin-right:5px;"><a href="">x</a></label>
				<label class="charinfo fleft">${it.name}</label>
				<label class="charinfo fleft">HP: ${it.actualHP} / ${it.maxHP}</label>
				<label class="charinfo fleft">${it.job} Nivel ${it.level}</label>
				<label class="charinfo fleft status normal">Pescando...</label>
				<a href="<g:createLink controller='warrior' action='game' id='${it.id}' />"><input type="button" value="Entrar con ${it.name}" class="charbut"/></a>
			</div> 	
		</g:each>
		<div class="clear"></div>
		<div class="fright" style="margin-top:20px;"><g:link action="create" controller="warrior">Crear un nuevo guerrero</g:link></div>
	</g:if>
	<g:else>
     		<div class="nowarriors">Bienvenido a Aristeia Online.<br> Aún no tienes ningun guerrero. Intenta <g:link action="create" controller="warrior">crear un nuevo guerrero</g:link> para comenzar a jugar!.</div>
	</g:else>
    </body>
</html>
