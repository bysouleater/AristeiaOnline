<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div class="logo">
			<img src="${resource(dir:'images',file:'shield.png')}" width="20" height="20"/>
			<div>Aristeia Online</div>
		</div>
        <div class="clear"></div>
        <g:layoutBody />
    </body>
</html>