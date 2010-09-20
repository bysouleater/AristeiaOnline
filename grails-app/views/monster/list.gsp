
<%@ page import="com.ao.monster.Monster" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'monster.label', default: 'Monster')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'monster.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'monster.name.label', default: 'Name')}" />
                        
                            <th><g:message code="monster.stats.label" default="Stats" /></th>
                        
                            <g:sortableColumn property="exp" title="${message(code: 'monster.exp.label', default: 'Exp')}" />
                        
                            <g:sortableColumn property="gold" title="${message(code: 'monster.gold.label', default: 'Gold')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${monsterInstanceList}" status="i" var="monsterInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${monsterInstance.id}">${fieldValue(bean: monsterInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: monsterInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: monsterInstance, field: "stats")}</td>
                        
                            <td>${fieldValue(bean: monsterInstance, field: "exp")}</td>
                        
                            <td>${fieldValue(bean: monsterInstance, field: "gold")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${monsterInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
