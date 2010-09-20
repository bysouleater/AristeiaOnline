
<%@ page import="com.ao.Armor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <g:set var="entityName" value="${message(code: 'armor.label', default: 'Armor')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'armor.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'armor.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="icon" title="${message(code: 'armor.icon.label', default: 'Icon')}" />
                        
                            <g:sortableColumn property="price" title="${message(code: 'armor.price.label', default: 'Price')}" />
                        
                            <g:sortableColumn property="type" title="${message(code: 'armor.type.label', default: 'Type')}" />
                        
                            <th><g:message code="armor.stats.label" default="Stats" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${armorInstanceList}" status="i" var="armorInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${armorInstance.id}">${fieldValue(bean: armorInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: armorInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: armorInstance, field: "icon")}</td>
                        
                            <td>${fieldValue(bean: armorInstance, field: "price")}</td>
                        
                            <td>${fieldValue(bean: armorInstance, field: "type")}</td>
                        
                            <td><g:link controller="stats" action="show" id="${fieldValue(bean: armorInstance, field: 'stats.id')}">${fieldValue(bean: armorInstance, field: "stats.id")}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${armorInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
