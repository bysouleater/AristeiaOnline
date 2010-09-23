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
									<a href="#" onclick="javascript:openBuy(${item.id},${item.price},'${item.name}','${item.icon}',${item.consumable});">
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
								<div title="${item.type.name} - Value:${(item.type.price / 2).intValue()} coins" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
									<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.type.icon}"/>
									<g:if test="${item.qty > 1}"><span style="font-size:10px;font-weight:bold;position:relative;">x${item.qty}</span></g:if>
								</div>
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
		<jqui:resources theme="aristeia"/>
		<script>
		$(document).ready(function() {
		    $("#dialog").dialog({ autoOpen:false, resizable:false, 
			    buttons: { "Ok": function() { document.buyForm.submit();},
		    			   "Cancel": function() { clearInterval(myInterval); 
	    			   $(this).dialog("close");} }
		    });
		});
	
		var myInterval;
		
		function openBuy(item_id, item_price, item_name, item_pic, consumable){
			$("#imgdiv").attr("title",item_name + " - Value:" + item_price + " coins");
			$("#itempic").attr("src",item_pic);
			$("#itemname").html(item_name);
			$("#itemprice").html(item_price);
			$("#itemtotal").html(item_price);
			$("#item_id").attr("value",item_id);
			$("#item_qty").attr("value",1);
			$("#inputqty").attr("value",1);
			if(!consumable){
				$("#inputqty").attr("readonly","readonly");
			}else{
				myInterval = setInterval("refreshTotal()",1000);
			}
			$("#axn").attr("value","buy");
			$("#dialog").dialog({title : "Buy " + item_name + "?"});
			$("#dialog").dialog("open");
		}

		function refreshTotal(){
			var price = $("#itemprice").html();
			var qty = $("#inputqty").attr("value");
			var total = parseInt(price) * parseInt(qty);
			$("#itemtotal").html(total);
			$("#item_qty").attr("value",qty);
			if(total > ${warrior.gold}){
				$("#itemtotal").css("color","red");
			}else{
				$("#itemtotal").css("color","#444444");
			}
		}
		</script>
		<g:form name="buyForm" method="get" controller="warrior" action="buysell">
			<g:hiddenField name="item_id"/>
			<g:hiddenField name="item_qty"/>
			<g:hiddenField name="axn"/>
		<div id="dialog" title="Buy">
			<div style="line-height: 1.5em;">
				<div id="imgdiv" title="" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
					<img id="itempic" style="padding-left:2px;padding-top:2px;" width="28" height="28" src=""/>
				</div>
				<label id="itemname"></label>
				<span style="float:right;margin-left:5px;">
					<img width="15" height="15" src="/images/coins.png"/>
				</span>
				<span style="float:right;" id="itemprice"></span>
				<br>
				Quantity
				<span style="float:right;">
					<input id="inputqty" name="inputqty" maxlength="3" style="border:0;text-align:right;" type="text" size="2" value="1"/>
				</span>
			</div>
			<div>
				<hr>
				<label style="margin-left:42px;">Total</label>
				<span style="float:right;margin-left:5px;">
					<img width="15" height="15" src="/images/coins.png"/>
				</span>
				<span style="float:right;" id="itemtotal"></span>
			</div>
		</div>
		</g:form>
	</body>
</html>
