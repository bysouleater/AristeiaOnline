
<%@ page import="com.ao.items.Weapon" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'weapon.label', default: 'Weapon')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'weapon.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'weapon.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="icon" title="${message(code: 'weapon.icon.label', default: 'Icon')}" />
                        
                            <g:sortableColumn property="price" title="${message(code: 'weapon.price.label', default: 'Price')}" />
                        
                            <g:sortableColumn property="type" title="${message(code: 'weapon.type.label', default: 'Type')}" />
                        
                            <g:sortableColumn property="handsQty" title="${message(code: 'weapon.handsQty.label', default: 'Hands Qty')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${weaponInstanceList}" status="i" var="weaponInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${weaponInstance.id}">${fieldValue(bean: weaponInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: weaponInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: weaponInstance, field: "icon")}</td>
                        
                            <td>${fieldValue(bean: weaponInstance, field: "price")}</td>
                        
                            <td>${fieldValue(bean: weaponInstance, field: "type")}</td>
                        
                            <td>${fieldValue(bean: weaponInstance, field: "handsQty")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${weaponInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
