
<%@ page import="com.ao.character.JournalEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'journalEntry.label', default: 'JournalEntry')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'journalEntry.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="text" title="${message(code: 'journalEntry.text.label', default: 'Text')}" />
                        
                            <th><g:message code="journalEntry.encounter.label" default="Encounter" /></th>
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'journalEntry.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="type" title="${message(code: 'journalEntry.type.label', default: 'Type')}" />
                        
                            <th><g:message code="journalEntry.warrior.label" default="Warrior" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${journalEntryInstanceList}" status="i" var="journalEntryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${journalEntryInstance.id}">${fieldValue(bean: journalEntryInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: journalEntryInstance, field: "text")}</td>
                        
                            <td>${fieldValue(bean: journalEntryInstance, field: "encounter")}</td>
                        
                            <td><g:formatDate date="${journalEntryInstance.dateCreated}" /></td>
                        
                            <td>${fieldValue(bean: journalEntryInstance, field: "type")}</td>
                        
                            <td>${fieldValue(bean: journalEntryInstance, field: "warrior")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${journalEntryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
