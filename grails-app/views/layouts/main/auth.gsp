<%@page import="org.codehaus.groovy.grails.commons.ConfigurationHolder"%>
<html>
	<head></head>
	<body>
		<script>
			parent.location.replace('https://graph.facebook.com/oauth/authorize?client_id=${ConfigurationHolder.config.grails.facebook.appId}&redirect_uri=http://apps.facebook.com/${ConfigurationHolder.config.grails.facebook.appNamespace}/');
		</script>
	</body>
</html>