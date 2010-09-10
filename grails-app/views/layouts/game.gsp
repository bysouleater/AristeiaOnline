<g:applyLayout name="main">
<div id="content">
	<h3>${warrior.name} - ${warrior.job.name} Lvl ${warrior.level} 
	<label style="float:right;font-size:12px;"><b>Origin</b> ${warrior.origin.name}</label></h3>
	<g:warriorSheet warrior="${warrior}">
		<td colspan="12" style="padding-top:5px;" align="center">
			<table><tr>
				<td><a class="buttonlink" href="<g:createLink controller='warrior' action='skills' id='${warrior.id}'/>">
					<img width="15" height="15" src="/images/skills.jpg"/>
					<b>Skills</b></a></td>					
				<td><a class="buttonlink" href="<g:createLink controller='warrior' action='equip' id='${warrior.id}'/>">
					<img width="15" height="15" src="/images/equip.png"/>
					<b>Equipment</b></a></td>
				<td><a class="buttonlink" href="<g:createLink controller='warrior' action='inventory' id='${warrior.id}'/>">
					<img width="15" height="15" src="/images/inventory.png"/>
					<b>Inventory</b></a></td>
				<td><a class="buttonlink" href="<g:createLink controller='warrior' action='insights' id='${warrior.id}'/>">
					<img width="15" height="15" src="/images/insights.png"/>
					<b>Insights</b></a></td>
			</tr></table>
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
		<div style="text-align:right;margin-top:20px;"><g:link style="text-decoration:none;" action="index" controller="main"><b>Back to warriors list</b></g:link></div>			
	</div>
</g:applyLayout>