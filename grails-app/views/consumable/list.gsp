
<%@ page import="com.ao.items.Consumable" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'consumable.label', default: 'Consumable')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'consumable.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'consumable.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="icon" title="${message(code: 'consumable.icon.label', default: 'Icon')}" />
                        
                            <g:sortableColumn property="price" title="${message(code: 'consumable.price.label', default: 'Price')}" />
                        
                            <th><g:message code="consumable.stats.label" default="Stats" /></th>
                        
                            <g:sortableColumn property="consumable" title="${message(code: 'consumable.consumable.label', default: 'Consumable')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${consumableInstanceList}" status="i" var="consumableInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${consumableInstance.id}">${fieldValue(bean: consumableInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: consumableInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: consumableInstance, field: "icon")}</td>
                        
                            <td>${fieldValue(bean: consumableInstance, field: "price")}</td>
                        
                            <td>${fieldValue(bean: consumableInstance, field: "stats")}</td>
                        
                            <td><g:formatBoolean boolean="${consumableInstance.consumable}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${consumableInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
