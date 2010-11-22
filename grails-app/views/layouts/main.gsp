<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <img style="margin-left:0.5em;" src="${resource(dir:'images',file:'logo_alpha.png')}"/>
        <g:javascript library="jquery" plugin="jquery"/>
        <g:layoutBody />
        <table width="100%">
        	<tr>
        		<td width="450">
        			<iframe src="http://www.facebook.com/widgets/like.php?href=http://apps.facebook.com/aristeia_online"
		scrolling="no" frameborder="0" style="margin-left:10px;margin-top:10px;border:none; width:450px; height:80px;"></iframe>
        		</td>
        		<td valign="top" align="right" style="padding-top:10px;">
        			<a href="http://www.twitter.com/AristeiaOnline"><img src="http://twitter-badges.s3.amazonaws.com/follow_me-a.png" alt="Follow AristeiaOnline on Twitter"/></a>
        		</td>
        	</tr>
        </table>
        
		<div id="fb-root"></div>
		<script>
			window.fbAsyncInit = function() {
			  FB.init({appId: '141786259185672', status: true, cookie: true, xfbml: true});
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
