<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Exploration</h4>
				<div style="font-size:12px;">You are in ${warrior.actualLocation.name}</div>
				<ul style="font-size:12px;">
					<li>
						<g:if test="${warrior.actualSTA > 5}">
							<a href="<g:createLink controller='warrior' action='explore' id='${warrior.id}'/>">Search for items and monsters</a> <i>(Consumes 5 STA)</i></li>
						</g:if>
						<g:else>
							Search for items and monsters <i>(Consumes 5 STA - You dont have enough STA)</i>
						</g:else>
					<li>Move to other map</li>
					<g:if test="${warrior.actualLocation.isCity()}">
						<div>City only:</div>
						<li>Go to shops</li>
					</g:if>
				</ul>
			</div>
		</td>
	</body>
</html>
