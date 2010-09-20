

<%@ page import="com.ao.StatsList" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'statsList.label', default: 'StatsList')}" />
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
            <g:hasErrors bean="${statsListInstance}">
            <div class="errors">
                <g:renderErrors bean="${statsListInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="AGI"><g:message code="statsList.AGI.label" default="AGI" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'AGI', 'errors')}">
                                    <g:textField name="AGI" value="${fieldValue(bean: statsListInstance, field: 'AGI')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ARate"><g:message code="statsList.ARate.label" default="AR ate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'ARate', 'errors')}">
                                    <g:textField name="ARate" value="${fieldValue(bean: statsListInstance, field: 'ARate')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="CON"><g:message code="statsList.CON.label" default="CON" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'CON', 'errors')}">
                                    <g:textField name="CON" value="${fieldValue(bean: statsListInstance, field: 'CON')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="CRate"><g:message code="statsList.CRate.label" default="CR ate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'CRate', 'errors')}">
                                    <g:textField name="CRate" value="${fieldValue(bean: statsListInstance, field: 'CRate')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="DEX"><g:message code="statsList.DEX.label" default="DEX" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'DEX', 'errors')}">
                                    <g:textField name="DEX" value="${fieldValue(bean: statsListInstance, field: 'DEX')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="HP"><g:message code="statsList.HP.label" default="HP" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'HP', 'errors')}">
                                    <g:textField name="HP" value="${fieldValue(bean: statsListInstance, field: 'HP')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="HPP"><g:message code="statsList.HPP.label" default="HPP" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'HPP', 'errors')}">
                                    <g:textField name="HPP" value="${fieldValue(bean: statsListInstance, field: 'HPP')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="PAtk"><g:message code="statsList.PAtk.label" default="PA tk" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'PAtk', 'errors')}">
                                    <g:textField name="PAtk" value="${fieldValue(bean: statsListInstance, field: 'PAtk')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="PDef"><g:message code="statsList.PDef.label" default="PD ef" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'PDef', 'errors')}">
                                    <g:textField name="PDef" value="${fieldValue(bean: statsListInstance, field: 'PDef')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="STA"><g:message code="statsList.STA.label" default="STA" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'STA', 'errors')}">
                                    <g:textField name="STA" value="${fieldValue(bean: statsListInstance, field: 'STA')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="STAP"><g:message code="statsList.STAP.label" default="STAP" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'STAP', 'errors')}">
                                    <g:textField name="STAP" value="${fieldValue(bean: statsListInstance, field: 'STAP')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="STR"><g:message code="statsList.STR.label" default="STR" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'STR', 'errors')}">
                                    <g:textField name="STR" value="${fieldValue(bean: statsListInstance, field: 'STR')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="acc"><g:message code="statsList.acc.label" default="Acc" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'acc', 'errors')}">
                                    <g:textField name="acc" value="${fieldValue(bean: statsListInstance, field: 'acc')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="eva"><g:message code="statsList.eva.label" default="Eva" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'eva', 'errors')}">
                                    <g:textField name="eva" value="${fieldValue(bean: statsListInstance, field: 'eva')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="init"><g:message code="statsList.init.label" default="Init" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'init', 'errors')}">
                                    <g:textField name="init" value="${fieldValue(bean: statsListInstance, field: 'init')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="luck"><g:message code="statsList.luck.label" default="Luck" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'luck', 'errors')}">
                                    <g:textField name="luck" value="${fieldValue(bean: statsListInstance, field: 'luck')}" />
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
