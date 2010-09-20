

<%@ page import="com.ao.items.ItemType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'itemType.label', default: 'ItemType')}" />
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
            <g:hasErrors bean="${itemTypeInstance}">
            <div class="errors">
                <g:renderErrors bean="${itemTypeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="itemType.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: itemTypeInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="50" value="${itemTypeInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="icon"><g:message code="itemType.icon.label" default="Icon" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: itemTypeInstance, field: 'icon', 'errors')}">
                                    <g:textField name="icon" value="${itemTypeInstance?.icon}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price"><g:message code="itemType.price.label" default="Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: itemTypeInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${fieldValue(bean: itemTypeInstance, field: 'price')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="consumable"><g:message code="itemType.consumable.label" default="Consumable" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: itemTypeInstance, field: 'consumable', 'errors')}">
                                    <g:checkBox name="consumable" value="${itemTypeInstance?.consumable}" />
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
