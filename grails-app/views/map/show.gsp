
<%@ page import="com.ao.places.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
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
                            <td valign="top" class="name"><g:message code="map.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mapInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="map.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mapInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="map.picture.label" default="Picture" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mapInstance, field: "picture")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="map.weapons.label" default="Weapons" /></td>
                            
                            <td valign="top" class="value"><g:link controller="store" action="show" id="${mapInstance?.weapons?.id}">${mapInstance?.weapons?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="map.armors.label" default="Armors" /></td>
                            
                            <td valign="top" class="value"><g:link controller="store" action="show" id="${mapInstance?.armors?.id}">${mapInstance?.armors?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="map.consumables.label" default="Consumables" /></td>
                            
                            <td valign="top" class="value"><g:link controller="store" action="show" id="${mapInstance?.consumables?.id}">${mapInstance?.consumables?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="map.city.label" default="City" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${mapInstance?.city}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="map.encounters.label" default="Encounters" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${mapInstance.encounters}" var="e">
                                    <li><g:link controller="encounter" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="map.posX.label" default="Pos X" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mapInstance, field: "posX")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="map.posY.label" default="Pos Y" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mapInstance, field: "posY")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="map.trainingPlaces.label" default="Training Places" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${mapInstance.trainingPlaces}" var="t">
                                    <li><g:link controller="trainingPlace" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${mapInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
