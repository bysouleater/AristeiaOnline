
<%@ page import="com.ao.places.TrainingPlace" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'trainingPlace.label', default: 'TrainingPlace')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'trainingPlace.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'trainingPlace.name.label', default: 'Name')}" />
                        
                            <th><g:message code="trainingPlace.skills.label" default="Skills" /></th>
                        
                            <g:sortableColumn property="STArequired" title="${message(code: 'trainingPlace.STArequired.label', default: 'STA required')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${trainingPlaceInstanceList}" status="i" var="trainingPlaceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${trainingPlaceInstance.id}">${fieldValue(bean: trainingPlaceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: trainingPlaceInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: trainingPlaceInstance, field: "skills")}</td>
                        
                            <td>${fieldValue(bean: trainingPlaceInstance, field: "STArequired")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${trainingPlaceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
