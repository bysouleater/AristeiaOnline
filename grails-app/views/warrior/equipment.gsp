<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Equipment</h4>
				<g:if test="${flash.message}"><div class="flash">${flash.message}</div></g:if>
				<table style="font-size:12px;margin:15px 0px 20px 20px;" cellpadding="0">
					<tr>
						<td class="labeltxt">Head </td>
						<g:if test="${warrior.equip.head}">
							<td title="${warrior.equip.head.type.name} - Stats${warrior.equip.head.type.titleStats()} - Applicable Jobs ${warrior.equip.head.type.titleJobs()}" width="32" height="32" align="center" valign="middle" style="background:url('/images/empty.png');">
								<a href="javascript:confirmUnequip('head','${warrior.equip.head.type.name}','${warrior.equip.head.type.icon}','${warrior.equip.head.type.titleStats()}');">
									<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${warrior.equip.head.type.icon}"/>
								</a>
							</td>
							<td width="200">${warrior.equip.head.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
						<td class="labeltxt">Shoulder </td>
						<g:if test="${warrior.equip.shoulder}">
							<td title="${warrior.equip.shoulder.type.name} - Stats${warrior.equip.shoulder.type.titleStats()} - Applicable Jobs ${warrior.equip.shoulder.type.titleJobs()}" width="32" height="32" align="center" valign="middle" style="background:url('/images/empty.png');">
								<a href="javascript:confirmUnequip('shoulder','${warrior.equip.shoulder.type.name}','${warrior.equip.shoulder.type.icon}','${warrior.equip.shoulder.type.titleStats()}');">
									<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${warrior.equip.shoulder.type.icon}"/>
								</a>
							</td>
							<td width="200">${warrior.equip.shoulder.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
					</tr>
					<tr>
						<td class="labeltxt">Shield </td>
						<g:if test="${warrior.equip.shield}">
							<td title="${warrior.equip.shield.type.name} - Stats${warrior.equip.shield.type.titleStats()} - Applicable Jobs ${warrior.equip.shield.type.titleJobs()}" width="32" height="32" align="center" valign="middle" style="background:url('/images/empty.png');">
								<a href="javascript:confirmUnequip('shield','${warrior.equip.shield.type.name}','${warrior.equip.shield.type.icon}','${warrior.equip.shield.type.titleStats()}');">
									<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${warrior.equip.shield.type.icon}"/>
								</a>
							</td>
							<td width="200">${warrior.equip.shield.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
						<td class="labeltxt">Weapon </td>
						<g:if test="${warrior.equip.weapon}">
							<td title="${warrior.equip.weapon.type.name} - Stats${warrior.equip.weapon.type.titleStats()} - Applicable Jobs ${warrior.equip.weapon.type.titleJobs()}" width="32" height="32" align="center" valign="middle" style="background:url('/images/empty.png');">
								<a href="javascript:confirmUnequip('weapon','${warrior.equip.weapon.type.name}','${warrior.equip.weapon.type.icon}','${warrior.equip.weapon.type.titleStats()}');">
									<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${warrior.equip.weapon.type.icon}"/>
								</a>
							</td>
							<td width="200">${warrior.equip.weapon.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
					</tr>
					<tr>
						<td class="labeltxt">Body </td>
						<g:if test="${warrior.equip.body}">
							<td title="${warrior.equip.body.type.name} - Stats${warrior.equip.body.type.titleStats()}  - Applicable Jobs ${warrior.equip.body.type.titleJobs()}" width="32" height="32" align="center" valign="middle" style="background:url('/images/empty.png');">
								<a href="javascript:confirmUnequip('body','${warrior.equip.body.type.name}','${warrior.equip.body.type.icon}','${warrior.equip.body.type.titleStats()}');">
									<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${warrior.equip.body.type.icon}"/>
								</a>
							</td>
							<td width="200">${warrior.equip.body.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
						<td class="labeltxt">Foot </td>
						<g:if test="${warrior.equip.foot}">
							<td title="${warrior.equip.foot.type.name} - Stats${warrior.equip.foot.type.titleStats()} - Applicable Jobs ${warrior.equip.foot.type.titleJobs()}" width="32" height="32" align="center" valign="middle" style="background:url('/images/empty.png');">
								<a href="javascript:confirmUnequip('foot','${warrior.equip.foot.type.name}','${warrior.equip.foot.type.icon}','${warrior.equip.foot.type.titleStats()}');">
									<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${warrior.equip.foot.type.icon}"/>
								</a>
							</td>
							<td width="200">${warrior.equip.foot.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
					</tr>
					<tr>
						<td class="labeltxt">Accesory </td>
						<g:if test="${warrior.equip.accesory1}">
							<td title="${warrior.equip.accesory1.type.name} - Stats${warrior.equip.accesory1.type.titleStats()} - Applicable Jobs ${warrior.equip.accesory1.type.titleJobs()}" width="32" height="32" align="center" valign="middle" style="background:url('/images/empty.png');">
								<a href="javascript:confirmUnequip('accesory1','${warrior.equip.accesory1.type.name}','${warrior.equip.accesory1.type.icon}','${warrior.equip.accesory1.type.titleStats()}');">
									<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${warrior.equip.accesory1.type.icon}"/>
								</a>
							</td>
							<td width="200">${warrior.equip.accesory1.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
						<td class="labeltxt">Accesory </td>
						<g:if test="${warrior.equip.accesory2}">
							<td title="${warrior.equip.accesory2.type.name} - Stats${warrior.equip.accesory2.type.titleStats()} - Applicable Jobs ${warrior.equip.accesory2.type.titleJobs()}" width="32" height="32" align="center" valign="middle" style="background:url('/images/empty.png');">
								<a href="javascript:confirmUnequip('accesory2','${warrior.equip.accesory2.type.name}','${warrior.equip.accesory2.type.icon}','${warrior.equip.accesory2.type.titleStats()}');">
									<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${warrior.equip.accesory2.type.icon}"/>
								</a>
							</td>
							<td width="200">${warrior.equip.accesory2.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
					</tr>
				</table>
			</div>
			<jqui:resources theme="aristeia"/>
			<script>
				$(document).ready(function() {
				    $("#confirm_unequip").dialog({ autoOpen:false, resizable:false, position:[220,150],
					    buttons: { "Ok": function() { document.unequipForm.submit();},
				    			   "Cancel": function() { $(this).dialog("close");} }
				    });
				});
				
				function confirmUnequip(item_id, item_name, item_pic, item_stats){
					$("#unequip_imgdiv").attr("title",item_name + " - Stats" + item_stats);
					$("#unequip_itempic").attr("src",item_pic);
					$("#unequip_item_id").attr("value",item_id);
					$("#unequip_itemname").html("<b>" + item_name + "</b><br><b>Stats</b> " + item_stats);
					$("#confirm_unequip").dialog({title : "Unequip " + item_name + "?"});
					$("#confirm_unequip").dialog("open");
				}
			</script>
			<g:form name="unequipForm" method="get" controller="warrior" action="unequip">
				<g:hiddenField name="unequip_item_id"/>
				<div style="display:none;" id="confirm_unequip" title="Unequip">
					<div style="line-height: 1.5em;">
						<div id="unequip_imgdiv" title="" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
							<img id="unequip_itempic" style="padding-left:2px;padding-top:2px;" width="28" height="28" src=""/>
						</div>
						<label id="unequip_itemname"></label>
					</div>
				</div>
			</g:form>
		</td>
	</body>
</html>
