

<%@ page import="com.ao.StatsList" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'statsList.label', default: 'StatsList')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
	<style>
	.shorttxt{width:40px;}
	</style>
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
                                    <label for="HP">HP</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'HP', 'errors')}">
                                    <g:textField class="shorttxt" name="HP" value="${fieldValue(bean: statsListInstance, field: 'HP')}" />
                                </td>
                            
                                <td valign="top" class="name">
                                    <label for="STR"><g:message code="statsList.STR.label" default="STR" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'STR', 'errors')}">
                                    <g:textField class="shorttxt" name="STR" value="${fieldValue(bean: statsListInstance, field: 'STR')}" />
                                </td>

				<td valign="top" class="name">
                                    <label for="PAtk">PAtk.</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'PAtk', 'errors')}">
                                    <g:textField class="shorttxt" name="PAtk" value="${fieldValue(bean: statsListInstance, field: 'PAtk')}" />
                                </td>
				
				<td valign="top" class="name">
                                    <label for="PDef">PDef.</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'PDef', 'errors')}">
                                    <g:textField class="shorttxt" name="PDef" value="${fieldValue(bean: statsListInstance, field: 'PDef')}" />
                                </td>                                
                            </tr>


			    <tr class="prop">
				<td valign="top" class="name">
                                    <label for="HPP">HP Perc.</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'HPP', 'errors')}">
                                    <g:textField class="shorttxt" name="HPP" value="${fieldValue(bean: statsListInstance, field: 'HPP')}" />
                                </td>
				
				<td valign="top" class="name">
                                    <label for="CON"><g:message code="statsList.CON.label" default="CON" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'CON', 'errors')}">
                                    <g:textField class="shorttxt" name="CON" value="${fieldValue(bean: statsListInstance, field: 'CON')}" />
                                </td>

				<td valign="top" class="name">
                                    <label for="eva"><g:message code="statsList.eva.label" default="Eva" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'eva', 'errors')}">
                                    <g:textField class="shorttxt" name="eva" value="${fieldValue(bean: statsListInstance, field: 'eva')}" />
                                </td>

				<td valign="top" class="name">
                                    <label for="acc"><g:message code="statsList.acc.label" default="Acc" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'acc', 'errors')}">
                                    <g:textField class="shorttxt" name="acc" value="${fieldValue(bean: statsListInstance, field: 'acc')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
				<td valign="top" class="name">
                                    <label for="STA"><g:message code="statsList.STA.label" default="STA" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'STA', 'errors')}">
                                    <g:textField class="shorttxt" name="STA" value="${fieldValue(bean: statsListInstance, field: 'STA')}" />
                                </td>

				<td valign="top" class="name">
                                    <label for="AGI"><g:message code="statsList.AGI.label" default="AGI" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'AGI', 'errors')}">
                                    <g:textField class="shorttxt" name="AGI" value="${fieldValue(bean: statsListInstance, field: 'AGI')}" />
                                </td>

				<td valign="top" class="name">
                                    <label for="ARate">ARate</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'ARate', 'errors')}">
                                    <g:textField class="shorttxt" name="ARate" value="${fieldValue(bean: statsListInstance, field: 'ARate')}" />
                                </td>

                                <td valign="top" class="name">
                                    <label for="CRate">CRate</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'CRate', 'errors')}">
                                    <g:textField class="shorttxt" name="CRate" value="${fieldValue(bean: statsListInstance, field: 'CRate')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
				 <td valign="top" class="name">
                                    <label for="STAP">STA Perc.</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'STAP', 'errors')}">
                                    <g:textField class="shorttxt" name="STAP" value="${fieldValue(bean: statsListInstance, field: 'STAP')}" />
                                </td>

				<td valign="top" class="name">
                                    <label for="DEX"><g:message code="statsList.DEX.label" default="DEX" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'DEX', 'errors')}">
                                    <g:textField class="shorttxt" name="DEX" value="${fieldValue(bean: statsListInstance, field: 'DEX')}" />
                                </td>

                                <td valign="top" class="name">
                                    <label for="luck"><g:message code="statsList.luck.label" default="Luck" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'luck', 'errors')}">
                                    <g:textField class="shorttxt" name="luck" value="${fieldValue(bean: statsListInstance, field: 'luck')}" />
                                </td>

				<td valign="top" class="name">
                                    <label for="init"><g:message code="statsList.init.label" default="Init" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statsListInstance, field: 'init', 'errors')}">
                                    <g:textField class="shorttxt" name="init" value="${fieldValue(bean: statsListInstance, field: 'init')}" />
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
