<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Journal</h4>
				<ul style="font-size:12px;">
					<g:each in="${journal}"  var="je">
						<li>${je.dateCreated}: ${je.text}</li>	
					</g:each>
				</ul>
				<div class="paginator"><g:paginate total="${warrior.journal.size()}" action="index" controller="warrior" id="${warrior.id}" max="6" maxsteps="5" offset="0"/></div>
			</div>
		</td>
	</body>
</html>
