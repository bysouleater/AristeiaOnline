

<%@ page import="com.ao.character.JournalEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'journalEntry.label', default: 'JournalEntry')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${journalEntryInstance}">
            <div class="errors">
                <g:renderErrors bean="${journalEntryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="text"><g:message code="journalEntry.text.label" default="Text" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: journalEntryInstance, field: 'text', 'errors')}">
                                    <g:textArea name="text" cols="40" rows="5" value="${journalEntryInstance?.text}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="encounter"><g:message code="journalEntry.encounter.label" default="Encounter" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: journalEntryInstance, field: 'encounter', 'errors')}">
                                    <g:select name="encounter.id" from="${com.ao.monster.Encounter.list()}" optionKey="id" value="${journalEntryInstance?.encounter?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="journalEntry.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: journalEntryInstance, field: 'type', 'errors')}">
                                    <g:textField name="type" value="${fieldValue(bean: journalEntryInstance, field: 'type')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="warrior"><g:message code="journalEntry.warrior.label" default="Warrior" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: journalEntryInstance, field: 'warrior', 'errors')}">
                                    <g:select name="warrior.id" from="${com.ao.character.Warrior.list()}" optionKey="id" value="${journalEntryInstance?.warrior?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="won"><g:message code="journalEntry.won.label" default="Won" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: journalEntryInstance, field: 'won', 'errors')}">
                                    <g:checkBox name="won" value="${journalEntryInstance?.won}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
