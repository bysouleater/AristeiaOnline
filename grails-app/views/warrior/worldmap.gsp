<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>World Map</h4>
				<g:form name="worldmap" method="get" controller="warrior" action="move" style="margin:0px;">
					<input type="hidden" name="map" value=""/>
					<input type="hidden" name="id" value="${warrior.id}"/>
					<table cellpadding="0" class="worldmap">
						<g:each in="${map}" status="i" var="row">
							<tr>
								<g:each in="${map[i]}" status="j" var="col">
									<g:if test="${map[i][j]}">
										<g:if test="${map[i][j].id == warrior.actualLocation.id}">
											<td style="background:url('${map[i][j].picture}');" title="${map[i][j].name}"><div style="border:2px solid #FF0000;width:46px;height:46px;"></div></td>
										</g:if>
										<g:elseif test="${warrior.actualLocation.posX == i && (warrior.actualLocation.posY == j+1 || warrior.actualLocation.posY == j-1)}">
											<td style="background:url('${map[i][j].picture}');" title="${map[i][j].name}"><button onclick="javascript:goToMap(${map[i][j].id})">Go!</button></td>
										</g:elseif>
										<g:elseif test="${warrior.actualLocation.posY == j && (warrior.actualLocation.posX == i+1 || warrior.actualLocation.posX == i-1)}">
											<td style="background:url('${map[i][j].picture}');" title="${map[i][j].name}"><button onclick="javascript:goToMap(${map[i][j].id})">Go!</button></td>
										</g:elseif>
										<g:else>
											<td style="background:url('${map[i][j].picture}');opacity:0.4;filter:alpha(opacity=40);" title="${map[i][j].name}">&nbsp;</td>
										</g:else>
									</g:if>
									<g:else>
										<td></td>
									</g:else>							
								</g:each>
							</tr>
						</g:each>
					</table>
					<script>
						function goToMap(map){
							document.worldmap.map.value = map;
							document.worldmap.submit();
						}
					</script>
				</g:form>
				<div style="text-align:right;margin-top:20px;font-size:12px;"><a href="<g:createLink controller='warrior' action='exploration' id='${warrior.id}'/>"><b>Back to exploration</b></a></div>
			</div>
		</td>
	</body>
</html>
