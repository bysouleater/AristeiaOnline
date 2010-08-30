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
						<span>${warrior.name} - ${warrior.job.name} Lvl ${warrior.level} <g:link controller="warrior" action="levelup" id="${warrior.id}" style="text-decoration:none;">+</g:link></span>
						<span style="float:right;">Origin: ${warrior.origin.name}</span>
					</h5>
					<table width="100%">
						<tr>
							<td width="100" valign="top">
								<img src="/images/male_paladin.png"/>
							</td>
							<td width="160" valign="top">
								<div class="statusbartext">HP &nbsp;&nbsp;${warrior.actualHP} / ${warrior.completeStat("HP")}</div>
								<div class="statusbar outside">
									<div class="statusbar inside" style="width:${((warrior.actualHP * 100 / warrior.completeStat("HP")) * 1.5).intValue()}px;background-color:#FF0000"></div></div>
								<div class="statusbartext">STA &nbsp;&nbsp;${warrior.actualSTA} / ${warrior.completeStat("STA")}</div>
								<div class="statusbar outside">
									<div class="statusbar inside" style="width:${((warrior.actualSTA * 100 / warrior.completeStat("STA")) * 1.5).intValue()}px;background-color:#FFE303"></div></div>
								<div class="statusbartext" style="font-size:10px;">EXP &nbsp;&nbsp;${warrior.actualExp} / ${warrior.nextLvlExp()}</div>
								<div class="statusbar outside">
									<div class="statusbar inside" style="width:${warrior.actualExpPerc()}px;background-color:#0000FF"></div></div>
		
		
							</td>
							<td valign="top">
								<g:form name="updateS" method="get" controller="warrior" action="updateStat" style="margin-bottom:0px;">
									<input type="hidden" name="stat" value=""/>
									<input type="hidden" name="id" value="${warrior.id}"/>
									<table width="100%" style="font-size:12px;">
										<tr>
											<td>STR</td>
											<td align="right" style="padding-right:5px;">${warrior.completeStat("STR")}</td>
											<td width="15"><g:if test="${warrior.statPoints > 0}">
													<a href="javascript:updateStat('STR');" style="text-decoration:none;">+</a>
												</g:if>
											</td>
											<td>DEX</td>
											<td align="right" style="padding-right:5px;">${warrior.completeStat("DEX")}</td>
											<td width="15"><g:if test="${warrior.statPoints > 0}">
													<a href="javascript:updateStat('DEX');" style="text-decoration:none;">+</a>
												</g:if>
											</td>
											<td>P.Attack</td><td align="right" style="padding-right:5px;">${warrior.completeStat("PAtk")}</td>
											<td>P.Def</td><td align="right" style="padding-right:5px;">${warrior.completeStat("PDef")}</td>
										</tr>
										<tr>
											<td>CON</td>
											<td align="right" style="padding-right:5px;">${warrior.completeStat("CON")}</td>
											<td width="15"><g:if test="${warrior.statPoints > 0}">
													<a href="javascript:updateStat('CON');" style="text-decoration:none;">+</a>
												</g:if>
											</td>
											<td>AGI</td>
											<td align="right" style="padding-right:5px;">${warrior.completeStat("AGI")}</td>
											<td width="15"><g:if test="${warrior.statPoints > 0}">
													<a href="javascript:updateStat('AGI');" style="text-decoration:none;">+</a>
												</g:if>
											</td>
											<td>Accuracy</td><td align="right" style="padding-right:5px;">${warrior.completeStat("Acc")}</td>
											<td>Evasion</td><td align="right" style="padding-right:5px;">${warrior.completeStat("Eva")}</td>
										</tr>
										<tr>
											<td colspan="6">Stats Points&nbsp;&nbsp;${warrior.statPoints}</td>
											<td>Attack Rate</td><td align="right" style="padding-right:5px;">${warrior.completeStat("ARate")}</td>
											<td>Critic Rate</td><td align="right" style="padding-right:5px;">${warrior.completeStat("CRate")}</td>
										</tr>
										<tr>
											<td colspan="6">Actual Location&nbsp;&nbsp;${warrior.origin.name} City</td>
											<td>Luck</td><td align="right" style="padding-right:5px;">${warrior.completeStat("Luck")}</td>
											<td>Initiative</td><td align="right" style="padding-right:5px;">${warrior.completeStat("Init")}</td>
										</tr>
										<tr>
											<td colspan="10" align="center" valign="bottom" style="padding-top:10px;"><a style="text-decoration:none;" href="<g:createLink controller='warrior' action='game' id='${warrior.id}' />"><button>Play with ${warrior.name}</button></a></td>
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
				<div style="text-align:right; font-size:12px;margin-top:20px;">or <g:link style="text-decoration:none;" action="create" controller="warrior">Create a new warrior</g:link></div>
    		</div>
		</g:if>
		<g:else>
			<div id="content">
				<h3><span>Welcome to Aristeia Online</span></h3>
	     		<div style="text-align:center;margin-top:50px;">You don't have any warrior. <g:link action="create" controller="warrior">Create a new warrior</g:link> to start playing!</div>
	     	</div>
		</g:else>
    </body>
</html>
