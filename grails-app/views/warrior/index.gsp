<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content" style="min-height:160px;">
				<h4>Journal</h4>
				<table width="100%" style="font-size:12px;" border="0" cellspacing="0" cellpadding="0">
					<g:each in="${journal}" status="i" var="je">
						<g:if test="${i % 2 == 0}"><tr bgcolor="#EEEEFF"></g:if>
						<g:else><tr></g:else>
						<g:if test="${je.type == 0}">
								<td valign="top" align="right" style="padding-left:10px;color:#555555;line-height:1.5em;padding-top:5px;padding-bottom:5px;"><g:dateFromNow date="${je.dateCreated}"/></td>
								<td width="380" valign="top" style="padding-right:5px;line-height:1.5em;padding-left:10px;padding-top:5px;padding-bottom:5px;"><i>${je.text}</i></td>
						</g:if>
						<g:if test="${je.type == 1}">
							<td valign="top" align="right" style="padding-left:10px;padding-top:5px;padding-bottom:5px;color:#555555;line-height:1.5em;"><g:dateFromNow date="${je.dateCreated}"/></td>
							<td width="380" valign="top" style="padding-right:5px;line-height:1.5em;padding-left:10px;padding-top:5px;padding-bottom:5px;">
								<i>While exploring you encountered <b>${je.fight.encounter.description}</b>. You <b><g:if test="${je.fight.won}">won</b> the fight.<br>
								Gained <b>${je.exp} EXP</b>
								Found <b><g:if test="${je.itemsGained.size() > 0}">
										<g:each in="${je.itemsGained}" var="loot" status="l">
											<g:if test="${l > 0}">, </g:if>
											${loot.qty}x ${loot.type.name} 
										</g:each>
									</g:if></b>
								</g:if>
								<g:else>lost</b> the fight.<br></g:else><b><g:link controller="warrior" action="fights" id="${je.fight.id}"> View fight details</g:link></b></i>
							</td>
						</g:if>
						</tr>
					</g:each>
				</table>
				<div class="paginator"><g:paginate total="${warrior.journal.size()}" action="index" controller="warrior" id="${warrior.id}" max="10" maxsteps="5" offset="0"/></div>
			</div>
		</td>
	</body>
</html>
