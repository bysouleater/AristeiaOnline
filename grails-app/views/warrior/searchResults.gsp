<g:applyLayout name="main">
	<td valign="top">
		<div id="content">
			<h3>Exploration Journal</h3>
			
			<table width="670" style="margin-left:20px;margin-top:15px;margin-right:15px;margin-bottom:10px;font-size:14px;">
				<tr>
					<td align="center">
						<g:if test="${encounter}">While searching you get attacked by <b>${encounter.description}</b>.</g:if>
						<g:else>You explored the area safely with no harm.</g:else>	
					</td>
				</tr>
				<g:if test="${fight}">
					<tr>
						<td><h4>Battle Results</h4></td>
					</tr>
					<tr>
						<td align="left" style="padding-left: 25px;">
							<table style="font-size: 12px;">
								<tr>
									<td width="100" class="labeltxt">Hits</td><td width="40" align="right" class="labelvalue">${fight.hits}</td>
									<td width="150" style="padding-left:10px;" class="labeltxt">Damage Taken</td><td width="45" align="right" class="labelvalue">${fight.damageTaken}</td>
									<td rowspan="3" width="250" align="center">You<br><b style="font-size:18px;">${fight.won?"WON":"LOST"}</b></td>
								</tr>
								<tr>
									<td width="100" class="labeltxt">Hits Missed</td><td width="40" align="right" class="labelvalue">${fight.hitsMissed}</td>
									<td width="150" style="padding-left:10px;" class="labeltxt">Damage Done</td><td width="45" align="right" class="labelvalue">${fight.damageDone}</td>
								</tr>
								<tr>
									<td width="100" class="labeltxt">Critical Hits</td><td width="40" align="right" class="labelvalue">${fight.criticalHits}</td>
									<td width="150" style="padding-left:10px;" class="labeltxt">Average Damage Per Hit</td><td width="45" align="right" class="labelvalue">${fight.averageDamagePerHit}</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="right" style="font-size: 14px;"><b>EXP Gained</b> ${expgained}</td>
					</tr>
					<g:if test="${leveled_up}">
						<tr>
							<td align="right" style="font-size: 14px;"><b>Level UP!</b> You are now Lvl ${warrior.level}</td>
						</tr>
					</g:if>
					<g:if test="${itemsgained.size() > 0}"></g:if>
					<tr>
						<td><h4>Items Found</h4></td>
					</tr>
					<tr>
						<td>
							<table style="margin-top:10px;margin-left:15px;" border="0" cellpadding="0" cellspacing="0">
								<g:each in="${itemsgained}" var="item" status="i">
									<g:if test="${i % 3 == 0}"><tr></g:if>
										<g:spoilrow type="${item.key}" qty="${item.value}"/>
									<g:if test="${i % 3 == 2}"></tr></g:if>
								</g:each>
								<g:if test="${itemsgained.size() % 3 != 0}">
									<g:each in="${(itemsgained.size() % 3)..2}">
										<td height="37" valign="top"></td>
										<g:if test="${it % 3 == 2}"></tr></g:if>
									</g:each>
								</g:if>
							</table>
						</td>
					</tr>
				</g:if>
				<tr>
					<td style="padding-top:20px;" align="right">
						<g:if test="${encounter}">
							<g:if test="${fight.won}">
								<g:if test="${warrior.actualSTA >= 5}">
									<g:if test="${itemsgained.size() > 0}">
										<a class="nuevoBoton" style="font-size:12px" href="<g:createLink controller='warrior' action='explore' />">Discard & Search Again</a>
										<a class="nuevoBoton" style="font-size:12px" href="<g:createLink controller='warrior' action='index' />">Discard & Back to Journal</a>
										<a class="nuevoBoton" style="font-size:12px" href="<g:createLink controller='warrior' action='takeAndSearch' />">Take & Search Again</a>
										<a class="nuevoBoton" style="font-size:12px" href="<g:createLink controller='warrior' action='takeAndJournal' />">Take & Back to Journal</a>
									</g:if>
									<g:else>
										<a class="nuevoBoton" style="font-size:12px" href="<g:createLink controller='warrior' action='explore' />">Search Again</a>
										<a class="nuevoBoton" style="font-size:12px" href="<g:createLink controller='warrior' action='index' />">Back to Journal</a>
									</g:else>
								</g:if>
								<g:else>
									<g:if test="${itemsgained.size() > 0}">
										<a class="nuevoBoton" style="font-size:12px" href="<g:createLink controller='warrior' action='index' />">Discard & Back to Journal</a>
										<a class="nuevoBoton" style="font-size:12px" href="<g:createLink controller='warrior' action='takeAndJournal' />">Take & Back to Journal</a>
									</g:if>
									<g:else>
										<a class="nuevoBoton" style="font-size:12px" href="<g:createLink controller='warrior' action='index' />">Back to Journal</a>
									</g:else>
								</g:else>
							</g:if>
							<g:else>
								<a class="nuevoBoton" style="font-size:12px" href="<g:createLink controller='warrior' action='index' />">Back to Journal</a>
							</g:else>
						</g:if>
						<g:else>
							<g:if test="${warrior.actualSTA >= 5}">
								<a class="nuevoBoton" style="font-size:12px" href="<g:createLink controller='warrior' action='explore' />">Search Again</a>
							</g:if>
							<a class="nuevoBoton" style="font-size:12px" href="<g:createLink controller='warrior' action='index' />">Back to Journal</a>
						</g:else>						
					</td>
				</tr>
			</table>
		</div>
	</td>
</g:applyLayout>