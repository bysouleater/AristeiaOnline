
<%@ page import="com.ao.items.Item" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'item.id.label', default: 'Id')}" />
                        
                            <th><g:message code="item.type.label" default="Type" /></th>
                        
                            <g:sortableColumn property="qty" title="${message(code: 'item.qty.label', default: 'Qty')}" />
                        
                            <g:sortableColumn property="lootChance" title="${message(code: 'item.lootChance.label', default: 'Loot Chance')}" />
                        
                            <g:sortableColumn property="playerPrice" title="${message(code: 'item.playerPrice.label', default: 'Player Price')}" />
                        
                            <g:sortableColumn property="upgrade" title="${message(code: 'item.upgrade.label', default: 'Upgrade')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${itemInstanceList}" status="i" var="itemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "type")}</td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "qty")}</td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "lootChance")}</td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "playerPrice")}</td>
                        
                            <td>${fieldValue(bean: itemInstance, field: "upgrade")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${itemInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
