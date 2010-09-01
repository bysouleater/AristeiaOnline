<html>
    <head>
		<meta name="layout" content="main"></meta>
    </head>
    <body>
		<g:if test="${warriorlist}">
			<div id="content">
				<h3><span>My Warriors</span></h3>
    			<g:each in="${warriorlist}"  var="warrior">
	    			<h5>
						<span>${warrior.name} - ${warrior.job.name} Lvl ${warrior.level}</span>
						<span style="float:right;">Origin: ${warrior.origin.name}</span>
					</h5>
					<table width="100%">
						<tr>
							<td width="120" height="120" valign="top">
								<img src="/images/male_paladin.png"/>
							</td>
							<td width="130" valign="top">
								<table width="100%" border="0">
									<tr>
										<td width="25" align="left" class="statusbartext">HP</td>
										<td align="left" class="statusbarvalue">${warrior.actualHP} / ${warrior.maxHP()}</td>
									</tr>
									<tr><td colspan="2" align="left">
										<div class="statusbar outside">
											<div class="statusbar inside" style="width:${((warrior.actualHP * 100 / warrior.maxHP()) * 1.25).intValue()}px;background-color:#FF0000"></div></div>
									</td></tr>
									<tr>
										<td width="25" align="left" class="statusbartext">STA</td>
										<td align="left" class="statusbarvalue">${warrior.actualSTA} / ${warrior.maxSTA()}</td>
									</tr>
									<tr><td colspan="2" align="left">
										<div class="statusbar outside">
											<div class="statusbar inside" style="width:${((warrior.actualSTA * 100 / warrior.maxSTA()) * 1.25).intValue()}px;background-color:#FFE303"></div></div>
									</td></tr>
									<tr>
										<td width="25" align="left" class="statusbartext" style="font-size:10px;">EXP</td>
										<td align="left" class="statusbarvalue" style="font-size:10px;">${warrior.actualExp} / ${warrior.nextLvlExp()}</td>
									</tr>
									<tr><td colspan="2" align="left">
										<div class="statusbar outside">
											<div class="statusbar inside" style="width:${warrior.actualExpPerc()}px;background-color:#0000FF"></div></div>
									</td></tr>
									<tr height="25">
										<td width="25"><img width="15" height="15" src="/images/coins.png"/></td>
										<td valign="middle" align="left" class="statusbartext">${warrior.gold}</td>
									</tr>
								</table>
							</td>
							<td valign="top">
								<g:form name="updateS" method="get" controller="warrior" action="updateStat" style="margin-bottom:0px;">
									<input type="hidden" name="stat" value=""/>
									<input type="hidden" name="id" value="${warrior.id}"/>
									<table width="100%" border="0" style="font-size:12px;">
										<tr>
											<td class="statusbartext">STR</td>
											<td align="right" class="statusbarvalue">${warrior.baseStat("STR").intValue()}</td>
											<td align="left" class="statusbarvalue"><g:if test="${warrior.bonusBaseStat('STR').intValue() > 0}">+${warrior.bonusBaseStat("STR").intValue()}</g:if></td>
											<td width="15"><g:if test="${warrior.statPoints > 0}">
													<a href="javascript:updateStat('STR');" style="text-decoration:none;"><img border="0" width="10" height="10" src="/images/up.png"/></a>
												</g:if>
											</td>
											
											<td class="statusbartext">DEX</td>
											<td align="right" class="statusbarvalue">${warrior.baseStat("DEX").intValue()}</td>
											<td align="left" class="statusbarvalue"><g:if test="${warrior.bonusBaseStat('DEX').intValue() > 0}">+${warrior.bonusBaseStat("DEX").intValue()}</g:if></td>
											<td width="15"><g:if test="${warrior.statPoints > 0}">
													<a href="javascript:updateStat('DEX');" style="text-decoration:none;"><img border="0" width="10" height="10" src="/images/up.png"/></a>
												</g:if>
											</td>
											
											<td class="statusbartext">P.Attack</td><td class="statusbarvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("PAtk")}</td>
											<td class="statusbartext">P.Def</td><td class="statusbarvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("PDef")}</td>
										</tr>
										<tr>
											<td class="statusbartext">CON</td>
											<td align="right" class="statusbarvalue">${warrior.baseStat("CON").intValue()}</td>
											<td align="left" class="statusbarvalue"><g:if test="${warrior.bonusBaseStat('CON').intValue() > 0}">+${warrior.bonusBaseStat("CON").intValue()}</g:if></td>
											<td width="15"><g:if test="${warrior.statPoints > 0}">
													<a href="javascript:updateStat('CON');" style="text-decoration:none;"><img border="0" width="10" height="10" src="/images/up.png"/></a>
												</g:if>
											</td>
											
											<td class="statusbartext">AGI</td>
											<td align="right" class="statusbarvalue">${warrior.baseStat("AGI").intValue()}</td>
											<td align="left" class="statusbarvalue"><g:if test="${warrior.bonusBaseStat('DEX').intValue() > 0}">+${warrior.bonusBaseStat("AGI").intValue()}</g:if></td>
											<td width="15"><g:if test="${warrior.statPoints > 0}">
													<a href="javascript:updateStat('AGI');" style="text-decoration:none;"><img border="0" width="10" height="10" src="/images/up.png"/></a>
												</g:if>
											</td>
											
											<td class="statusbartext">Accuracy</td><td class="statusbarvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("Acc")}</td>
											<td class="statusbartext">Evasion</td><td class="statusbarvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("Eva")}</td>
										</tr>
										<tr>
											<td colspan="8" align="left" valign="top">
												<table border="0" cellspacing="0" cellpadding="0"><tr><td style="padding-right:10px;" class="statusbartext">Stats Points</td><td class="statusbarvalue">${warrior.statPoints}</td></tr></table>
											</td>
											<td class="statusbartext">Attack Rate</td><td class="statusbarvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("ARate")}</td>
											<td class="statusbartext">Critic Rate</td><td class="statusbarvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("CRate")}</td>
										</tr>
										<tr>
											<td colspan="8" align="left" valign="top">
												<table border="0" cellspacing="0" cellpadding="0"><tr><td style="padding-right:10px;" class="statusbartext">Actual Location</td><td class="statusbarvalue">${warrior.actualLocation.name}</td></tr></table>
											<td class="statusbartext">Luck</td><td class="statusbarvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("Luck")}</td>
											<td class="statusbartext">Initiative</td><td class="statusbarvalue" align="right" style="padding-right:5px;">${warrior.completeDerivedStat("Init")}</td>
										</tr>
										<tr>
											<td colspan="12" style="padding-top:9px;" align="center">
												<a style="text-decoration:none;" href="<g:createLink controller='warrior' action='index' id='${warrior.id}' />"><button type="button">Play with ${warrior.name}</button></a>
											</td>
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
					<hr>
				</g:each>
				<g:if test="${warriorlist.size() < 3}">
					<div style="text-align:right; font-size:12px;margin-top:20px;">or <g:link style="text-decoration:none;" action="create" controller="warrior">Create a new warrior</g:link></div>
				</g:if>
    		</div>
		</g:if>
		<g:else>
			<div id="content">
				<h3><span>Welcome to Aristeia Online</span></h3>
	     		<div style="text-align:center;margin-top:50px;">You don't have any warrior. <g:link action="create" style="text-decoration:none;" controller="warrior">Create a new warrior</g:link> to start playing!</div>
	     	</div>
		</g:else>
    </body>
</html>
