<html>
	<head>
		<meta name="layout" content="main"></meta>
	</head>
	<body>
		<div id="content">
			<h3>
				<span>${warrior.name} - ${warrior.job.name} Lvl ${warrior.level} <g:link controller="warrior" action="levelup" id="${warrior.id}" style="text-decoration:none;">+</g:link></span>
				<span style="float:right;">Origin: ${warrior.origin.name}</span>
			</h3>
			<table width="100%">
				<tr>
					<td width="100" valign="top">
						<img src="/images/male_paladin.png"/>
					</td>
					<td width="160" valign="top">
						<div class="statusbartext">HP &nbsp;&nbsp;${warrior.actualHP} / ${warrior.getStat("HP",true)}</div>
						<div class="statusbar outside">
							<div class="statusbar inside" style="width:${((warrior.actualHP * 100 / warrior.getStat("HP",true)) * 1.5).intValue()}px;background-color:#FF0000"></div></div>
						<div class="statusbartext">STA &nbsp;&nbsp;${warrior.actualSTA} / ${warrior.getStat("STA",true)}</div>
						<div class="statusbar outside">
							<div class="statusbar inside" style="width:${((warrior.actualSTA * 100 / warrior.getStat("STA",true)) * 1.5).intValue()}px;background-color:#FFE303"></div></div>
						<div class="statusbartext" style="font-size:10px;">EXP &nbsp;&nbsp;${warrior.actualExp} / ${warrior.nextLvlExp()}</div>
						<div class="statusbar outside">
							<div class="statusbar inside" style="width:${warrior.actualExpPerc()}px;background-color:#0000FF"></div></div>


					</td>
					<td valign="top">
						<g:form name="updateS" method="get" controller="warrior" action="updateStat">
							<input type="hidden" name="stat" value=""/>
							<input type="hidden" name="id" value="${warrior.id}"/>
							<table width="100%" style="font-size:12px;">
								<tr>
									<td>STR</td>
									<td align="right" style="padding-right:5px;">${warrior.getStat("STR",true)}</td>
									<td width="15"><g:if test="${warrior.statPoints > 0}">
											<a href="javascript:updateStat('STR');" style="text-decoration:none;">+</a>
										</g:if>
									</td>
									<td>DEX</td>
									<td align="right" style="padding-right:5px;">${warrior.getStat("DEX",true)}</td>
									<td width="15"><g:if test="${warrior.statPoints > 0}">
											<a href="javascript:updateStat('DEX');" style="text-decoration:none;">+</a>
										</g:if>
									</td>
									<td>P.Attack</td><td align="right" style="padding-right:5px;">${warrior.getStat("PAtk",false)}</td>
									<td>P.Def</td><td align="right" style="padding-right:5px;">${warrior.getStat("PDef",false)}</td>
								</tr>
								<tr>
									<td>CON</td>
									<td align="right" style="padding-right:5px;">${warrior.getStat("CON",true)}</td>
									<td width="15"><g:if test="${warrior.statPoints > 0}">
											<a href="javascript:updateStat('CON');" style="text-decoration:none;">+</a>
										</g:if>
									</td>
									<td>AGI</td>
									<td align="right" style="padding-right:5px;">${warrior.getStat("AGI",true)}</td>
									<td width="15"><g:if test="${warrior.statPoints > 0}">
											<a href="javascript:updateStat('AGI');" style="text-decoration:none;">+</a>
										</g:if>
									</td>
									<td>Accuracy</td><td align="right" style="padding-right:5px;">${warrior.getStat("Acc",false)}</td>
									<td>Evasion</td><td align="right" style="padding-right:5px;">${warrior.getStat("Eva",false)}</td>
								</tr>
								<tr>
									<td colspan="6">Stats Points&nbsp;&nbsp;${warrior.statPoints}</td>
									<td>Attack Rate</td><td align="right" style="padding-right:5px;">${warrior.getStat("ARate",false)}</td>
									<td>Critic Rate</td><td align="right" style="padding-right:5px;">${warrior.getStat("CRate",false)}</td>
								</tr>
								<tr>
									<td colspan="6">Actual Location&nbsp;&nbsp;${warrior.origin.name} City</td>
									<td>Luck</td><td align="right" style="padding-right:5px;">${warrior.getStat("Luck",false)}</td>
									<td>Initiative</td><td align="right" style="padding-right:5px;">${warrior.getStat("Init",false)}</td>
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
							<li><a href="#">Action</a></li>
							<li><a href="#">Action2</a></li>
						</ul>
					</td>
					<td valign="top">
						<div id="content">
							<h4>Journal</h4>
							<ul style="font-size:12px;">
								<li>Lorem ipsum  ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an.</li>
								<li>Lorem ipsum  ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an.</li>
								<li>Lorem ipsum  ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an.</li>
								<li>Lorem ipsum  ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an.</li>
								<li>Lorem ipsum  ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an.</li>
								<li>Lorem ipsum  ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an.</li>
							</ul>
						</div>
					</td>
				</tr>
			</table>			
		</div>
	</body>
</html>
