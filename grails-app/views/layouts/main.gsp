<%@page import="org.codehaus.groovy.grails.commons.ConfigurationHolder"%>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <img style="margin-left:0.5em;" src="${resource(dir:'images',file:'logo_beta.png')}"/>
        <g:javascript library="jquery" plugin="jquery"/>
        <g:layoutBody />
        <div id="content" style="margin-top:10px;">
	        <table width="720">
	        	<tr><td colspan="2"><h3>Aristeia Online Social</h3></td></tr>
	        	<tr>
	        		<td>
	        			<iframe src="http://www.facebook.com/widgets/like.php?href=http://apps.facebook.com/${ConfigurationHolder.config.grails.facebook.appNamespace}" scrolling="no" frameborder="0" style="margin-left:10px;border:none; width:450px; height:80px;"></iframe>
	        		</td>
	        		<td valign="top" align="right" style="padding-top:10px;">
	        			<a href="http://www.twitter.com/AristeiaOnline"><img src="http://twitter-badges.s3.amazonaws.com/follow_me-a.png" alt="Follow AristeiaOnline on Twitter"/></a>
	        		</td>
	        	</tr>
	        </table>
		</div>
		
		<div id="fb-root"></div>
		<script src="http://connect.facebook.net/en_US/all.js"></script>
		<script>
		  FB.init({
		    appId  : '${ConfigurationHolder.config.grails.facebook.appId}',
		    status : true, // check login status
		    cookie : true, // enable cookies to allow the server to access the session
		    xfbml  : true  // parse XFBML
		  });
		</script>

		<script>
			$(document).ready(function() {
				FB.Canvas.setSize();
			});
		</script>
    </body>
</html>
