<td height="37" valign="top" <g:if test="${item}">style="cursor:pointer" 
title="<g:if test="${item.type.equipable}">${item.type.name} ${item.type.isWeapon() && item.type.handsQty > 1?'(2H)':''} - Stats${item.type.titleStats()} - Applicable Jobs ${item.type.titleJobs()}</g:if>
<g:elseif test="${item.type.consumable}">${item.type.name} - ${item.type.description}</g:elseif>
<g:else>${item.type.name}</g:else>"
<g:if test="${item.type.equipable && !item.equiped}">onclick="javascript:confirmEquip(${item.id},'${item.type.name} ${item.type.isWeapon() && item.type.handsQty > 1?'(2H)':''}','${item.type.icon}','${item.type.titleStats()}','${item.type.titleJobs()}');"</g:if>
<g:elseif test="${item.type.consumable}">onclick="javascript:confirmUse(${item.id},'${item.type.name}','${item.type.icon}','${item.type.description}');"</g:elseif>
</g:if>>
	<table width="100%" height="32" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td style="background-image:url('/images/empty.png');width:32px;height:32px;">
				<g:if test="${item}">
					<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.type.icon}"/>
				</g:if>
			</td>
			<td style="font-size:12px;padding-left:3px;" width="100" valign="middle"><g:if test="${item}">${item.type.name}</g:if></td>
			
			<g:if test="${item && item.equiped}"><td style="font-size:8px;" width="30" align="left">EQUPD</td></g:if>
			<g:else><td style="font-size:9px;" width="30" align="left"><g:if test="${item && item.qty > 1}">x${item.qty}</g:if></td></g:else>
		</tr>
	</table>
</td>