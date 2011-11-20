
<%@ page import="administration2.UserRightsAdmin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'userRightsAdmin.label', default: 'UserRightsAdmin')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'userRightsAdmin.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="userID" title="${message(code: 'userRightsAdmin.userID.label', default: 'User ID')}" />
                        
                            <g:sortableColumn property="right_A" title="${message(code: 'userRightsAdmin.right_A.label', default: 'Right A')}" />
                        
                            <g:sortableColumn property="right_B" title="${message(code: 'userRightsAdmin.right_B.label', default: 'Right B')}" />
                        
                            <g:sortableColumn property="right_C" title="${message(code: 'userRightsAdmin.right_C.label', default: 'Right C')}" />
                        
                            <g:sortableColumn property="right_D" title="${message(code: 'userRightsAdmin.right_D.label', default: 'Right D')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userRightsAdminInstanceList}" status="i" var="userRightsAdminInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${userRightsAdminInstance.id}">${fieldValue(bean: userRightsAdminInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: userRightsAdminInstance, field: "userID")}</td>
                        
                            <td>${fieldValue(bean: userRightsAdminInstance, field: "right_A")}</td>
                        
                            <td>${fieldValue(bean: userRightsAdminInstance, field: "right_B")}</td>
                        
                            <td>${fieldValue(bean: userRightsAdminInstance, field: "right_C")}</td>
                        
                            <td>${fieldValue(bean: userRightsAdminInstance, field: "right_D")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${userRightsAdminInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
