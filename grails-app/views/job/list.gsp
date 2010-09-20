
<%@ page import="com.ao.character.Job" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'job.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'job.name.label', default: 'Name')}" />
                        
                            <th><g:message code="job.baseStats.label" default="Base Stats" /></th>
                        
                            <th><g:message code="job.levelUpStats.label" default="Level Up Stats" /></th>
                        
                            <g:sortableColumn property="maxLevel" title="${message(code: 'job.maxLevel.label', default: 'Max Level')}" />
                        
                            <g:sortableColumn property="maxSkillsValue" title="${message(code: 'job.maxSkillsValue.label', default: 'Max Skills Value')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${jobInstanceList}" status="i" var="jobInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${jobInstance.id}">${fieldValue(bean: jobInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: jobInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: jobInstance, field: "baseStats")}</td>
                        
                            <td>${fieldValue(bean: jobInstance, field: "levelUpStats")}</td>
                        
                            <td>${fieldValue(bean: jobInstance, field: "maxLevel")}</td>
                        
                            <td>${fieldValue(bean: jobInstance, field: "maxSkillsValue")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${jobInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
