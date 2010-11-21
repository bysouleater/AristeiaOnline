<div id="content">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="500">
				
			</td>
			<td width="200">
				<h4>Top 10 Friend Warriors</h4>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:12px">
    				<g:each in="${top10fwar}" var="warrior" status="c">
    					<g:if test="${c % 2 == 0}"><tr bgcolor="#eeeeff"></g:if><g:else><tr></g:else>
    						<td align="right" style="padding:5px;">
    							<b style="font-size:14px;">${warrior.name}</b><br>${warrior.job.name} Lvl ${warrior.level} Played by		
    						</td>
    						<td width="32" height="42">
    							<fb:profile-pic uid="${warrior.owner_id}" width="32" height="32" linked="true" />
    						</td>
    					</tr>
					</g:each>
				</table>
				<div style="font-size:14px;margin-top:5px;text-align:right;">Total Friend Warriors <b>${totalfwar}</b></div>
			</td>
		</tr>
	</table>
</div>


