<div id="content">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="500" valign="top" style="padding-right:10px;">
				<g:if test="${warriorlist}">
					<h3>My Warriors</h3>
					<g:if test="${flash.message}"><div class="message">${flash.message}</div></g:if>
					<g:each in="${warriorlist}" status="i" var="warrior">
   						<h5><b>${warrior.name}</b> - <label style="font-size:12px;">${warrior.job.name} Lvl ${warrior.level}</label> 
						<label style="float:right;font-size:12px;margin-left:20px;"><a title="Delete ${warrior.name}" href="javascript:confirmDelete(${warrior.id},'${warrior.name}');"><b>x</b></a></label>
						<label style="float:right;font-size:12px;"><b>Origin</b> ${warrior.origin.name}</label>						
						</h5>
						<g:warriorSmallSheet warrior="${warrior}">
   							<g:if test="${warrior.status == 'A'}">
								<td colspan="10" style="padding-top:35px;" align="center">
									<a href="<g:createLink controller='warrior' action='index' id='${warrior.id}' />"><button class="buttonlindo" style="width:225px;" type="button">Play with ${warrior.name}</button></a>
								</td>
							</g:if>
							<g:elseif test="${warrior.status == 'B'}">
								<td colspan="10" style="padding-top:35px;" align="center">
									<button class="buttonlindo" type="button" style="background-color:#BBBBBB;width:225px;">${warrior.name} was Banned</button>
								</td>
								<td></td>
							</g:elseif>
						</g:warriorSmallSheet>
						<g:if test="${i+1 < warriorlist.size()}"><hr></g:if>
					</g:each>
					<g:if test="${warriorlist.size() < 3}">
						<div style="text-align:right;margin-top:20px;font-size:14px;">or <g:link action="register" controller="warrior"><b>Create a new warrior</b></g:link></div>
					</g:if>
				</g:if>
				<g:else>
					<h3>Welcome to Aristeia Online</h3>
					<g:if test="${flash.message}"><div class="message">${flash.message}</div></g:if>
					<div style="text-align:center;">
						<img style="margin-bottom:20px;" src="/images/chapter1.png"/><br>
    					You don't have any warrior. <g:link action="register" controller="warrior">Create a new warrior</g:link> to start playing!
    				</div>
				</g:else>
			</td>
			<td width="200" valign="top">
				<h3>Top 10 Friend Warriors</h3>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:12px">
    				<g:if test="${top10fwar.size() > 0}">
	    				<g:each in="${top10fwar}" var="warrior" status="c">
	    					<g:if test="${c % 2 == 0}"><tr bgcolor="#eeeeff"></g:if><g:else><tr></g:else>
	    						<td align="right" style="padding:5px;">
	    							<b style="font-size:14px;">${warrior.name}</b><br>${warrior.job.name} Lvl ${warrior.level} Played by		
	    						</td>
	    						<td width="32" height="42">
	    							<fb:profile-pic uid="${warrior.owner_id}" width="32" height="32" linked="true" />
	    						</td>
	    					</tr>
						</g:each>
					</g:if>
					<g:else>
						<tr>
							<td style="font-size:14px;"><b>Woah!</b> Your friends aren't playing? Why don't you <a href="">invite some friends</a> to see what they got?</td>
						</tr>
					</g:else>
				</table>
				<g:if test="${top10fwar.size() > 0}">
					<div style="font-size:14px;margin-top:5px;text-align:right;">Total Friend Warriors <b>${totalfwar}</b></div>
					<div style="font-size:14px;margin-top:5px;text-align:right;"><g:link action="inviteFriends" controller="main">Invite more friends</g:link></div>
				</g:if>
			</td>
		</tr>
	</table>
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