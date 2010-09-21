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
			<div style="text-align:right;margin-top:20px;">or <g:link action="register" controller="warrior"><b>Create a new warrior</b></g:link></div>
		</g:if>
  		</div>
</g:if>
<g:else>
	<div id="content">
		<h3>Welcome to Aristeia Online</h3>
    	<div class="bigmsg">
    		<img style="margin-bottom:20px;" src="/images/front.gif"/><br>
    		<g:if test="${logged}">
    			You don't have any warrior. <g:link action="register" controller="warrior">Create a new warrior</g:link> to start playing!
    		</g:if>
    		<g:else>
    			You are not logged in to Facebook. Please log in to start playing.
    		</g:else>
    	</div>
    </div>
    <iframe src="http://www.facebook.com/widgets/like.php?href=http://apps.facebook.com/aristeia_online"
			scrolling="no" frameborder="0" style="margin-left:10px;margin-top:10px;border:none; width:450px; height:80px;"></iframe>
</g:else>