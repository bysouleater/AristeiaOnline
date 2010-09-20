

<%@ page import="com.ao.Armor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'armor.label', default: 'Armor')}" />
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
            <g:hasErrors bean="${armorInstance}">
            <div class="errors">
                <g:renderErrors bean="${armorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="armor.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: armorInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="50" value="${armorInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="icon"><g:message code="armor.icon.label" default="Icon" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: armorInstance, field: 'icon', 'errors')}">
                                    <g:textField name="icon" value="${armorInstance?.icon}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price"><g:message code="armor.price.label" default="Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: armorInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${fieldValue(bean: armorInstance, field: 'price')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="armor.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: armorInstance, field: 'type', 'errors')}">
                                    <g:select name="type" from="${armorInstance.constraints.type.inList}" value="${fieldValue(bean: armorInstance, field: 'type')}" valueMessagePrefix="armor.type"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stats"><g:message code="armor.stats.label" default="Stats" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: armorInstance, field: 'stats', 'errors')}">
                                    <g:select name="stats.id" from="${com.ao.StatsList.list()}" optionKey="id" value="${armorInstance?.stats?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="consumable"><g:message code="armor.consumable.label" default="Consumable" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: armorInstance, field: 'consumable', 'errors')}">
                                    <g:checkBox name="consumable" value="${armorInstance?.consumable}" />
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
