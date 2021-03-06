<table width="100%"><tr>
	<td width="120" height="140" align="left" valign="top">
		<img style="border-style:dashed;border-width:1px;" src="/images/jobs/${warrior.gender}/${warrior.job.name}.png"/>
	</td>
	<td width="32" height="140" align="left" valign="top">
		<!--<table border="0" cellpadding="0" cellspacing="0" style="font-size:10px;font-weight:bold;">
			<tr><td align="center">GUILD</td></tr>
			<tr><td align="center"><img src="/images/bigsnaketooth.png"/></td></tr>
			 <tr><td align="center">RANK</td></tr>
			<tr><td align="center"><img src="/images/bigsnaketooth.png"/></td></tr> 
		</table>-->
	</td>
	<td align="left" valign="top">
		<table border="0" cellpadding="0" cellspacing="0" width="100%"><tr>
			<td width="130" valign="top" style="margin-left:5px;">
				<table width="100%" border="0">
					<tr>
						<td width="25" align="left" class="labeltxt"><span title="You recover ${warrior.HPRecoverAmount()} HP every ${((100-warrior.completeDerivedStat("CON") + 20) / (warrior.actualLocation.city?2:1)).intValue()} segs">HP</span></td>
						<td align="left" class="labelvalue"><span title="You recover ${warrior.HPRecoverAmount()} HP every ${((100-warrior.completeDerivedStat("CON") + 20) / (warrior.actualLocation.city?2:1)).intValue()} segs">${warrior.actualHP} / ${warrior.maxHP()}</span></td>
					</tr>
					<tr><td colspan="2" align="left">
						<div class="statusbar outside" title="You recover ${warrior.HPRecoverAmount()} HP every ${((100-warrior.completeDerivedStat("CON") + 20) / (warrior.actualLocation.city?2:1)).intValue()} segs">
							<div class="statusbar inside" style="width:${((warrior.actualHP * 100 / warrior.maxHP()) * 1.25).intValue()}px;background-color:#FF0000"></div></div>
					</td></tr>
					<tr>
						<td width="25" align="left" class="labeltxt"><span title="You recover ${warrior.STARecoverAmount()} STA every ${((100-warrior.completeDerivedStat("AGI") + 20) / (warrior.actualLocation.city?2:1)).intValue()} segs">STA</span></td>
						<td align="left" class="labelvalue"><span title="You recover ${warrior.STARecoverAmount()} STA every ${((100-warrior.completeDerivedStat("AGI") + 20) / (warrior.actualLocation.city?2:1)).intValue()} segs">${warrior.actualSTA} / ${warrior.maxSTA()}</span></td>
					</tr>
					<tr><td colspan="2" align="left">
						<div class="statusbar outside" title="You recover ${warrior.STARecoverAmount()} STA every ${((100-warrior.completeDerivedStat("AGI") + 20) / (warrior.actualLocation.city?2:1)).intValue()} segs">
							<div class="statusbar inside" style="width:${((warrior.actualSTA * 100 / warrior.maxSTA()) * 1.25).intValue()}px;background-color:#FFE303"></div></div>
					</td></tr>
					<tr>
						<td width="25" align="left" class="labeltxt" style="font-size:10px;"><span title="${(warrior.actualExpPerc() / 1.25).intValue()}% EXP">EXP</span></td>
						<td align="left" class="labelvalue" style="font-size:10px;"><span title="${(warrior.actualExpPerc() / 1.25).intValue()}% EXP">${warrior.actualExp} / ${warrior.nextLvlExp()}</span></td>
					</tr>
					<tr><td colspan="2" align="left">
						<div class="statusbar outside" title="${(warrior.actualExpPerc() / 1.25).intValue()}% EXP">
							<div class="statusbar inside" style="width:${warrior.actualExpPerc()}px;background-color:#0000FF"></div></div>
					</td></tr>
					<tr height="25">
						<td width="25"><img width="15" title="Gold Pieces" height="15" src="/images/coins.png"/></td>
						<td valign="middle" align="left" title="${warrior.gold} Gold Pieces" class="labeltxt">${warrior.gold}</td>
					</tr>
				</table>
			</td>
			<td valign="top" align="center">
				<table height="100" border="0" style="font-size:12px;">
					<tr>
						<td width="35" class="labeltxt" style="padding-right:0px;" title="Strength represents you power">STR</td>
						<td width="10" style="padding-right:0px;"><g:if test="${warrior.statPoints > 0}"><a href="<g:createLink controller="warrior" action="updateStat" id="STR"/>"><img width="10" height="10" src="/images/up.png"/></a></g:if></td>
						<td width="25" align="right" class="labelvalue">${warrior.baseStat("STR").intValue()}</td>
						<td width="25" align="left" class="labelvalue"><g:if test="${warrior.bonusBaseStat('STR').intValue() > 0}">+${warrior.bonusBaseStat("STR").intValue()}</g:if></td>
						<td width="87" style="padding-left:7px;" class="labeltxt" title="P. Attack formula: STR + Lvl + Bonuses">P. Attack</td>
						<td width="30" class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("PAtk")}</td>
						<td width="80" class="labeltxt" title="P. Def formula: CON + Lvl + Bonuses">P. Def</td>
						<td width="30" class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("PDef")}</td>
					</tr>
					<tr>
						<td width="35" class="labeltxt" style="padding-right:0px;" title="Constitution represents your defense">CON</td>
						<td width="10" style="padding-right:0px;"><g:if test="${warrior.statPoints > 0}"><a href="<g:createLink controller="warrior" action="updateStat" id="CON"/>"><img width="10" height="10" src="/images/up.png"/></a></g:if></td>
						<td width="25" align="right" class="labelvalue">${warrior.baseStat("CON").intValue()}</td>
						<td width="25" align="left" class="labelvalue"><g:if test="${warrior.bonusBaseStat('CON').intValue() > 0}">+${warrior.bonusBaseStat("CON").intValue()}</g:if></td>
						<td width="87" style="padding-left:7px;" class="labeltxt" title="Accuracy formula: (DEX + Lvl) / 2 + Bonuses">Accuracy</td>
						<td width="30" class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("Acc")}</td>
						<td width="80" class="labeltxt" title="Evasion formula: (AGI + Lvl) / 2 + Bonuses">Evasion</td>
						<td width="30" class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("Eva")}</td>
					</tr>
					<tr>
						<td width="35" class="labeltxt" style="padding-right:0px;" title="Dexterity represents your accuracy">DEX</td>
						<td width="10" style="padding-right:0px;"><g:if test="${warrior.statPoints > 0}"><a href="<g:createLink controller="warrior" action="updateStat" id="DEX"/>"><img width="10" height="10" src="/images/up.png"/></a></g:if></td>
						<td width="25" align="right" class="labelvalue">${warrior.baseStat("DEX").intValue()}</td>
						<td width="25" align="left" class="labelvalue"><g:if test="${warrior.bonusBaseStat('DEX').intValue() > 0}">+${warrior.bonusBaseStat("DEX").intValue()}</g:if></td>
						<td width="87" style="padding-left:7px;" class="labeltxt" title="Attack Rate formula: (AGI + Lvl) / 5 + Bonuses">Attack Rate</td>
						<td width="30" class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("ARate")}</td>
						<td width="80" class="labeltxt" title="Critical Rate formula: (DEX + Lvl) / 5 + Bonuses">Critical Rate</td>
						<td width="30" class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("CRate")}</td>
					</tr>
					<tr>
						<td width="35" class="labeltxt" style="padding-right:0px;" title="Agility represents your speed">AGI</td>
						<td width="10" style="padding-right:0px;"><g:if test="${warrior.statPoints > 0}"><a href="<g:createLink controller="warrior" action="updateStat" id="AGI"/>"><img width="10" height="10" src="/images/up.png"/></a></g:if></td>
						<td width="25" align="right" class="labelvalue">${warrior.baseStat("AGI").intValue()}</td>
						<td width="25" align="left" class="labelvalue"><g:if test="${warrior.bonusBaseStat('AGI').intValue() > 0}">+${warrior.bonusBaseStat("AGI").intValue()}</g:if></td>
						<td width="87" style="padding-left:7px;" class="labeltxt" title="Luck formula: (AGI + Lvl) / 10 + Bonuses">Luck</td>
						<td width="30" class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("Luck")}</td>
						<td width="80" class="labeltxt" title="Initiative formula: (DEX + Lvl) / 10 + Bonuses">Initiative</td>
						<td width="30" class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("Init")}</td>
					</tr>
					<tr>
						<td colspan="8">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width="80" class="labeltxt">Stats Points</td>
									<td width="30" class="labelvalue">${warrior.statPoints}</td>
									<td width="100" class="labeltxt">Actual Location</td>
									<td class="labelvalue">${warrior.actualLocation.name}</td>		
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			${body}
		</tr></table>
	</td>
</tr></table>