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
						<td>Hits: ${fight.hits}<br>
							Hits Missed: ${fight.hitsMissed}<br>
							Critical Hits: ${fight.criticalHits}<br>
							Damage Taken: ${fight.damageTaken}<br>
							Damage Done: ${fight.damageDone}<br>
							Average Damage Per Hit: ${fight.averageDamagePerHit}<br>
						</td>
					</tr>
					<tr>
						<td>You <b>${fight.won?"WON":"LOST"}</b> the fight!</td>
					</tr>
				</g:if>
			</table>
		</div>
	</td>
</g:applyLayout>