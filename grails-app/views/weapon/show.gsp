
<%@ page import="com.ao.items.Weapon" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'weapon.label', default: 'Weapon')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="weapon.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: weaponInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="weapon.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: weaponInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="weapon.icon.label" default="Icon" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: weaponInstance, field: "icon")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="weapon.price.label" default="Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: weaponInstance, field: "price")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="weapon.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: weaponInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="weapon.handsQty.label" default="Hands Qty" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: weaponInstance, field: "handsQty")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="weapon.stats.label" default="Stats" /></td>
                            
                            <td valign="top" class="value"><g:link controller="statsList" action="show" id="${weaponInstance?.stats?.id}">${weaponInstance?.stats?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="weapon.consumable.label" default="Consumable" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${weaponInstance?.consumable}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${weaponInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
