<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div style="height:26px;margin:0 0 0 0.5em;
			position:relative;z-index:2;border-color:#AAAAAA -moz-use-text-color #AAAAAA #AAAAAA;
			border-style:solid none none solid;border-width:1px medium 1px 1px;background-color:#627AAD">
		<img style="float:left;padding-top:3px;padding-left:3px;" src="${resource(dir:'images',file:'shield.png')}" alt="Grails" border="0" width="20" height="20" />
		<div style="float:left;font-weight:bold;padding-top:3px;margin-left:3px;color:#FFFFFF">Aristeia Online</div></div>
        <div class="clear"></div>
        <g:layoutBody />
    </body>
</html>