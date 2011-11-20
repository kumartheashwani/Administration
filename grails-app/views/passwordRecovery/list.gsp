
<%@ page import="administration2.PasswordRecovery" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'passwordRecovery.label', default: 'PasswordRecovery')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'passwordRecovery.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="userID" title="${message(code: 'passwordRecovery.userID.label', default: 'User ID')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${passwordRecoveryInstanceList}" status="i" var="passwordRecoveryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${passwordRecoveryInstance.id}">${fieldValue(bean: passwordRecoveryInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: passwordRecoveryInstance, field: "userID")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${passwordRecoveryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
