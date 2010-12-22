<g:applyLayout name="main">
<div id="content">
	<h3>${warrior.name} <label style="font-size:14px;">- ${warrior.job.name} Lvl ${warrior.level}</label> 
	<label style="float:right;font-size:12px;"><b>Origin</b> ${warrior.origin.name}</label></h3>
	<g:warriorSheet warrior="${warrior}">
		<td colspan="2" align="right" valign="bottom">
			<table border="0"><tr>
				<td><a class="buttonlink" href="<g:createLink controller='warrior' action='skills'/>">
					<img width="15" height="15" src="/images/skills.jpg"/>
					<b>Skills</b></a></td>					
				<td><a class="buttonlink" href="<g:createLink controller='warrior' action='equipment'/>">
					<img width="15" height="15" src="/images/equip.png"/>
					<b>Equipment</b></a></td>
				<td><a class="buttonlink" href="<g:createLink controller='warrior' action='inventory'/>">
					<img width="15" height="15" src="/images/inventory.png"/>
					<b>Inventory</b></a></td>
				<!--  <td><a class="buttonlink" href="<g:createLink controller='warrior' action='insights'/>">
					<img width="15" height="15" src="/images/insights.png"/>
					<b>Insights</b></a></td>-->
			</tr></table>
		</td>
	</g:warriorSheet>
	<table width="100%">
		<tr>
			<td width="150" valign="top">
				<h4>Actions</h4>
					<ul class="actionspro">
						<li><a href="<g:createLink controller='warrior' action='index'/>">Journal</a></li>
						<li><a href="<g:createLink controller='warrior' action='exploration'/>">Exploration</a></li>
						<li><a href="<g:createLink controller='warrior' action='training'/>">Training</a></li>
						<li><a href="<g:createLink controller='warrior' action='quests'/>">Quests</a></li>
					</ul>
				</td>
				<g:layoutBody />
			</tr>
		</table>
		<div style="text-align:right;margin-top:20px;">
			<g:link style="text-decoration:none;" action="index" controller="aoBug" style="margin-right:10px;"><b>Report a Bug</b></g:link> &bull; 
			<g:link style="text-decoration:none;" action="top10" controller="main" style="margin-right:10px;margin-left:10px;"><b>TOP 10 Warriors</b></g:link> &bull; 
			<g:link style="text-decoration:none;" action="warriorList" controller="main" style="margin-left:10px;"><b>Back to warriors list</b></g:link>
		</div>			
	</div>
</g:applyLayout>