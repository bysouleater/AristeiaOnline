<td height="37" valign="top" style="cursor:pointer" 
title="<g:if test="${type.equipable}">${type.name} ${type.isWeapon() && type.handsQty > 1?'(2H)':''} - Stats${type.titleStats()} - Applicable Jobs ${type.titleJobs()}</g:if>
<g:elseif test="${type.consumable}">${type.name} - ${type.description}</g:elseif>
<g:else>${type.name}</g:else>">
	<table width="100%" height="32" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td style="background-image:url('/images/empty.png');width:32px;height:32px;">
				<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${type.icon}"/>
			</td>
			<td style="font-size:12px;padding-left:3px;" width="100" valign="middle">${type.name}</td>
			<td style="font-size:9px;" width="30" align="left">x${qty}</td>
		</tr>
	</table>
</td>