<g:if test="${warriorlist}">
	<div id="content">
		<h3>My Warriors</h3>
  			<g:each in="${warriorlist}" status="i" var="warrior">
   			<h5>${warrior.name} - ${warrior.job.name} Lvl ${warrior.level} 
			<label style="float:right;font-size:12px;"><b>Origin</b> ${warrior.origin.name}</label></h5>
   			<g:warriorSheet warrior="${warrior}">
   				<g:if test="${warrior.status == 'A'}">
				<td colspan="10" style="padding-top:9px;" align="center">
					<a href="<g:createLink controller='warrior' action='index' id='${warrior.id}' />"><button class="buttonlindo" type="button">Play with ${warrior.name}</button></a>
				</td>
				<td colspan="2" align="right" valign="middle" style="padding-top:9px;">
					or <a href="javascript:confirmDelete(${warrior.id},'${warrior.name}');">Delete</a>
				</td>
				</g:if>
				<g:elseif test="${warrior.status == 'B'}">
					<td colspan="10" style="padding-top:9px;" align="center">
						<button class="buttonlindo" type="button" style="background-color:#BBBBBB;">${warrior.name} was Banned</button>
					</td>
					<td></td>
				</g:elseif>
			</g:warriorSheet>
			<g:if test="${i+1 < warriorlist.size()}"><hr></g:if>
		</g:each>
		<g:if test="${warriorlist.size() < 3}">
			<div style="text-align:right;margin-top:20px;">or <g:link action="register" controller="warrior"><b>Create a new warrior</b></g:link></div>
		</g:if>
		
		<div style="float:left;width:200px;">
    			<h4 style="text-align:left;">Top 10 Friends Warriors</h4>
    			<table width="200" border="0" cellpadding="0" cellspacing="0" style="font-size:12px">
    				<g:each in="${friends}" var="friend" status="c">
    					<g:if test="${friend.owner_id == me as Long}"><tr bgcolor="#FFFFCC"></g:if>
    					<g:elseif test="${c % 2 == 0}"><tr bgcolor="#eeeeff"></g:elseif><g:else><tr></g:else>
    						<td width="42" height="42" align="center" valign="middle">
    							<fb:profile-pic uid="${friend.owner_id}" width="32" height="32" linked="true"  />
    						</td>
    						<td height="42" align="left" valign="middle">
    							<b>${friend.name}</b><br>
								${friend.job.name} Lvl ${friend.level}	
    						</td>
    					</tr>
					</g:each>
				</table>
				<div style="font-size:12px;margin-top:5px;text-align:left;">Total Friends Playing: ${friendsqty}</div>
    		</div>
    		<div style="clear:both;"></div>
		
		
		
  		</div>
  		<jqui:resources theme="aristeia"/>
  		<script>
	  		$(document).ready(function() {
			    $("#delete_dialog").dialog({ autoOpen:false, resizable:false, position:[220,150],
				    buttons: { "Ok": function() { document.deleteForm.submit();},
			    			   "Cancel": function() { $(this).dialog("close");} }
			    });
			});
	  		
  			function confirmDelete(wid, wname){
  				$("#wname").html("<b>" + wname + "</b>");
  				$("#warrior_id").attr("value",wid);
  				$("#delete_dialog").dialog("open");
  			}
  		</script>
  		<g:form name="deleteForm" method="get" controller="warrior" action="deleteWarrior">
			<g:hiddenField name="warrior_id"/>
	  		<div style="display:none;" id="delete_dialog" title="Are you sure you want to delete warrior">
				<p>Are you sure you want to delete warrior <label id="wname"></label>?</p>
			</div>
		</g:form>
</g:if>
<g:else>
	<div id="content">
		<h3>Welcome to Aristeia Online</h3>
    	<div class="bigmsg" style="float:left;width:500px;">
    		<div><img style="margin-bottom:20px;" src="/images/front.gif"/><br>
    		You don't have any warrior. <g:link action="register" controller="warrior">Create a new warrior</g:link> to start playing!
    		</div>
    	</div>
    	<div style="float:left;width:200px;">
    			<h4 style="text-align:left;">Top 10 Friends Warriors</h4>
    			<table width="200" border="0" cellpadding="0" cellspacing="0" style="font-size:12px">
    				<g:each in="${friends}" var="friend" status="c">
    					<g:if test="${friends.owner_id == me}"><tr bgcolor="#FFFFCC"></g:if>
    					<g:elseif test="${c % 2 == 0}"><tr bgcolor="#eeeeff"></g:elseif><g:else><tr></g:else>
    						<td width="42" height="42" align="center" valign="middle">
    							<fb:profile-pic uid="${friend.owner_id}" width="32" height="32" linked="true"  />
    						</td>
    						<td height="42" align="left" valign="middle">
    							<b>${friend.name}</b><br>
								${friend.job.name} Lvl ${friend.level}	
    						</td>
    					</tr>
					</g:each>
				</table>
				<div style="font-size:12px;margin-top:5px;text-align:left;">Total Friends Playing: ${friendsqty}</div>
    		</div>
    		<div style="clear:both;"></div>
    </div>
</g:else>