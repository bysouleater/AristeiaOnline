<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>${store.name} Store</h4>
				<table width="100%" style="font-size:12px;margin:15px 0px 20px 20px;">
					<tr>
						<td width="50%" style="padding-right:30px;"><h4>Buy</h4></td>
						<td width="50%" style="padding-right:30px;"><h4>Sell</h4></td>
					</tr>
					<tr>
						<td style="padding-left:15px;" valign="top">
							<g:each in="${store.items}" var="item" status="i">
								<div title="${item.name} - Value:${item.price} coins" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
									<a href="#" onclick="javascript:openBuy(${item.id},${item.price},'${item.name}','${item.icon}');">
										<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.icon}"/>
									</a>
								</div>
							</g:each>
							<g:if test="${store.items.size() < 30}">
								<g:each in="${store.items.size()+1..30}">
									<div style="float:left;margin-right:10px;margin-bottom:10px;"><img width="32" height="32" src="/images/empty.png"/></div>		
								</g:each>
							</g:if>
						</td>
						<td style="padding-right:15px;"  valign="top">
							<g:each in="${warrior.inventory}" var="item" status="i">
								<div title="${item.name} - Value:${item.price} coins" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;"><img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.icon}"/></div>
							</g:each>
							<g:if test="${warrior.inventory.size() < 30}">
								<g:each in="${warrior.inventory.size()+1..30}">
									<div style="float:left;margin-right:10px;margin-bottom:10px;"><img width="32" height="32" src="/images/empty.png"/></div>		
								</g:each>
							</g:if>
						</td>
					</tr>
				</table>
				<div style="text-align:right;margin-top:20px;font-size:12px;"><a href="<g:createLink controller='warrior' action='exploration'/>"><b>Back to exploration</b></a></div>
			</div>
		</td>
		<g:javascript library="jquery" plugin="jquery"/>
		<jqui:resources/>
		<script>
		$(document).ready(function() {
		    $("#dialog").dialog({ autoOpen:false, 
			    buttons: { "Ok": function() { $(this).dialog("close");},
		    			   "Cancel": function() { $(this).dialog("close");} }
		    });
		});

		function openBuy(item_id, item_price, item_name, item_pic){
			$("#itempic").attr("src",item_pic);
			$("#itemname").html(item_name);
			$("#dialog").dialog({title : "Buy " + item_name});
			$("#dialog").dialog("open");
		}
		</script>
		<div id="dialog" title="Buy">
			<div title="item.name - Value:item.price coins" style="margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
				<img id="itempic" style="padding-left:2px;padding-top:2px;" width="28" height="28" src=""/>
				<label id="itemname"></label>
			</div>
		</div>
	</body>
</html>
