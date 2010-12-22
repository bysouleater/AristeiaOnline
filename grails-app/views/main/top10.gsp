<div id="content">
	<h3>TOP 10 Warriors</h3>
	
	<table style="margin-left:20px;">
		<tr>
			<td width="200" valign="top">
				<h3>Top 10 Warriors</h3>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:12px">
    				<g:each in="${top10war}" var="warrior" status="c">
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
			</td>
			<td width="20"></td>
			<td width="200" valign="top">
				<h3>Top 10 Friend Warriors</h3>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:12px">
    				<g:if test="${top10fwar.size() > 0}">
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
					</g:if>
					<g:else>
						<tr>
							<td style="font-size:14px;"><b>Woah!</b> Your friends aren't playing? Why don't you <a href="">invite some friends</a> to play with you?</td>
						</tr>
					</g:else>
				</table>
				<g:if test="${top10fwar.size() > 0}">
					<div style="font-size:14px;margin-top:5px;text-align:right;">Total Friend Warriors <b>${totalfwar}</b></div>
					<div style="font-size:14px;margin-top:5px;text-align:right;"><g:link action="inviteFriends" controller="main">Invite more friends</g:link></div>
				</g:if>
			</td>
		</tr>
	</table>
	
	<div style="text-align:right;margin-top:20px;">
		<g:link style="text-decoration:none;" action="warriorList" controller="main" style="margin-left:10px;"><b>Back to warriors list</b></g:link>
	</div>
</div>