
<%@ page import="administration2.DeleteAccount" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'deleteAccount.label', default: 'DeleteAccount')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton">
	      <g:if test="${session.userID && session.designation=='Administrator'}">
	      <a class="home" href="../home.gsp"><g:message code="default.home.label"/></a>
	      </g:if>
	      <g:else>
	      <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
	      </g:else>
	    </span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'deleteAccount.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="userID" title="${message(code: 'deleteAccount.userID.label', default: 'User ID')}" />
                        
                            <g:sortableColumn property="password" title="${message(code: 'deleteAccount.password.label', default: 'Password')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${deleteAccountInstanceList}" status="i" var="deleteAccountInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${deleteAccountInstance.id}">${fieldValue(bean: deleteAccountInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: deleteAccountInstance, field: "userID")}</td>
                        
                            <td>${fieldValue(bean: deleteAccountInstance, field: "password")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${deleteAccountInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
