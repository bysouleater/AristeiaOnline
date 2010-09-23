<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Fight Details</h4>
				<ul style="font-size:12px;list-style-type:none;">
					<g:each in="${fight.details}" var="fe">
						<li>- <i>${fe.text}</i></li>
					</g:each>
				</ul>
			</div>
		</td>
	</body>
</html>
