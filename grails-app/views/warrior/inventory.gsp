<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Inventory</h4>
				<div style="width:440px;margin:30px 0px 20px 40px;">
					<g:each in="${warrior.inventory}" var="item" status="i">
						<g:if test="${item.type.equipable}">
							<div title="${item.type.name} - Stats${item.type.titleStats()}" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
								<a href="<g:createLink controller="warrior" action="${item.type.equipable?'equip':'use'}" id="${item.id}"/>">
									<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.type.icon}"/>
								</a>
								<g:if test="${item.qty > 1}"><span style="top:-5px;font-size:10px;font-weight:bold;position:relative;">x${item.qty}</span></g:if>
							</div>
						</g:if>
						<g:elseif test="${item.type.consumable}">
							<div title="${item.type.name} - ${item.type.description}" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
								<a href="<g:createLink controller="warrior" action="${item.type.equipable?'equip':'use'}" id="${item.id}"/>">
									<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.type.icon}"/>
								</a>
								<g:if test="${item.qty > 1}"><span style="top:-5px;font-size:10px;font-weight:bold;position:relative;">x${item.qty}</span></g:if>
							</div>
						</g:elseif>
						<g:else>
							<div title="${item.type.name}" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
								<a href="<g:createLink controller="warrior" action="${item.type.equipable?'equip':'use'}" id="${item.id}"/>">
									<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.type.icon}"/>
								</a>
								<g:if test="${item.qty > 1}"><span style="top:-5px;font-size:10px;font-weight:bold;position:relative;">x${item.qty}</span></g:if>
							</div>
						</g:else>
					</g:each>
					<g:if test="${warrior.inventory.size() < 30}">
						<g:each in="${warrior.inventory.size()+1..30}">
							<div style="float:left;margin-right:10px;margin-bottom:10px;">
								<img width="32" height="32" src="/images/empty.png"/>						
							</div>		
						</g:each>
					</g:if>
				</div>
				<div class="clear"></div>
			</div>
		</td>
	</body>
</html>
