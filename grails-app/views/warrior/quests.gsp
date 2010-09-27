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
						<div style="margin:15px 0px 20px 20px;">
							<div style="width:450px;" class="buttonlink biglink">
								<img height="30" width="30" style="float:left;margin-right:10px;" src="/images/skills.jpg"/>
								<div style="float:left;width:250px;height:32px;overflow:hidden;">
									<b>${quest.title}</b><br>
									${quest.description}
								</div>
								<div style="margin-left:5px;float:left;width:70px;"><b>Min Lvl</b> ${quest.minLevel}<br><b>Max Lvl</b> ${quest.maxLevel}</div>
								<div style="margin-left:5px;float:left;width:70px;"><br><a href="#">View Details</a></div>
							</div>
						</div>
					</g:each>
				</g:if>
				<g:else>
					<div style="padding-left:30px;font-size:12px;">There's no available quests right now.</div>
				</g:else>
			</div>
		</td>
	</body>
</html>
