

<%@ page import="com.ao.places.City" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'city.label', default: 'City')}" />
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
            <g:hasErrors bean="${cityInstance}">
            <div class="errors">
                <g:renderErrors bean="${cityInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="city.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cityInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="30" value="${cityInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stats"><g:message code="city.stats.label" default="Stats" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cityInstance, field: 'stats', 'errors')}">
                                    <g:select name="stats.id" from="${com.ao.StatsList.list()}" optionKey="id" value="${cityInstance?.stats?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="map"><g:message code="city.map.label" default="Map" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cityInstance, field: 'map', 'errors')}">
                                    <g:select name="map.id" from="${com.ao.places.Map.list()}" optionKey="id" value="${cityInstance?.map?.id}"  />
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
