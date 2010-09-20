

<%@ page import="com.ao.places.TrainingPlace" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'trainingPlace.label', default: 'TrainingPlace')}" />
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
            <g:hasErrors bean="${trainingPlaceInstance}">
            <div class="errors">
                <g:renderErrors bean="${trainingPlaceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="trainingPlace.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingPlaceInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${trainingPlaceInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="skills"><g:message code="trainingPlace.skills.label" default="Skills" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingPlaceInstance, field: 'skills', 'errors')}">
                                    <g:select name="skills.id" from="${com.ao.SkillsList.list()}" optionKey="id" value="${trainingPlaceInstance?.skills?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="STArequired"><g:message code="trainingPlace.STArequired.label" default="STA required" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trainingPlaceInstance, field: 'STArequired', 'errors')}">
                                    <g:textField name="STArequired" value="${fieldValue(bean: trainingPlaceInstance, field: 'STArequired')}" />
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
