
<%@ page import="com.ao.character.Equipment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'equipment.label', default: 'Equipment')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'equipment.id.label', default: 'Id')}" />
                        
                            <th><g:message code="equipment.head.label" default="Head" /></th>
                        
                            <th><g:message code="equipment.shoulder.label" default="Shoulder" /></th>
                        
                            <th><g:message code="equipment.body.label" default="Body" /></th>
                        
                            <th><g:message code="equipment.shield.label" default="Shield" /></th>
                        
                            <th><g:message code="equipment.foot.label" default="Foot" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${equipmentInstanceList}" status="i" var="equipmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${equipmentInstance.id}">${fieldValue(bean: equipmentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: equipmentInstance, field: "head")}</td>
                        
                            <td>${fieldValue(bean: equipmentInstance, field: "shoulder")}</td>
                        
                            <td>${fieldValue(bean: equipmentInstance, field: "body")}</td>
                        
                            <td>${fieldValue(bean: equipmentInstance, field: "shield")}</td>
                        
                            <td>${fieldValue(bean: equipmentInstance, field: "foot")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${equipmentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
