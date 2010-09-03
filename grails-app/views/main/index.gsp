<g:if test="${warriorlist}">
	<div id="content">
		<h3><span>My Warriors</span></h3>
  			<g:each in="${warriorlist}" status="i" var="warrior">
   			<h5>
				<span>${warrior.name} - ${warrior.job.name} Lvl ${warrior.level}</span>
				<span style="float:right;">Origin: ${warrior.origin.name}</span>
			</h5>
			<g:warriorSheet warrior="${warrior}">
				<td colspan="12" style="padding-top:9px;" align="center">
					<a style="text-decoration:none;" href="<g:createLink controller='warrior' action='index' id='${warrior.id}' />"><button type="button">Play with ${warrior.name}</button></a>
				</td>
			</g:warriorSheet>
			<g:if test="${i+1 < warriorlist.size()}"><hr></g:if>
		</g:each>
		<g:if test="${warriorlist.size() < 3}">
			<div style="text-align:right; font-size:12px;margin-top:20px;">or <g:link style="text-decoration:none;" action="create" controller="warrior">Create a new warrior</g:link></div>
		</g:if>
  		</div>
</g:if>
<g:else>
	<div id="content">
		<h3><span>Welcome to Aristeia Online</span></h3>
    		<div style="text-align:center;margin-top:50px;">You don't have any warrior. <g:link action="create" style="text-decoration:none;" controller="warrior">Create a new warrior</g:link> to start playing!</div>
    	</div>
</g:else>