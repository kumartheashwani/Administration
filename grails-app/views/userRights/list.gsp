
<%@ page import="administration2.UserRights" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'userRights.label', default: 'UserRights')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
	      <g:if test="${session.userID && session.designation=='Administrator'}">
	      <span class="menuButton"><a class="home" href="../home.gsp"><g:message code="default.home.label"/></a></span>
	      </g:if>
	      <g:else>
	      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
	      </g:else>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'userRights.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="userID" title="${message(code: 'userRights.userID.label', default: 'User ID')}" />
                        
                            <g:sortableColumn property="right_A" title="${message(code: 'userRights.right_A.label', default: 'Right A')}" />
                        
                            <g:sortableColumn property="right_B" title="${message(code: 'userRights.right_B.label', default: 'Right B')}" />
                        
                            <g:sortableColumn property="right_C" title="${message(code: 'userRights.right_C.label', default: 'Right C')}" />
                        
                            <g:sortableColumn property="right_D" title="${message(code: 'userRights.right_D.label', default: 'Right D')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userRightsInstanceList}" status="i" var="userRightsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${userRightsInstance.id}">${fieldValue(bean: userRightsInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: userRightsInstance, field: "userID")}</td>
                        
                            <td>${fieldValue(bean: userRightsInstance, field: "right_A")}</td>
                        
                            <td>${fieldValue(bean: userRightsInstance, field: "right_B")}</td>
                        
                            <td>${fieldValue(bean: userRightsInstance, field: "right_C")}</td>
                        
                            <td>${fieldValue(bean: userRightsInstance, field: "right_D")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${userRightsInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
