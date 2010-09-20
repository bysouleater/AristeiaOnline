

<%@ page import="com.ao.monster.Encounter" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'encounter.label', default: 'Encounter')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${encounterInstance}">
            <div class="errors">
                <g:renderErrors bean="${encounterInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${encounterInstance?.id}" />
                <g:hiddenField name="version" value="${encounterInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="chance"><g:message code="encounter.chance.label" default="Chance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: encounterInstance, field: 'chance', 'errors')}">
                                    <g:textField name="chance" value="${fieldValue(bean: encounterInstance, field: 'chance')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="encounter.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: encounterInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" maxlength="200" value="${encounterInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="monsters"><g:message code="encounter.monsters.label" default="Monsters" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: encounterInstance, field: 'monsters', 'errors')}">
                                    <g:select name="monsters" from="${com.ao.monster.Monster.list()}" multiple="yes" optionKey="id" size="5" value="${encounterInstance?.monsters*.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
