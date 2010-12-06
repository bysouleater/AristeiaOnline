<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Welcome to <b>${warrior.actualLocation.name} Temple</b></h4>
				<div style="font-size:14px;">Here you can heal your wounds in exchange for money</div>
				
				<div style="margin:15px 0px 20px 20px;">				
					<g:if test="${warrior.canRecoverHP()}">
						<a style="width:400px;" class="buttonlink biglink" href="javascript:confirmHealHP();">
							<img height="30" width="130" style="float:left;margin-right:10px;" src="/images/default_tp.png"/>
							<b>Recover half HP</b> (Once every 5 minutes)
							<br><img width="15" height="15" src="/images/coins.png"/> 5
						</a>
					</g:if>
					<g:else>
						<span style="width:400px;" class="buttonlink biglink disabled">
							<img height="30" width="130" style="float:left;margin-right:10px;" src="/images/default_tp.png"/>
							<b>Recover half HP</b> (${warrior.HPtimeLeft()})
							<br><img width="15" height="15" src="/images/coins.png"/> 5
						</span>
					</g:else>
				</div>
				<div style="margin:15px 0px 20px 20px;">
					<g:if test="${warrior.canRecoverSTA()}">
						<a style="width:400px;" class="buttonlink biglink" href="javascript:confirmHealSTA();">
							<img height="30" width="130" style="float:left;margin-right:10px;" src="/images/default_tp.png"/>
							<b>Recover half STA</b> (Once every 6 hours)
							<br><img width="15" height="15" src="/images/coins.png"/> 10
						</a>
					</g:if>
					<g:else>
						<span style="width:400px;" class="buttonlink biglink disabled">
							<img height="30" width="130" style="float:left;margin-right:10px;" src="/images/default_tp.png"/>
							<b>Recover half STA</b> (${warrior.STAtimeLeft()})
							<br><img width="15" height="15" src="/images/coins.png"/> 10
						</span>
					</g:else>
				</div>
				<jqui:resources theme="aristeia"/>
				<script>
					$(document).ready(function() {
					    $("#confirm_hp").dialog({ autoOpen:false, resizable:false, position:[230,150], minWidth:280,
						    buttons: { "Ok": function() { document.HPForm.submit();},
					    			   "Cancel": function() { $(this).dialog("close");} }
					    });
					    $("#confirm_sta").dialog({ autoOpen:false, resizable:false, position:[230,150], minWidth:280,
						    buttons: { "Ok": function() { document.STAForm.submit();},
					    			   "Cancel": function() { $(this).dialog("close");} }
					    });
					});
					
					function confirmHealHP(){
						$("#confirm_hp").dialog("open");
					}

					function confirmHealSTA(){
						$("#confirm_sta").dialog("open");
					}
				</script>
				<g:form name="HPForm" method="get" controller="warrior" action="templeHP">
					<div style="display:none;" id="confirm_hp" title="Heal half HP?">
						<div style="line-height: 1.5em;">
							<label id="tp_name">Are you sure you want to recover half HP?</label>
						</div>
					</div>
				</g:form>
				<g:form name="STAForm" method="get" controller="warrior" action="templeSTA">
					<div style="display:none;" id="confirm_sta" title="Heal half STA?">
						<div style="line-height: 1.5em;">
							<label id="tp_name">Are you sure you want to recover half STA?</label>
						</div>
					</div>
				</g:form>
				<div style="text-align:right;margin-top:20px;font-size:12px;"><a href="<g:createLink controller='warrior' action='exploration'/>"><b>Back to exploration</b></a></div>
			</div>
		</td>
	</body>
</html>
