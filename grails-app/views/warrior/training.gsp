<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Training</h4>
				<div style="font-size:12px;">You are in ${warrior.actualLocation.name}</div>
				<ul style="font-size:12px;">
					<li>Search for items or monsters</li>
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
