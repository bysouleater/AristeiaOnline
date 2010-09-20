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
						<div title="${item.name} - Value:${item.price} coins" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;"><img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.icon}"/></div>
					</g:each>
					<g:if test="${warrior.inventory.size() < 30}">
						<g:each in="${warrior.inventory.size()+1..30}">
							<div style="float:left;margin-right:10px;margin-bottom:10px;"><img width="32" height="32" src="/images/empty.png"/></div>		
						</g:each>
					</g:if>
				</div>
				<div class="clear"></div>
			</div>
		</td>
	</body>
</html>
