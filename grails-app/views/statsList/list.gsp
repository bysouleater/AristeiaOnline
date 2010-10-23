
<%@ page import="com.ao.StatsList" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'statsList.label', default: 'StatsList')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'statsList.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="AGI" title="${message(code: 'statsList.AGI.label', default: 'AGI')}" />
                        
                            <g:sortableColumn property="ARate" title="${message(code: 'statsList.ARate.label', default: 'AR ate')}" />
                        
                            <g:sortableColumn property="CON" title="${message(code: 'statsList.CON.label', default: 'CON')}" />
                        
                            <g:sortableColumn property="CRate" title="${message(code: 'statsList.CRate.label', default: 'CR ate')}" />
                        
                            <g:sortableColumn property="DEX" title="${message(code: 'statsList.DEX.label', default: 'DEX')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${statsListInstanceList}" status="i" var="statsListInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${statsListInstance.id}">${fieldValue(bean: statsListInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: statsListInstance, field: "AGI")}</td>
                        
                            <td>${fieldValue(bean: statsListInstance, field: "ARate")}</td>
                        
                            <td>${fieldValue(bean: statsListInstance, field: "CON")}</td>
                        
                            <td>${fieldValue(bean: statsListInstance, field: "CRate")}</td>
                        
                            <td>${fieldValue(bean: statsListInstance, field: "DEX")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${statsListInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
