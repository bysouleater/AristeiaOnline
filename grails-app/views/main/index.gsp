<g:if test="${warriorlist}">
	<div id="content">
		<h3>My Warriors</h3>
  			<g:each in="${warriorlist}" status="i" var="warrior">
   			<h5>${warrior.name} - ${warrior.job.name} Lvl ${warrior.level} 
			<label style="float:right;font-size:12px;"><b>Origin</b> ${warrior.origin.name}</label></h5>
   			<g:warriorSheet warrior="${warrior}">
				<td colspan="12" style="padding-top:9px;" align="center">
					<a href="<g:createLink controller='warrior' action='index' id='${warrior.id}' />"><button class="buttonlindo" type="button">Play with ${warrior.name}</button></a>
				</td>
			</g:warriorSheet>
			<g:if test="${i+1 < warriorlist.size()}"><hr></g:if>
		</g:each>
		<g:if test="${warriorlist.size() < 3}">
			<div style="text-align:right; font-size:12px;margin-top:20px;">or <g:link action="create" controller="warrior"><b>Create a new warrior</b></g:link></div>
		</g:if>
  		</div>
</g:if>
<g:else>
	<div id="content">
		<h3>Welcome to Aristeia Online</h3>
    	<div class="bigmsg">You don't have any warrior. <g:link action="create" controller="warrior">Create a new warrior</g:link> to start playing!</div>
    </div>
</g:else>