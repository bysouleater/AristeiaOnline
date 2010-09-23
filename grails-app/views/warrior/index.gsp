<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Journal</h4>
				<ul style="font-size:12px;list-style-type:none;">
					<g:each in="${journal}"  var="je">
						<g:if test="${je.type == 0}">
							<li><label style="color:#555555"><g:dateFromNow date="${je.dateCreated}"/>.</label> <i>${je.text}</i></li>
						</g:if>
						<g:if test="${je.type == 1}">
							<li><label style="color:#555555"><g:dateFromNow date="${je.dateCreated}"/>.</label> <i>While exploring you encountered ${je.encounter.description}. You <b><g:if test="${je.won}">won</g:if><g:else>lost</g:else></b> the <b><g:link controller="warrior" action="fights" id="1">fight</g:link></b>. 
							<br>Gained <b>${je.encounter.totalExp()}</b> EXP. Found <b>${je.encounter.totalGold()}</b> <img width="15" height="15" src="/images/coins.png"/>.</i></li>
						</g:if>
					</g:each>
				</ul>
				<div class="paginator"><g:paginate total="${warrior.journal.size()}" action="index" controller="warrior" id="${warrior.id}" max="6" maxsteps="5" offset="0"/></div>
			</div>
		</td>
	</body>
</html>
