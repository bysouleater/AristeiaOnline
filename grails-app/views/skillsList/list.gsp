
<%@ page import="com.ao.SkillsList" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'skillsList.label', default: 'SkillsList')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'skillsList.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="aiming" title="${message(code: 'skillsList.aiming.label', default: 'Aiming')}" />
                        
                            <g:sortableColumn property="athletics" title="${message(code: 'skillsList.athletics.label', default: 'Athletics')}" />
                        
                            <g:sortableColumn property="climb" title="${message(code: 'skillsList.climb.label', default: 'Climb')}" />
                        
                            <g:sortableColumn property="concentration" title="${message(code: 'skillsList.concentration.label', default: 'Concentration')}" />
                        
                            <g:sortableColumn property="endurance" title="${message(code: 'skillsList.endurance.label', default: 'Endurance')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${skillsListInstanceList}" status="i" var="skillsListInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${skillsListInstance.id}">${fieldValue(bean: skillsListInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: skillsListInstance, field: "aiming")}</td>
                        
                            <td>${fieldValue(bean: skillsListInstance, field: "athletics")}</td>
                        
                            <td>${fieldValue(bean: skillsListInstance, field: "climb")}</td>
                        
                            <td>${fieldValue(bean: skillsListInstance, field: "concentration")}</td>
                        
                            <td>${fieldValue(bean: skillsListInstance, field: "endurance")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${skillsListInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
