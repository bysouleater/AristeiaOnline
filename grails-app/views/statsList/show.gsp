
<%@ page import="com.ao.StatsList" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'statsList.label', default: 'StatsList')}" />
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
                            <td valign="top" class="name"><g:message code="statsList.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.AGI.label" default="AGI" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "AGI")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.ARate.label" default="AR ate" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "ARate")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.CON.label" default="CON" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "CON")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.CRate.label" default="CR ate" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "CRate")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.DEX.label" default="DEX" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "DEX")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.HP.label" default="HP" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "HP")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.HPP.label" default="HPP" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "HPP")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.PAtk.label" default="PA tk" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "PAtk")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.PDef.label" default="PD ef" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "PDef")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.STA.label" default="STA" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "STA")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.STAP.label" default="STAP" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "STAP")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.STR.label" default="STR" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "STR")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.acc.label" default="Acc" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "acc")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.eva.label" default="Eva" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "eva")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.init.label" default="Init" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "init")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="statsList.luck.label" default="Luck" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: statsListInstance, field: "luck")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${statsListInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
