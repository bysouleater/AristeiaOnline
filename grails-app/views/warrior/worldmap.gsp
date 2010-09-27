<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>World Map</h4>
				<table cellpadding="0" class="worldmap">
					<g:each in="${map}" status="i" var="row">
						<tr>
							<g:each in="${map[i]}" status="j" var="col">
								<g:if test="${map[i][j]}">
									<g:if test="${map[i][j].id == warrior.actualLocation.id}">
										<td style="background:url('${map[i][j].picture}');" title="${map[i][j].name}"><div style="border:2px solid #FF0000;width:46px;height:46px;"></div></td>
									</g:if>
									<g:elseif test="${warrior.actualLocation.posX == i && (warrior.actualLocation.posY == j+1 || warrior.actualLocation.posY == j-1)}">
										<td style="background:url('${map[i][j].picture}');" title="${map[i][j].name}"><a href="javascript:confirmMove(${map[i][j].id},'${map[i][j].name}','${map[i][j].picture}','<g:createLink controller="warrior" action="move" id="${map[i][j].id}"/>');"><img src="${map[i][j].picture}"/></a></td>
									</g:elseif>
									<g:elseif test="${warrior.actualLocation.posY == j && (warrior.actualLocation.posX == i+1 || warrior.actualLocation.posX == i-1)}">
										<td style="background:url('${map[i][j].picture}');" title="${map[i][j].name}"><a href="javascript:confirmMove(${map[i][j].id},'${map[i][j].name}','${map[i][j].picture}','<g:createLink controller="warrior" action="move" id="${map[i][j].id}"/>');"><img src="${map[i][j].picture}"/></a></td>
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
				<g:javascript library="jquery" plugin="jquery"/>
				<jqui:resources theme="aristeia"/>
				<script>
					$(document).ready(function() {
					    $("#move_dialog").dialog({ autoOpen:false, resizable:false, 
						    buttons: { "Ok": function() { document.moveForm.submit();},
					    			   "Cancel": function() { $(this).dialog("close");} }
					    });
					});
					
					function confirmMove(map_id, map_name, map_pic, map_link){
						$("#move_imgdiv").attr("title",map_name);
						$("#move_mappic").attr("src",map_pic);
						$("#move_map_id").attr("value",map_id);
						$("#move_dialog").dialog({title : "Move to " + map_name + "?"});
						$("#move_dialog").dialog("open");
					}
				</script>
				<g:form name="moveForm" method="get" controller="warrior" action="move">
					<g:hiddenField name="move_map_id"/>
					<div style="display:none;" id="move_dialog" title="Move">
						<div style="line-height: 1.5em;">
							<div id="move_imgdiv" title="" style="float:left;margin-right:10px;margin-bottom:10px;width:50px;height:50px;">
								<img id="move_mappic" style="padding-left:2px;padding-top:2px;" width="50" height="50" src=""/>
							</div>
							<p><b>Remember:</b> Moving from map to map is like searching for items and monster from actual location but with half chance.</p>
						</div>
					</div>
				</g:form>
				<div style="text-align:right;margin-top:20px;font-size:12px;"><a href="<g:createLink controller='warrior' action='exploration'/>"><b>Back to exploration</b></a></div>
			</div>
		</td>
	</body>
</html>
