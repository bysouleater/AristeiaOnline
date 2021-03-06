<g:applyLayout name="game">
	<td valign="top">
		<div id="content">
			<h4>Exploration</h4>
			<div style="font-size:14px;">You are now in <b>${warrior.actualLocation.name}</b></div>
			<table style="margin:15px 0px 20px 20px;">
				<tr>
					<td>
						<g:if test="${warrior.actualSTA >= 5}">
							<a class="buttonlink biglink" href="javascript:confirmExplore();" href="<g:createLink controller='warrior' action='explore'/>">
								<img style="float:left;margin-right:10px;" width="32" height="32" src="/images/search.png"/>
								<b>Search for items<br>and monsters</b> (5 STA)
							</a>
						</g:if>
						<g:else>
							<span class="buttonlink biglink disabled">
								<img style="float:left;margin-right:10px;" width="32" height="32" src="/images/search.png"/>
								<b>Search for items<br>and monsters</b> (5 STA)
							</span>
						</g:else>
					</td>
					<td>
						<g:if test="${warrior.actualSTA >= 5}">
							<a class="buttonlink biglink" href="<g:createLink controller='warrior' action='worldmap'/>">
								<img width="32" height="32" src="/images/compass.png"/>
								<b>Move to other map</b> (5 STA)
							</a>
						</g:if>
						<g:else>
							<span class="buttonlink biglink disabled">
								<img width="32" height="32" src="/images/compass.png"/>
								<b>Move to other map</b> (5 STA)
							</span>
						</g:else>
					</td>
				</tr>
			</table>
			
			<jqui:resources theme="aristeia"/>
			<script>
				$(document).ready(function() {
				    $("#explore_dialog").dialog({ autoOpen:false, resizable:false, position:[220,150],
					    buttons: { "Ok": function() { window.location.href="<g:createLink controller='warrior' action='explore'/>";},
				    			   "Cancel": function() { $(this).dialog("close");} }
				    });
				});
				
				function confirmExplore(){
					$("#explore_dialog").dialog("open");
				}
			</script>
			<div style="display:none;" id="explore_dialog" title="Search for items and monsters?">
				<p>Are you sure you want to search for items and monsters?</p>
			</div>
			<g:if test="${warrior.actualLocation.isCity()}">
				<div style="font-size:14px;">City places</div>
				<table style="margin:15px 0px 20px 20px;">
					<tr>
						<td>
							<a class="buttonlink biglink" href="<g:createLink controller='warrior' action='weaponstore'/>">
							<img width="32" height="32" src="/images/equip.png"/>
							<b>Weapons Store</b></a>
						</td>
						<td>
							<a class="buttonlink biglink" href="<g:createLink controller='warrior' action='armorstore'/>">
							<img width="32" height="32" src="/images/armors.png"/>
							<b>Armors Store</b></a>
						</td>
					</tr>
					<tr>
						<td>
							<a class="buttonlink biglink" href="<g:createLink controller='warrior' action='consumablestore'/>">
							<img width="32" height="32" src="/images/consumables.png"/>
							<b>Consumables Store</b></a>
						</td>
						<td>
							<a class="buttonlink biglink" href="<g:createLink controller='warrior' action='temple'/>">
							<img width="32" height="32" src="/images/consumables.png"/>
							<b>Temple</b></a>
						</td>
						
						<!--<td>
  							<a class="buttonlink biglink" href="<g:createLink controller='warrior' action='transports'/>">
							<img width="32" height="32" src="/images/consumables.png"/>
							<b>Transports</b></a>
						</td>-->
					</tr>
					<tr>
						<td>
							<!-- <a class="buttonlink biglink" href="<g:createLink controller='warrior' action='arena'/>">
							<img width="32" height="32" src="/images/consumables.png"/>
							<b>Arena</b></a>-->
						</td>
						<td></td>
					</tr>
				</table>
			</g:if>
		</div>
	</td>
</g:applyLayout>