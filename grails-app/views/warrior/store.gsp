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
									<a href="#" onclick="javascript:openSell(${item.id},${(item.type.price / 2).intValue()},'${item.type.name}','${item.type.icon}',${item.qty});">
										<img style="padding-left:2px;padding-top:2px;" width="28" height="28" src="${item.type.icon}"/>
									</a>
									<g:if test="${item.qty > 1}"><span style="top:-3px;font-size:10px;font-weight:bold;position:relative;">x${item.qty}</span></g:if>
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
		    $("#buy_dialog").dialog({ autoOpen:false, resizable:false, 
			    buttons: { "Ok": function() { document.buyForm.submit();},
		    			   "Cancel": function() { clearInterval(myInterval); 
	    			   $(this).dialog("close");} }
		    });
		    $("#sell_dialog").dialog({ autoOpen:false, resizable:false, 
			    buttons: { "Ok": function() { document.sellForm.submit();},
		    			   "Cancel": function() { clearInterval(myInterval); 
	    			   $(this).dialog("close");} }
		    });
		});
	
		var myInterval;
		
		function openBuy(item_id, item_price, item_name, item_pic, consumable){
			$("#buy_imgdiv").attr("title",item_name + " - Value:" + item_price + " coins");
			$("#buy_itempic").attr("src",item_pic);
			$("#buy_itemname").html(item_name);
			$("#buy_itemprice").html(item_price);
			$("#buy_itemtotal").html(item_price);
			$("#buy_item_id").attr("value",item_id);
			$("#buy_item_qty").attr("value",1);
			$("#buy_inputqty").attr("value",1);
			if(!consumable){
				$("#buy_inputqty").attr("readonly","readonly");
			}else{
				myInterval = setInterval("refreshTotalBuy()",500);
			}
			$("#buy_dialog").dialog({title : "Buy " + item_name + "?"});
			$("#buy_dialog").dialog("open");
		}

		function openSell(item_id, item_price, item_name, item_pic, item_qty){
			$("#sell_imgdiv").attr("title",item_name + " - Value:" + item_price + " coins");
			$("#sell_itempic").attr("src",item_pic);
			$("#sell_itemname").html(item_name);
			$("#sell_itemprice").html(item_price);
			$("#sell_itemtotal").html(item_price);
			$("#sell_item_id").attr("value",item_id);
			$("#sell_item_qty").attr("value",1);
			$("#sell_inputqty").attr("value",1);
			$("#sell_max_qty").attr("value",item_qty);
			if(item_qty > 1){
				$("#sell_inputqty").removeAttr("readonly");
				myInterval = setInterval("refreshTotalSell("+item_qty+")",500);
			}else{
				$("#sell_inputqty").attr("readonly","readonly");
			}
			$("#sell_dialog").dialog({title : "Sell " + item_name + "?"});
			$("#sell_dialog").dialog("open");
		}

		function refreshTotalBuy(){
			var price = $("#buy_itemprice").html();
			var qty = $("#buy_inputqty").attr("value");
			var total = parseInt(price) * parseInt(qty);
			$("#buy_itemtotal").html(total);
			$("#buy_item_qty").attr("value",qty);
			if(total > ${warrior.gold}){
				$("#buy_itemtotal").css("color","red");
			}else{
				$("#buy_itemtotal").css("color","#444444");
			}
		}

		function refreshTotalSell(item_qty){
			var price = $("#sell_itemprice").html();
			var qty = $("#sell_inputqty").attr("value");
			var total = parseInt(price) * parseInt(qty);
			$("#sell_itemtotal").html(total);
			$("#sell_item_qty").attr("value",qty);

			if(qty > item_qty){
				$("#sell_inputqty").css("color","red");
			}else{
				$("#sell_inputqty").css("color","#444444");
			}
		}

		function sellall(){
			$("#sell_inputqty").attr("value",$("#sell_max_qty").attr("value"));
		}
		</script>
		<g:form name="buyForm" method="get" controller="warrior" action="buy">
			<g:hiddenField name="buy_item_id"/>
			<g:hiddenField name="buy_item_qty"/>
			<div style="display:none;" id="buy_dialog" title="Buy">
				<div style="line-height: 1.5em;">
					<div id="buy_imgdiv" title="" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
						<img id="buy_itempic" style="padding-left:2px;padding-top:2px;" width="28" height="28" src=""/>
					</div>
					<label id="buy_itemname"></label>
					<span style="float:right;margin-left:5px;">
						<img width="15" height="15" src="/images/coins.png"/>
					</span>
					<span style="float:right;" id="buy_itemprice"></span>
					<br>
					Quantity
					<span style="float:right;">
						<input id="buy_inputqty" name="buy_inputqty" maxlength="3" style="border:0;text-align:right;" type="text" size="2" value="1"/>
					</span>
				</div>
				<div>
					<hr>
					<label style="margin-left:42px;">Total</label>
					<span style="float:right;margin-left:5px;">
						<img width="15" height="15" src="/images/coins.png"/>
					</span>
					<span style="float:right;" id="buy_itemtotal"></span>
				</div>
			</div>
		</g:form>
		<g:form name="sellForm" method="get" controller="warrior" action="sell">
			<g:hiddenField name="sell_item_id"/>
			<g:hiddenField name="sell_item_qty"/>
			<g:hiddenField name="sell_max_qty"/>
			<div style="display:none;" id="sell_dialog" title="Buy">
				<div style="line-height: 1.5em;">
					<div id="sell_imgdiv" title="" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
						<img id="sell_itempic" style="padding-left:2px;padding-top:2px;" width="28" height="28" src=""/>
					</div>
					<label id="sell_itemname"></label>
					<span style="float:right;margin-left:5px;">
						<img width="15" height="15" src="/images/coins.png"/>
					</span>
					<span style="float:right;" id="sell_itemprice"></span>
					<br>
					Quantity
					<span style="float:right;">
						<input id="sell_inputqty" name="sell_inputqty" maxlength="3" style="border:0;text-align:right;" type="text" size="2" value="1"/>
						<a href="#" style="color:blue;" onclick="javascript:sellall();">All</a>
					</span>
				</div>
				<div>
					<hr>
					<label style="margin-left:42px;">Total</label>
					<span style="float:right;margin-left:5px;">
						<img width="15" height="15" src="/images/coins.png"/>
					</span>
					<span style="float:right;" id="sell_itemtotal"></span>
				</div>
			</div>
		</g:form>
	</body>
</html>
