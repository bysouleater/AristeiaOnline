<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <!--<div class="logo">-->
			<img style="margin-left:0.5em;" src="${resource(dir:'images',file:'logo.png')}"/>
		<!--</div>-->
        <div class="clear"></div>
        <g:layoutBody />
    </body>
</html>
