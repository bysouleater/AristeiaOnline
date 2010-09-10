<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Skills</h4>
				<table width="100%" style="font-size:12px;">
					<tr><td colspan="3" align="left">DEX</td><td colspan="3" align="left">AGI</td></tr>
					<tr>
						<td class="statusbartext">Aiming</td><td class="statusbarvalue">${warrior.skills.Aiming}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Aiming} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Aiming * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#00FF00"></div></div></td>
						<td class="statusbartext">Escape Artist</td><td class="statusbarvalue">${warrior.skills.Escape_Artist}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Escape_Artist} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Escape_Artist * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#0000FF"></div></div></td>
					</tr>
					<tr>
						<td class="statusbartext">Thievery</td><td class="statusbarvalue">${warrior.skills.Thievery}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Thievery} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Thievery * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#00FF00"></div></div></td>
						<td class="statusbartext">Stealth</td><td class="statusbarvalue">${warrior.skills.Stealth}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Stealth} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Stealth * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#0000FF"></div></div></td>
					</tr>
					<tr><td colspan="3" align="left">STR</td><td colspan="3" align="left">CON</td></tr>
					<tr>
						<td class="statusbartext">Athletics</td><td class="statusbarvalue">${warrior.skills.Athletics}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Athletics} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Athletics * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#FFE303"></div></div></td>
						<td class="statusbartext">Endurance</td><td class="statusbarvalue">${warrior.skills.Endurance}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Endurance} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Endurance * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#FF0000"></div></div></td>
					</tr>
					<tr>
						<td class="statusbartext">Climb</td><td class="statusbarvalue">${warrior.skills.Climb}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Climb} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Climb * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#FFE303"></div></div></td>
						<td class="statusbartext">Concentration</td><td class="statusbarvalue">${warrior.skills.Concentration}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Concentration} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Concentration * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#FF0000"></div></div></td>
					</tr>
				</table>
			</div>
		</td>
	</body>
</html>
