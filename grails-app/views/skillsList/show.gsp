
<%@ page import="com.ao.SkillsList" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'skillsList.label', default: 'SkillsList')}" />
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
                            <td valign="top" class="name"><g:message code="skillsList.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: skillsListInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="skillsList.aiming.label" default="Aiming" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: skillsListInstance, field: "aiming")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="skillsList.athletics.label" default="Athletics" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: skillsListInstance, field: "athletics")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="skillsList.climb.label" default="Climb" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: skillsListInstance, field: "climb")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="skillsList.concentration.label" default="Concentration" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: skillsListInstance, field: "concentration")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="skillsList.endurance.label" default="Endurance" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: skillsListInstance, field: "endurance")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="skillsList.escape_Artist.label" default="Escape Artist" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: skillsListInstance, field: "escape_Artist")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="skillsList.stealth.label" default="Stealth" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: skillsListInstance, field: "stealth")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="skillsList.thievery.label" default="Thievery" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: skillsListInstance, field: "thievery")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${skillsListInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
