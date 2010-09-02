<g:applyLayout name="main">
	<div id="content">
		<h3>
			<span>${warrior.name} - ${warrior.job.name} Lvl ${warrior.level} <g:link controller="warrior" action="levelup" id="${warrior.id}" style="text-decoration:none;">+</g:link></span>
			<span style="float:right;">Origin: ${warrior.origin.name}</span>
		</h3>
		<g:warriorSheet warrior="${warrior}">
			<td colspan="12" style="padding-top:12px;" align="center">
				<table><tr>
				<td><img border="0" width="15" height="15" src="/images/skills.jpg"/></td>
				<td valign="middle" class="statusbartext" align="center" style="padding-right:10px;"><a href="<g:createLink controller='warrior' action='skills' id='${warrior.id}'/>">Skills</a></td>
				<td><img border="0" width="15" height="15" src="/images/equip.png"/></td>
				<td valign="middle" class="statusbartext" align="center" style="padding-right:10px;"><a href="<g:createLink controller='warrior' action='equip' id='${warrior.id}'/>">Equipment</a></td>
				<td><img border="0" width="15" height="15" src="/images/inventory.png"/></td>
				<td valign="middle" class="statusbartext" align="center" style="padding-right:10px;"><a href="<g:createLink controller='warrior' action='inventory' id='${warrior.id}'/>">Inventory</a></td></tr></table>
			</td>
		</g:warriorSheet>
		<table width="100%">
			<tr>
				<td width="150" valign="top">
					<h4>Actions</h4>
					<ul class="actionspro">
						<li><a href="<g:createLink controller='warrior' action='index' id='${warrior.id}'/>">Journal</a></li>
						<li><a href="<g:createLink controller='warrior' action='exploration' id='${warrior.id}'/>">Exploration</a></li>
						<li><a href="<g:createLink controller='warrior' action='training' id='${warrior.id}'/>">Training</a></li>
						<li><a href="<g:createLink controller='warrior' action='quests' id='${warrior.id}'/>">Quests</a></li>
					</ul>
				</td>
				<g:layoutBody />
			</tr>
		</table>
		<div style="text-align:right; font-size:12px;margin-top:20px;"><g:link style="text-decoration:none;" action="index" controller="main">Back to warriors list</g:link></div>			
	</div>
</g:applyLayout>