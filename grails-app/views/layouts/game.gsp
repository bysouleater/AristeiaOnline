<html>
	<head>
		<title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
	</head>
	<body>
		<div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div style="height:26px;margin:0 0 0 0.5em;
	position:relative;
	z-index:2;border-color:#AAAAAA -moz-use-text-color #AAAAAA #AAAAAA;
	border-style:solid none none solid;
	border-width:1px medium 1px 1px;background-color:#627AAD" width="100%"><!--<tr>
        	<td valign="center">--><img style="float:left;padding-top:3px;padding-left:3px;" src="${resource(dir:'images',file:'shield.png')}" alt="Grails" border="0" width="20" height="20" /><!-- </td>
        	<td valign="center">--><div style="float:left;font-weight:bold;padding-top:3px;margin-left:3px;color:#FFFFFF">Aristeia Online</div><!-- </td>
        </tr></table>--></div>
        <div class="clear"></div>
		<div id="content">
			<h3>
				<span>${warrior.name} - ${warrior.job.name} Lvl ${warrior.level} <g:link controller="warrior" action="levelup" id="${warrior.id}" style="text-decoration:none;">+</g:link></span>
				<span style="float:right;">Origin: ${warrior.origin.name}</span>
			</h3>
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
									<td align="left" class="statusbarvalue"><g:if test="${warrior.bonusBaseStat('STR').intValue() > -1}">+${warrior.bonusBaseStat("STR").intValue()}</g:if></td>
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
									<td align="left" class="statusbarvalue"><g:if test="${warrior.bonusBaseStat('CON').intValue() > -1}">+${warrior.bonusBaseStat("CON").intValue()}</g:if></td>
									<td width="15"><g:if test="${warrior.statPoints > 0}">
											<a href="javascript:updateStat('CON');" style="text-decoration:none;"><img border="0" width="10" height="10" src="/images/up.png"/></a>
										</g:if>
									</td>
									
									<td class="statusbartext">AGI</td>
									<td align="right" class="statusbarvalue">${warrior.baseStat("AGI").intValue()}</td>
									<td align="left" class="statusbarvalue"><g:if test="${warrior.bonusBaseStat('DEX').intValue() > -1}">+${warrior.bonusBaseStat("AGI").intValue()}</g:if></td>
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
									<td colspan="12" style="padding-top:12px;" align="center">
										<table><tr>
										<td><img border="0" width="15" height="15" src="/images/skills.jpg"/></td>
										<td valign="middle" class="statusbartext" align="center" style="padding-right:10px;"><a href="<g:createLink controller='warrior' action='skills' id='${warrior.id}'/>">Skills</a></td>
										<td><img border="0" width="15" height="15" src="/images/equip.png"/></td>
										<td valign="middle" class="statusbartext" align="center" style="padding-right:10px;"><a href="<g:createLink controller='warrior' action='equip' id='${warrior.id}'/>">Equipment</a></td>
										<td><img border="0" width="15" height="15" src="/images/inventory.png"/></td>
										<td valign="middle" class="statusbartext" align="center" style="padding-right:10px;"><a href="<g:createLink controller='warrior' action='inventory' id='${warrior.id}'/>">Inventory</a></td></tr></table>
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
			<table width="100%">
				<tr>
					<td width="150" valign="top">
						<h4>Actions</h4>
						<ul class="actionspro">
							<li><a href="<g:createLink controller='warrior' action='index' id='${warrior.id}'/>">Journal</a></li>
							<li><a href="#">Action2</a></li>
							<li><a href="#">Action</a></li>
							<li><a href="#">Action2</a></li>
							<li><a href="#">Action</a></li>
							<li><a href="#">Action2</a></li>
							<li><a href="#">Action</a></li>
							<li><a href="#">Action2</a></li>
							<li><a href="#">Action</a></li>
							<li><a href="#">Action2</a></li>
							<li><a href="#">Action</a></li>
							<li><a href="#">Action2</a></li>
						</ul>
					</td>
					<g:layoutBody />
				</tr>
			</table>
			<div style="text-align:right; font-size:12px;margin-top:20px;"><g:link style="text-decoration:none;" action="index" controller="main">Back to warriors list</g:link></div>			
		</div>
	</body>
</html>
