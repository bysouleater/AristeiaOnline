

<%@ page import="com.ao.places.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
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
            <g:hasErrors bean="${mapInstance}">
            <div class="errors">
                <g:renderErrors bean="${mapInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="map.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${mapInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="picture"><g:message code="map.picture.label" default="Picture" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapInstance, field: 'picture', 'errors')}">
                                    <g:textField name="picture" value="${mapInstance?.picture}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="map.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapInstance, field: 'city', 'errors')}">
                                    <g:checkBox name="city" value="${mapInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="posX"><g:message code="map.posX.label" default="Pos X" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapInstance, field: 'posX', 'errors')}">
                                    <g:textField name="posX" value="${fieldValue(bean: mapInstance, field: 'posX')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="posY"><g:message code="map.posY.label" default="Pos Y" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapInstance, field: 'posY', 'errors')}">
                                    <g:textField name="posY" value="${fieldValue(bean: mapInstance, field: 'posY')}" />
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