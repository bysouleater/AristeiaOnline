

<%@ page import="com.ao.character.Equipment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'equipment.label', default: 'Equipment')}" />
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
            <g:hasErrors bean="${equipmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${equipmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="head"><g:message code="equipment.head.label" default="Head" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'head', 'errors')}">
                                    <g:select name="head.id" from="${com.ao.items.Item.list()}" optionKey="id" value="${equipmentInstance?.head?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="shoulder"><g:message code="equipment.shoulder.label" default="Shoulder" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'shoulder', 'errors')}">
                                    <g:select name="shoulder.id" from="${com.ao.items.Item.list()}" optionKey="id" value="${equipmentInstance?.shoulder?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="body"><g:message code="equipment.body.label" default="Body" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'body', 'errors')}">
                                    <g:select name="body.id" from="${com.ao.items.Item.list()}" optionKey="id" value="${equipmentInstance?.body?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="shield"><g:message code="equipment.shield.label" default="Shield" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'shield', 'errors')}">
                                    <g:select name="shield.id" from="${com.ao.items.Item.list()}" optionKey="id" value="${equipmentInstance?.shield?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="foot"><g:message code="equipment.foot.label" default="Foot" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'foot', 'errors')}">
                                    <g:select name="foot.id" from="${com.ao.items.Item.list()}" optionKey="id" value="${equipmentInstance?.foot?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accesory1"><g:message code="equipment.accesory1.label" default="Accesory1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'accesory1', 'errors')}">
                                    <g:select name="accesory1.id" from="${com.ao.items.Item.list()}" optionKey="id" value="${equipmentInstance?.accesory1?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accesory2"><g:message code="equipment.accesory2.label" default="Accesory2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'accesory2', 'errors')}">
                                    <g:select name="accesory2.id" from="${com.ao.items.Item.list()}" optionKey="id" value="${equipmentInstance?.accesory2?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="weapon"><g:message code="equipment.weapon.label" default="Weapon" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipmentInstance, field: 'weapon', 'errors')}">
                                    <g:select name="weapon.id" from="${com.ao.items.Item.list()}" optionKey="id" value="${equipmentInstance?.weapon?.id}" noSelection="['null': '']" />
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
