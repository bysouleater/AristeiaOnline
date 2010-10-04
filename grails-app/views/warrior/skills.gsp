<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Skills</h4>
				<table width="100%" style="margin:15px 0px 20px 20px;font-size:12px;">
					<tr><td colspan="3" align="center" class="labeltxt">DEX Bonus +${((warrior.skills.Aiming + warrior.skills.Thievery) / 10).intValue()}</td>
						<td colspan="3" align="center" class="labeltxt">AGI Bonus +${((warrior.skills.Escape_Artist + warrior.skills.Stealth) / 10).intValue()}</td></tr>
					<tr>
						<td class="labeltxt">Aiming</td><td class="statusbarvalue">${warrior.skills.Aiming.round(1)}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Aiming.round(1)} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Aiming.round(1) * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#00FF00"></div></div></td>
						<td class="labeltxt">Escape Artist</td><td class="statusbarvalue">${warrior.skills.Escape_Artist.round(1)}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Escape_Artist.round(1)} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Escape_Artist.round(1) * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#0000FF"></div></div></td>
					</tr>
					<tr>
						<td class="labeltxt">Thievery</td><td class="statusbarvalue">${warrior.skills.Thievery.round(1)}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Thievery.round(1)} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Thievery.round(1) * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#00FF00"></div></div></td>
						<td class="labeltxt">Stealth</td><td class="statusbarvalue">${warrior.skills.Stealth.round(1)}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Stealth.round(1)} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Stealth.round(1) * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#0000FF"></div></div></td>
					</tr>
					<tr><td colspan="3" align="center" class="labeltxt" style="padding-top:15px;">STR Bonus +${((warrior.skills.Athletics + warrior.skills.Climb) / 10).intValue()}</td>
						<td colspan="3" align="center" class="labeltxt" style="padding-top:15px;">CON Bonus +${((warrior.skills.Endurance + warrior.skills.Concentration) / 10).intValue()}</td></tr>
					<tr>
						<td class="labeltxt">Athletics</td><td class="statusbarvalue">${warrior.skills.Athletics.round(1)}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Athletics.round(1)} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Athletics.round(1) * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#FFE303"></div></div></td>
						<td class="labeltxt">Endurance</td><td class="statusbarvalue">${warrior.skills.Endurance.round(1)}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Endurance.round(1)} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Endurance.round(1) * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#FF0000"></div></div></td>
					</tr>
					<tr>
						<td class="labeltxt">Climb</td><td class="statusbarvalue">${warrior.skills.Climb.round(1)}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Climb.round(1)} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Climb.round(1) * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#FFE303"></div></div></td>
						<td class="labeltxt">Concentration</td><td class="statusbarvalue">${warrior.skills.Concentration.round(1)}</td>
						<td><div class="statusbar outside" style="width:100px;" title="${warrior.skills.Concentration.round(1)} / ${warrior.job.maxSkillsValue}">
							<div class="statusbar inside" style="width:${(warrior.skills.Concentration.round(1) * 100 / warrior.job.maxSkillsValue).intValue()}px;background-color:#FF0000"></div></div></td>
					</tr>
				</table>
			</div>
		</td>
	</body>
</html>
