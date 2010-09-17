<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Equipment</h4>
				<table style="font-size:12px;margin:15px 0px 20px 20px;" cellpadding="0">
					<tr>
						<td class="labeltxt">Head </td>
						<g:if test="${warrior.equip.head}">
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">${warrior.equip.head.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
						<td class="labeltxt">Shoulder </td>
						<g:if test="${warrior.equip.shoulder}">
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">${warrior.equip.shoulder.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
					</tr>
					<tr>
						<td class="labeltxt">Shield </td>
						<g:if test="${warrior.equip.shield}">
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">${warrior.equip.shield.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
						<td class="labeltxt">Weapon </td>
						<g:if test="${warrior.equip.weapon}">
							<td width="32" height="32" align="center" valign="middle">
							<button style="background:url('/images/empty.png');border:0px;width:32px;height:32px;"><img width="26" height="26" src="${warrior.equip.weapon.type.icon}"/></button>
							</td>
							<td width="200">${warrior.equip.weapon.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
					</tr>
					<tr>
						<td class="labeltxt">Body </td>
						<g:if test="${warrior.equip.body}">
							<td width="32" height="32" align="center" valign="middle">
							<button style="background:url('/images/empty.png');border:0px;width:32px;height:32px;"><img width="26" height="26" src="${warrior.equip.body.type.icon}"/></button>
							</td>
							<td width="200">${warrior.equip.body.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
						<td class="labeltxt">Foot </td>
						<g:if test="${warrior.equip.foot}">
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">${warrior.equip.foot.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
					</tr>
					<tr>
						<td class="labeltxt">Accesory </td>
						<g:if test="${warrior.equip.accesory1}">
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">${warrior.equip.accesory1.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
						<td class="labeltxt">Accesory </td>
						<g:if test="${warrior.equip.accesory2}">
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">${warrior.equip.accesory2.type.name}</td>
						</g:if>
						<g:else>
							<td><img width="32" height="32" src="/images/empty.png"/></td>
							<td width="200">&nbsp;</td>
						</g:else>
					</tr>
				</table>
			</div>
		</td>
	</body>
</html>
