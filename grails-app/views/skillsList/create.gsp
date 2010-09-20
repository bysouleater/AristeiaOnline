

<%@ page import="com.ao.SkillsList" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'skillsList.label', default: 'SkillsList')}" />
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
            <g:hasErrors bean="${skillsListInstance}">
            <div class="errors">
                <g:renderErrors bean="${skillsListInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="aiming"><g:message code="skillsList.aiming.label" default="Aiming" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: skillsListInstance, field: 'aiming', 'errors')}">
                                    <g:textField name="aiming" value="${fieldValue(bean: skillsListInstance, field: 'aiming')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="athletics"><g:message code="skillsList.athletics.label" default="Athletics" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: skillsListInstance, field: 'athletics', 'errors')}">
                                    <g:textField name="athletics" value="${fieldValue(bean: skillsListInstance, field: 'athletics')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="climb"><g:message code="skillsList.climb.label" default="Climb" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: skillsListInstance, field: 'climb', 'errors')}">
                                    <g:textField name="climb" value="${fieldValue(bean: skillsListInstance, field: 'climb')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="concentration"><g:message code="skillsList.concentration.label" default="Concentration" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: skillsListInstance, field: 'concentration', 'errors')}">
                                    <g:textField name="concentration" value="${fieldValue(bean: skillsListInstance, field: 'concentration')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endurance"><g:message code="skillsList.endurance.label" default="Endurance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: skillsListInstance, field: 'endurance', 'errors')}">
                                    <g:textField name="endurance" value="${fieldValue(bean: skillsListInstance, field: 'endurance')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="escape_Artist"><g:message code="skillsList.escape_Artist.label" default="Escape Artist" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: skillsListInstance, field: 'escape_Artist', 'errors')}">
                                    <g:textField name="escape_Artist" value="${fieldValue(bean: skillsListInstance, field: 'escape_Artist')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stealth"><g:message code="skillsList.stealth.label" default="Stealth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: skillsListInstance, field: 'stealth', 'errors')}">
                                    <g:textField name="stealth" value="${fieldValue(bean: skillsListInstance, field: 'stealth')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="thievery"><g:message code="skillsList.thievery.label" default="Thievery" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: skillsListInstance, field: 'thievery', 'errors')}">
                                    <g:textField name="thievery" value="${fieldValue(bean: skillsListInstance, field: 'thievery')}" />
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
