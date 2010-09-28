<html>
	<head>
		<meta name="layout" content="game"></meta>
	</head>
	<body>
		<td valign="top">
			<div id="content">
				<h4>Journal</h4>
				<ul style="font-size:12px;list-style-type:none;">
					<g:each in="${journal}"  var="je">
						<g:if test="${je.type == 0}">
							<li><label style="color:#555555"><g:dateFromNow date="${je.dateCreated}"/>.</label> <i>${je.text}</i></li>
						</g:if>
						<g:if test="${je.type == 1}">
							<li><label style="color:#555555"><g:dateFromNow date="${je.dateCreated}"/>.</label> <i>While exploring you encountered ${je.fight.encounter.description}. You <b><g:if test="${je.fight.won}">won</g:if><g:else>lost</g:else></b> the fight. <b><g:link controller="warrior" action="fights" id="${je.fight.id}">View fight details</g:link></b>. 
							<br>Gained <b>${je.fight.encounter.totalExp()}</b> EXP. Found <b>${je.fight.encounter.totalGold()}</b> <img width="15" height="15" src="/images/coins.png"/>.</i></li>
						</g:if>
					</g:each>
				</ul>
				<div class="paginator"><g:paginate total="${warrior.journal.size()}" action="index" controller="warrior" id="${warrior.id}" max="10" maxsteps="5" offset="0"/></div>
			</div>
		</td>
		<g:javascript library="jquery" plugin="jquery"/>
		<div id="fb-root"></div>
		<script>
			window.fbAsyncInit = function() {
			  FB.init({appId: 'your app id', status: true, cookie: true,
			           xfbml: true});
			};
			(function() {
			  var e = document.createElement('script'); e.async = true;
			  e.src = document.location.protocol +
			    '//connect.facebook.net/en_US/all.js';
			  document.getElementById('fb-root').appendChild(e);
			}());

			$(document).ready(function() {
				FB.Canvas.setSize();
			});
		</script>
	</body>
</html>
