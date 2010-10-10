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
											<td width="50%"><b>Items needed</b></td>
											<td width="50%"><b>Skills needed</b></td>
										</tr>
										<tr>
											<td valign="top">
												<g:if test="${quest.itemsNeeded != null && quest.itemsNeeded.size() > 0}">
													<g:each in="${quest.itemsNeeded}" status="ite" var="item">
														<div style="height:34px;">
															<div title="${item.type.name}" style="float:left;margin-right:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
																<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.type.icon}"/>
															</div>
															${warrior.qtyOfItem(item.type)} of ${item.qty}
														</div>
													</g:each>
												</g:if>
											</td>
											<td valign="top">
												<g:if test="${quest.skillsNeeded != null}">
													<g:each in="${quest.skillsNeeded.all()}" status="s" var="skill">
														<g:if test="${skill.value > 0}">${warrior.skills."$skill.key"} of ${skill.value.intValue()} ${skill.key}<br></g:if>
													</g:each>
												</g:if>
											</td>
										</tr>
									</table>
									<hr style="border:1px dashed;">
									<table width="100%" style="font-size:12px;">
										<tr>
											<td width="50%"><b>Reward</b></td>
											<td width="50%"><b>Items</b></td>
										</tr>
										<tr>
											<td style="line-height: 1.5em">
												<g:if test="${quest.exp > 0}"><b>EXP</b> ${quest.exp}<br></g:if>
												<g:if test="${quest.gold > 0}"><b>Gold</b> ${quest.gold}<br></g:if>
												<g:if test="${quest.jobReward}"><b>Job</b> ${quest.jobReward?.name}</g:if>
											</td>
											<td>
												<g:if test="${quest.itemsRewarded != null && quest.itemsRewarded.size() > 0}">
													<g:each in="${quest.itemsRewarded}" status="ite" var="item">
														<div title="${item.type.name}" style="float:left;margin-right:5px;margin-bottom:5px;background-image:url('/images/empty.png');width:32px;height:32px;">
															<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.type.icon}"/>
															<g:if test="${item.qty > 1}"><span style="top:-5px;font-size:10px;font-weight:bold;position:relative;">x${item.qty}</span></g:if>
														</div>
													</g:each>
												</g:if>
											</td>
										</tr>
									</table>	
								</td>
								<td width="70" valign="top" style="padding-top:5px;"><b>Min Lvl</b> ${quest.minLevel}<br><b>Max Lvl</b> ${quest.maxLevel}</td>
								<td valign="bottom" style="padding-bottom:5px;"><a href="javascript:hideDetails(${quest.id});">Hide Details</a><br><br>
								<a href="<g:createLink controller="warrior" action="getReward" id="${quest.id}"/>">Get reward</a></td>
							</tr>
						</table>
					</g:each>
				</g:if>
				<g:else>
					<div style="padding-left:30px;font-size:12px;">You are currently doing any quest.</div>
				</g:else>
				<div style="margin-top:10px;font-size:14px;">Available</div>
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
											<td width="50%"><b>Items needed</b></td>
											<td width="50%"><b>Skills needed</b></td>
										</tr>
										<tr>
											<td valign="top">
												<g:if test="${quest.itemsNeeded != null && quest.itemsNeeded.size() > 0}">
													<g:each in="${quest.itemsNeeded}" status="ite" var="item">
														<div style="height:34px;">
															<div title="${item.type.name}" style="float:left;margin-right:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
																<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.type.icon}"/>
															</div>
															${warrior.qtyOfItem(item.type)} of ${item.qty}
														</div>
													</g:each>
												</g:if>
											</td>
											<td valign="top">
												<g:if test="${quest.skillsNeeded != null}">
													<g:each in="${quest.skillsNeeded.all()}" status="s" var="skill">
														<g:if test="${skill.value > 0}">${warrior.skills."$skill.key"} of ${skill.value.intValue()} ${skill.key}<br></g:if>
													</g:each>
												</g:if>
											</td>
										</tr>
									</table>
									<hr style="border:1px dashed;">
									<table width="100%" style="font-size:12px;">
										<tr>
											<td width="50%"><b>Reward</b></td>
											<td width="50%"><b>Items</b></td>
										</tr>
										<tr>
											<td style="line-height: 1.5em">
												<g:if test="${quest.exp > 0}"><b>EXP</b> ${quest.exp}<br></g:if>
												<g:if test="${quest.gold > 0}"><b>Gold</b> ${quest.gold}<br></g:if>
												<g:if test="${quest.jobReward}"><b>Job</b> ${quest.jobReward?.name}</g:if>
											</td>
											<td>
												<g:if test="${quest.itemsRewarded != null && quest.itemsRewarded.size() > 0}">
													<g:each in="${quest.itemsRewarded}" status="ite" var="item">
														<div title="${item.type.name}" style="float:left;margin-right:5px;margin-bottom:5px;background-image:url('/images/empty.png');width:32px;height:32px;">
															<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.type.icon}"/>
															<g:if test="${item.qty > 1}"><span style="top:-5px;font-size:10px;font-weight:bold;position:relative;">x${item.qty}</span></g:if>
														</div>
													</g:each>
												</g:if>
											</td>
										</tr>
									</table>	
								</td>
								<td width="70" valign="top" style="padding-top:5px;"><b>Min Lvl</b> ${quest.minLevel}<br><b>Max Lvl</b> ${quest.maxLevel}</td>
								<td valign="bottom" style="padding-bottom:5px;"><a href="javascript:hideDetails(${quest.id});">Hide Details</a><br><br>
								<a href="<g:createLink controller="warrior" action="startQuest" id="${quest.id}"/>">Start Quest</a></td>
							</tr>
						</table>
					</g:each>
				</g:if>
				<g:else>
					<div style="padding-left:30px;font-size:12px;">There's no available quests right now.</div>
				</g:else>
			</div>
			<script>
				function showDetails(quest_id){
					document.getElementById("quest_"+quest_id+"_long").style.display = "block";
					document.getElementById("quest_"+quest_id+"_short").style.display = "none";
					FB.Canvas.setSize();
				}

				function hideDetails(quest_id){
					document.getElementById("quest_"+quest_id+"_long").style.display = "none";
					document.getElementById("quest_"+quest_id+"_short").style.display = "block";
					FB.Canvas.setSize();
				}
			</script>
		</td>
	</body>
</html>
