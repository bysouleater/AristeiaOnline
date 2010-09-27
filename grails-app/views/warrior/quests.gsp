<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Quests</h4>
				<div style="font-size:14px;">In progress</div>
				<g:if test="${doing_quests != null && doing_quests.size() > 0}">
					<g:each in="${doing_quests}" status="i" var="quest">
						<div style="margin:15px 0px 20px 20px;">
							<div style="width:450px;" class="buttonlink biglink">
								<img height="30" width="30" style="float:left;margin-right:10px;" src="/images/skills.jpg"/>
								<b>${quest.title}</b>
								<br>
								<span id="short_desc" style="width:200px;">${quest.description}</span>
							</div>
						</div>
					</g:each>
				</g:if>
				<g:else>
					<div style="padding-left:30px;font-size:12px;">You are currently doing any quest.</div>
				</g:else>
				<div style="font-size:14px;">Available</div>
				<g:if test="${available_quests != null && available_quests.size() > 0}">
					<g:each in="${available_quests}" status="i" var="quest">
						<div id="quest_${quest.id}_short" style="margin:15px 0px 0px 20px;">
							<div style="width:450px;" class="buttonlink biglink">
								<img height="30" width="30" style="float:left;margin-right:10px;" src="/images/skills.jpg"/>
								<div style="float:left;width:250px;height:32px;overflow:hidden;">
									<b>${quest.title}</b><br>
									${quest.description}
								</div>
								<div style="margin-left:5px;float:left;width:70px;"><b>Min Lvl</b> ${quest.minLevel}<br><b>Max Lvl</b> ${quest.maxLevel}</div>
								<div style="margin-left:5px;float:left;width:70px;"><br><a href="javascript:showDetails(${quest.id});">View Details</a></div>
							</div>
						</div>
						<table id="quest_${quest.id}_long" width="462" cellspacing="0" cellpadding="0" style="border: 1px solid #AAAAAA;margin:15px 0px 0px 20px;font-size:12px;line-height: 1.3em;display:none;">
							<tr>	
								<td width="30" valign="top"><img height="30" width="30" style="padding:5px;float:left;" src="/images/skills.jpg"/></td>
								<td width="250" style="padding:5px;"><b>${quest.title}</b><br>
									${quest.description}
									<hr style="border:1px dashed;">
									<table width="100%" style="font-size:12px;">
										<tr>
											<td width="50%"><b>Items</b></td>
											<td width="50%"><b>Skills</b></td>
										</tr>
										<tr>
											<td>0 / 10 Wolf Fang</td>
											<td>0 / 10 Endurance</td>
										</tr>
									</table>
									<hr style="border:1px dashed;">
									<table width="100%" style="font-size:12px;">
										<tr>
											<td width="50%"><b>Reward</b></td>
											<td width="50%"><b>Items</b></td>
										</tr>
										<tr>
											<td><b>EXP</b> 1230</td>
											<td rowspan="2">bla</td>
										</tr>
										<tr>
											<td><b>Gold</b> 1230</td>
										</tr>
									</table>	
								</td>
								<td width="70" valign="top" style="padding-top:5px;"><b>Min Lvl</b> ${quest.minLevel}<br><b>Max Lvl</b> ${quest.maxLevel}</td>
								<td valign="bottom" style="padding-bottom:5px;"><a href="javascript:hideDetails(${quest.id});">Hide Details</a><br><br><a href="#">Start Quest</a></td>
							</tr>
						</table>
						<script>
							function showDetails(quest_id){
								document.getElementById("quest_"+quest_id+"_long").style.display = "block";
								document.getElementById("quest_"+quest_id+"_short").style.display = "none";
							}

							function hideDetails(quest_id){
								document.getElementById("quest_"+quest_id+"_long").style.display = "none";
								document.getElementById("quest_"+quest_id+"_short").style.display = "block";
							}
						</script>
					</g:each>
				</g:if>
				<g:else>
					<div style="padding-left:30px;font-size:12px;">There's no available quests right now.</div>
				</g:else>
			</div>
		</td>
	</body>
</html>
