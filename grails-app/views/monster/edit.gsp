

<%@ page import="com.ao.monster.Monster" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'monster.label', default: 'Monster')}" />
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
            <g:hasErrors bean="${monsterInstance}">
            <div class="errors">
                <g:renderErrors bean="${monsterInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${monsterInstance?.id}" />
                <g:hiddenField name="version" value="${monsterInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="monster.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: monsterInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="30" value="${monsterInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="stats"><g:message code="monster.stats.label" default="Stats" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: monsterInstance, field: 'stats', 'errors')}">
                                    <g:select name="stats.id" from="${com.ao.StatsList.list()}" optionKey="id" value="${monsterInstance?.stats?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="exp"><g:message code="monster.exp.label" default="Exp" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: monsterInstance, field: 'exp', 'errors')}">
                                    <g:textField name="exp" value="${fieldValue(bean: monsterInstance, field: 'exp')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gold"><g:message code="monster.gold.label" default="Gold" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: monsterInstance, field: 'gold', 'errors')}">
                                    <g:textField name="gold" value="${fieldValue(bean: monsterInstance, field: 'gold')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="loot"><g:message code="monster.loot.label" default="Loot" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: monsterInstance, field: 'loot', 'errors')}">
                                    <g:select name="loot" from="${com.ao.items.Item.list()}" multiple="yes" optionKey="id" size="5" value="${monsterInstance?.loot*.id}" />
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