<html>
	<head></head>
	<body>
		<iframe src="http://www.facebook.com/widgets/like.php?locale=es_ES&href=http://apps.facebook.com/aristeia_online"
			scrolling="no" frameborder="0" style="border:none; width:450px; height:80px;"></iframe>


	<div id="fb-root"></div>
	<script src="http://connect.facebook.net/en_US/all.js"></script>
	<script>
	alert("Empiezo");
  	FB.init({appId: '141786259185672', status: true, cookie: true, xfbml: true});
  	FB.Event.subscribe('auth.sessionChange', function(response) {
    	if (response.session) {
			alert("si estaba logueado");
      	// A user has logged in, and a new cookie has been saved
    	} else {
			alert("no estaba logueado");
			FB.login(function(response) {
  				if (response.session) {
    				// user successfully logged in
  				} else {
    				// user cancelled login
  				}	
			});

      	// The user has logged out, and the cookie has been cleared
    	}
  	});
	</script>
	</body>
</html>
