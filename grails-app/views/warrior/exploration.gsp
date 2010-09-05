<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Exploration</h4>
				<div style="font-size:14px;">You are now in <b>${warrior.actualLocation.name}</b></div>
				<div style="padding-left:30px;font-size:12px;"><g:if test="${warrior.actualSTA >= 5}">
							<a href="<g:createLink controller='warrior' action='explore' id='${warrior.id}'/>"><b>Search for items and monsters</b></a> <i>(Consumes 5 STA)</i>
						</g:if>
						<g:else>
							<b>Search for items and monsters</b> <i>(Consumes 5 STA - You dont have enough STA)</i>
						</g:else>
				</div>
				<div style="padding-left:30px;font-size:12px;"><b>Move to other map</b> <i>(Not yet implemented)</i></div>
				<g:if test="${warrior.actualLocation.isCity()}">
					<div style="font-size:14px;">City places:</b></div>
					<div style="padding-left:30px;font-size:12px;"><b>Weapons Store</b> <i>(Not yet implemented)</i></div>
					<div style="padding-left:30px;font-size:12px;"><b>Armors Store</b> <i>(Not yet implemented)</i></div>
					<div style="padding-left:30px;font-size:12px;"><b>Consumables Store</b> <i>(Not yet implemented)</i></div>
				</g:if>
			</div>
		</td>
	</body>
</html>
