

<%@ page import="com.ao.items.Weapon" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'weapon.label', default: 'Weapon')}" />
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
            <g:hasErrors bean="${weaponInstance}">
            <div class="errors">
                <g:renderErrors bean="${weaponInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${weaponInstance?.id}" />
                <g:hiddenField name="version" value="${weaponInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="weapon.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: weaponInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="50" value="${weaponInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="icon"><g:message code="weapon.icon.label" default="Icon" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: weaponInstance, field: 'icon', 'errors')}">
                                    <g:textField name="icon" value="${weaponInstance?.icon}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="price"><g:message code="weapon.price.label" default="Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: weaponInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${fieldValue(bean: weaponInstance, field: 'price')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="type"><g:message code="weapon.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: weaponInstance, field: 'type', 'errors')}">
                                    <g:select name="type" from="${weaponInstance.constraints.type.inList}" value="${fieldValue(bean: weaponInstance, field: 'type')}" valueMessagePrefix="weapon.type"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="handsQty"><g:message code="weapon.handsQty.label" default="Hands Qty" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: weaponInstance, field: 'handsQty', 'errors')}">
                                    <g:textField name="handsQty" value="${fieldValue(bean: weaponInstance, field: 'handsQty')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="stats"><g:message code="weapon.stats.label" default="Stats" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: weaponInstance, field: 'stats', 'errors')}">
                                    <g:select name="stats.id" from="${com.ao.StatsList.list()}" optionKey="id" value="${weaponInstance?.stats?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="consumable"><g:message code="weapon.consumable.label" default="Consumable" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: weaponInstance, field: 'consumable', 'errors')}">
                                    <g:checkBox name="consumable" value="${weaponInstance?.consumable}" />
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
