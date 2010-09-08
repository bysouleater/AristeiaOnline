<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Exploration</h4>
				<div style="font-size:14px;">You are now in <b>${warrior.actualLocation.name}</b></div>
				
				<table style="margin:20px 0px 20px 20px;">
					<tr>
						<td><g:if test="${warrior.actualSTA >= 5}">
								<a href="<g:createLink controller='warrior' action='explore' id='${warrior.id}'/>">
								<button class="expButton" style="font-size:12px;line-height:1.2em">
									<table border="0" cellspacing="0" cellpadding="0" style="font-size:12px;">
									<tr><td align="center" valign="middle"><img style="float:left;margin-right:10px;" width="32" height="32" src="/images/search.png"/></td>
									<td valign="middle"><b>Search for items<br>and monsters</b> (5 STA)</td></tr>
									</table>
								</button>
								</a>
							</g:if>
							<g:else>
								<button disabled="disabled" class="expButton" style="font-size:12px;line-height:1.2em">
									<table border="0" cellspacing="0" cellpadding="0" style="font-size:12px;">
									<tr><td align="center" valign="middle"><img style="float:left;margin-right:10px;" width="32" height="32" src="/images/search.png"/></td>
									<td valign="middle"><b>Search for items<br>and monsters</b> (5 STA)</td></tr>
									</table>
								</button>
							</g:else>
							
						</td>
						<td><a href="<g:createLink controller='warrior' action='explore' id='${warrior.id}'/>">
							<button class="expButton" style="font-size:12px;line-height:1.2em">
								<table border="0" cellspacing="0" cellpadding="0" style="font-size:12px;">
									<tr><td align="center" valign="middle"><img style="float:left;margin-right:10px;" width="32" height="32" src="/images/compass.png"/></td>
									<td align="center" valign="middle"><b>Move to other map</b></td></tr>
								</table>
							</button></a>
						</td>
					</tr>
				</table>
				<!--  
				<div style="padding-left:30px;font-size:12px;"><g:if test="${warrior.actualSTA >= 5}">
							<a href="<g:createLink controller='warrior' action='explore' id='${warrior.id}'/>"><b>Search for items and monsters</b></a> <i>(Consumes 5 STA)</i>
						</g:if>
						<g:else>
							<b>Search for items and monsters</b> <i>(Consumes 5 STA - You dont have enough STA)</i>
						</g:else>
				</div>
				<div style="padding-left:30px;font-size:12px;"><b>Move to other map</b> <i>(Not yet implemented)</i></div>
				-->
				<g:if test="${warrior.actualLocation.isCity()}">
					<div style="font-size:14px;">City places</b></div>
					<table style="margin:20px 0px 20px 20px;">
						<tr>
							<td><button class="expButton" style="font-size:12px;line-height:1.2em"><img style="float:left;margin-right:10px;" width="32" height="32" src="/images/equip.png"/><p style="margin:8px 0px 0px 0px;"><b>Weapons Store</b></p></button></td>
							<td><button class="expButton" style="font-size:12px;line-height:1.2em"><img style="float:left;margin-right:10px;" width="32" height="32" src="/images/armors.png"/><p style="margin:8px 0px 0px 0px;"><b>Armors Store</b></p></button></td>
						</tr>
						<tr>
							<td><button class="expButton" style="font-size:12px;line-height:1.2em"><img style="float:left;margin-right:10px;" width="32" height="32" src="/images/consumables.png"/><p style="margin:8px 0px 0px 0px;"><b>Consumables Store</b></p></button></td>
							<td></td>
						</tr>
					</table>
				</g:if>
			</div>
		</td>
	</body>
</html>
