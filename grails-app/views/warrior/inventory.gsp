<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Inventory</h4>
				<table style="margin-top:20px;margin-left:15px;" border="0" cellpadding="0" cellspacing="0">
					<g:each in="${warrior.inventory}" var="item" status="i">
						<g:if test="${i % 3 == 0}"><tr></g:if>
							<g:itemrow item="${item}"/>
						<g:if test="${i % 3 == 2}"></tr></g:if>
					</g:each>
					<g:if test="${warrior.inventory.size() < 30}">
						<g:each in="${warrior.inventory.size()..29}">
							<g:if test="${it % 3 == 0}"><tr></g:if>
								<g:itemrow item="${item}"/>
							<g:if test="${it % 3 == 2}"></tr></g:if>
						</g:each>
					</g:if>
				</table>
			
			<jqui:resources theme="aristeia"/>
			<script>
				$(document).ready(function() {
				    $("#confirm_equip").dialog({ autoOpen:false, resizable:false, position:[220,150],
					    buttons: { "Ok": function() { document.equipForm.submit();},
				    			   "Cancel": function() { $(this).dialog("close");} }
				    });
				    $("#confirm_use").dialog({ autoOpen:false, resizable:false, position:[220,150],
					    buttons: { "Ok": function() { document.useForm.submit();},
				    			   "Cancel": function() { $(this).dialog("close");} }
				    });
				});
				
				function confirmEquip(item_id, item_name, item_pic, item_stats, item_jobs){
					$("#equip_imgdiv").attr("title",item_name + " - Stats" + item_stats + " - Applicable Jobs " + item_jobs);
					$("#equip_itempic").attr("src",item_pic);
					$("#equip_item_id").attr("value",item_id);
					$("#equip_itemname").html("<b>" + item_name + "</b><br><b>Stats</b> " + item_stats + "<br><b>Applicable Jobs</b> " + item_jobs);
					$("#confirm_equip").dialog({title : "Equip " + item_name + "?"});
					$("#confirm_equip").dialog("open");
				}

				function confirmUse(item_id, item_name, item_pic, item_desc){
					$("#use_imgdiv").attr("title",item_name + " - " + item_desc);
					$("#use_itempic").attr("src",item_pic);
					$("#use_item_id").attr("value",item_id);
					$("#use_itemname").html("<b>" + item_name + "</b><br> " + item_desc);
					$("#confirm_use").dialog({title : "Use " + item_name + "?"});
					$("#confirm_use").dialog("open");
				}
			</script>
			<g:form name="equipForm" method="get" controller="warrior" action="equip">
				<g:hiddenField name="equip_item_id"/>
				<div style="display:none;" id="confirm_equip" title="Equip">
					<div style="line-height: 1.5em;">
						<div id="equip_imgdiv" title="" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
							<img id="equip_itempic" style="padding-left:2px;padding-top:2px;" width="28" height="28" src=""/>
						</div>
						<label id="equip_itemname"></label>
					</div>
				</div>
			</g:form>
			<g:form name="useForm" method="get" controller="warrior" action="use">
				<g:hiddenField name="use_item_id"/>
				<div style="display:none;" id="confirm_use" title="Use">
					<div style="line-height: 1.5em;">
						<div id="use_imgdiv" title="" style="float:left;margin-right:10px;margin-bottom:10px;background-image:url('/images/empty.png');width:32px;height:32px;">
							<img id="use_itempic" style="padding-left:2px;padding-top:2px;" width="28" height="28" src=""/>
						</div>
						<label id="use_itemname"></label>
					</div>
				</div>
			</g:form>
		</td>
	</body>
</html>
