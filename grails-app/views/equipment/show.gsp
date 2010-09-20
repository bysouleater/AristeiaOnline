
<%@ page import="com.ao.character.Equipment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'equipment.label', default: 'Equipment')}" />
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
                            <td valign="top" class="name"><g:message code="equipment.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: equipmentInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipment.head.label" default="Head" /></td>
                            
                            <td valign="top" class="value"><g:link controller="item" action="show" id="${equipmentInstance?.head?.id}">${equipmentInstance?.head?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipment.shoulder.label" default="Shoulder" /></td>
                            
                            <td valign="top" class="value"><g:link controller="item" action="show" id="${equipmentInstance?.shoulder?.id}">${equipmentInstance?.shoulder?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipment.body.label" default="Body" /></td>
                            
                            <td valign="top" class="value"><g:link controller="item" action="show" id="${equipmentInstance?.body?.id}">${equipmentInstance?.body?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipment.shield.label" default="Shield" /></td>
                            
                            <td valign="top" class="value"><g:link controller="item" action="show" id="${equipmentInstance?.shield?.id}">${equipmentInstance?.shield?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipment.foot.label" default="Foot" /></td>
                            
                            <td valign="top" class="value"><g:link controller="item" action="show" id="${equipmentInstance?.foot?.id}">${equipmentInstance?.foot?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipment.accesory1.label" default="Accesory1" /></td>
                            
                            <td valign="top" class="value"><g:link controller="item" action="show" id="${equipmentInstance?.accesory1?.id}">${equipmentInstance?.accesory1?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipment.accesory2.label" default="Accesory2" /></td>
                            
                            <td valign="top" class="value"><g:link controller="item" action="show" id="${equipmentInstance?.accesory2?.id}">${equipmentInstance?.accesory2?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipment.weapon.label" default="Weapon" /></td>
                            
                            <td valign="top" class="value"><g:link controller="item" action="show" id="${equipmentInstance?.weapon?.id}">${equipmentInstance?.weapon?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${equipmentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
