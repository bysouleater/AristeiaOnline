<div id="content">
	<h3>TOP 100 Warriors</h3>
	<table width="400" style="margin-top:10px;margin-left:80px;font-size:14px;" border="0" cellpadding="0" cellspacing="0">
		<g:each in="${warriors}" status="i" var="warrior">
			<g:if test="${i % 2 == 0}"><tr bgcolor="#EEEEFF"></g:if><g:else><tr></g:else>
				<td height="30px;" style="padding-left:5px;">${warrior.name} - ${warrior.job.name}</td><td width="60px;" align="left">Lvl ${warrior.level}</td>
			</tr>
		</g:each>
	</table>
	<div style="text-align:right;margin-top:20px;">
		<g:link style="text-decoration:none;" action="index" controller="main" style="margin-left:10px;"><b>Back to warriors list</b></g:link>
	</div>
</div>