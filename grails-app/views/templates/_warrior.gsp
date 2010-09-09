<table width="100%">
	<tr>
		<td width="120" height="120" valign="top">
			<img src="/images/male_paladin.png"/>
		</td>
		<td width="130" valign="top">
			<table width="100%" border="0">
				<tr>
					<td width="25" align="left" class="labeltxt"><span title="${warrior.HPRecoverAmount()} every ${100-warrior.completeDerivedStat("CON") + 20} segs">HP</span></td>
					<td align="left" class="labelvalue"><span title="${warrior.HPRecoverAmount()} every ${100-warrior.completeDerivedStat("CON") + 20} segs">${warrior.actualHP} / ${warrior.maxHP()}</span></td>
				</tr>
				<tr><td colspan="2" align="left">
					<div class="statusbar outside" title="${warrior.HPRecoverAmount()} every ${100-warrior.completeDerivedStat("CON") + 20} segs">
						<div class="statusbar inside" style="width:${((warrior.actualHP * 100 / warrior.maxHP()) * 1.25).intValue()}px;background-color:#FF0000"></div></div>
				</td></tr>
				<tr>
					<td width="25" align="left" class="labeltxt"><span title="${warrior.STARecoverAmount()} every ${100-warrior.completeDerivedStat("AGI") + 20} segs">STA</span></td>
					<td align="left" class="labelvalue"><span title="${warrior.STARecoverAmount()} every ${100-warrior.completeDerivedStat("AGI") + 20} segs">${warrior.actualSTA} / ${warrior.maxSTA()}</span></td>
				</tr>
				<tr><td colspan="2" align="left">
					<div class="statusbar outside" title="${warrior.STARecoverAmount()} every ${100-warrior.completeDerivedStat("AGI") + 20} segs">
						<div class="statusbar inside" style="width:${((warrior.actualSTA * 100 / warrior.maxSTA()) * 1.25).intValue()}px;background-color:#FFE303"></div></div>
				</td></tr>
				<tr>
					<td width="25" align="left" class="labeltxt" style="font-size:10px;">EXP</td>
					<td align="left" class="labelvalue" style="font-size:10px;">${warrior.actualExp} / ${warrior.nextLvlExp()}</td>
				</tr>
				<tr><td colspan="2" align="left">
					<div class="statusbar outside">
						<div class="statusbar inside" style="width:${warrior.actualExpPerc()}px;background-color:#0000FF"></div></div>
				</td></tr>
				<tr height="25">
					<td width="25"><img width="15" height="15" src="/images/coins.png"/></td>
					<td valign="middle" align="left" class="labeltxt">${warrior.gold}</td>
				</tr>
			</table>
		</td>
		<td valign="top">
			<g:form name="updateS" method="get" controller="warrior" action="updateStat" style="margin-bottom:0px;">
				<input type="hidden" name="stat" value=""/>
				<input type="hidden" name="id" value="${warrior.id}"/>
				<table width="100%" border="0" style="font-size:12px;">
					<tr>
						<td class="labeltxt">STR</td>
						<td align="right" class="labelvalue">${warrior.baseStat("STR").intValue()}</td>
						<td align="left" class="labelvalue"><g:if test="${warrior.bonusBaseStat('STR').intValue() > 0}">+${warrior.bonusBaseStat("STR").intValue()}</g:if></td>
						<td width="15"><g:if test="${warrior.statPoints > 0}">
								<a href="javascript:updateStat('STR');" style="text-decoration:none;"><img border="0" width="10" height="10" src="/images/up.png"/></a>
							</g:if>
						</td>
						
						<td class="labeltxt">DEX</td>
						<td align="right" class="labelvalue">${warrior.baseStat("DEX").intValue()}</td>
						<td align="left" class="labelvalue"><g:if test="${warrior.bonusBaseStat('DEX').intValue() > 0}">+${warrior.bonusBaseStat("DEX").intValue()}</g:if></td>
						<td width="15"><g:if test="${warrior.statPoints > 0}">
								<a href="javascript:updateStat('DEX');" style="text-decoration:none;"><img border="0" width="10" height="10" src="/images/up.png"/></a>
							</g:if>
						</td>
						
						<td class="labeltxt">P.Attack</td><td class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("PAtk")}</td>
						<td class="labeltxt">P.Def</td><td class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("PDef")}</td>
					</tr>
					<tr>
						<td class="labeltxt">CON</td>
						<td align="right" class="labelvalue">${warrior.baseStat("CON").intValue()}</td>
						<td align="left" class="labelvalue"><g:if test="${warrior.bonusBaseStat('CON').intValue() > 0}">+${warrior.bonusBaseStat("CON").intValue()}</g:if></td>
						<td width="15"><g:if test="${warrior.statPoints > 0}">
								<a href="javascript:updateStat('CON');" style="text-decoration:none;"><img border="0" width="10" height="10" src="/images/up.png"/></a>
							</g:if>
						</td>
						
						<td class="labeltxt">AGI</td>
						<td align="right" class="labelvalue">${warrior.baseStat("AGI").intValue()}</td>
						<td align="left" class="labelvalue"><g:if test="${warrior.bonusBaseStat('DEX').intValue() > 0}">+${warrior.bonusBaseStat("AGI").intValue()}</g:if></td>
						<td width="15"><g:if test="${warrior.statPoints > 0}">
								<a href="javascript:updateStat('AGI');" style="text-decoration:none;"><img border="0" width="10" height="10" src="/images/up.png"/></a>
							</g:if>
						</td>
						
						<td class="labeltxt">Accuracy</td><td class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("Acc")}</td>
						<td class="labeltxt">Evasion</td><td class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("Eva")}</td>
					</tr>
					<tr>
						<td colspan="8" align="left" valign="top">
							<table border="0" cellspacing="0" cellpadding="0"><tr><td style="padding-right:10px;" class="labeltxt">Stats Points</td><td class="labelvalue">${warrior.statPoints}</td></tr></table>
						</td>
						<td class="labeltxt">Attack Rate</td><td class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("ARate")}</td>
						<td class="labeltxt">Critic Rate</td><td class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("CRate")}</td>
					</tr>
					<tr>
						<td colspan="8" align="left" valign="top">
							<table border="0" cellspacing="0" cellpadding="0"><tr><td style="padding-right:10px;" class="labeltxt">Actual Location</td><td class="labelvalue">${warrior.actualLocation.name}</td></tr></table>
						<td class="labeltxt">Luck</td><td class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("Luck")}</td>
						<td class="labeltxt">Initiative</td><td class="labelvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("Init")}</td>
					</tr>
					<tr>
						${body}
					</tr>
				</table>
			<script>
				function updateStat(stat){
					document.updateS.stat.value = stat;
					document.updateS.submit();
				}
			</script>
			</g:form>
		</td>
	</tr>
</table>