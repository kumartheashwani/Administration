

<%@ page import="administration2.UserRights" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'userRights.label', default: 'UserRights')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userRightsInstance}">
            <div class="errors">
                <g:renderErrors bean="${userRightsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userID"><g:message code="userRights.userID.label" default="User ID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userRightsInstance, field: 'userID', 'errors')}">
			<g:if test="${session.designation=='Administrator'}">
			      <g:textField name="userID" value="${userRightsInstance?.userID}" />
			</g:if>
			<g:else>
			      <g:textField name="userID" value="${session.userID}" />
			</g:else>
			
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="right_A"><g:message code="userRights.right_A.label" default="Right A" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userRightsInstance, field: 'right_A', 'errors')}">
                                    <g:textField name="right_A" value="${userRightsInstance?.right_A}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="right_B"><g:message code="userRights.right_B.label" default="Right B" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userRightsInstance, field: 'right_B', 'errors')}">
                                    <g:textField name="right_B" value="${userRightsInstance?.right_B}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="right_C"><g:message code="userRights.right_C.label" default="Right C" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userRightsInstance, field: 'right_C', 'errors')}">
                                    <g:textField name="right_C" value="${userRightsInstance?.right_C}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="right_D"><g:message code="userRights.right_D.label" default="Right D" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userRightsInstance, field: 'right_D', 'errors')}">
                                    <g:textField name="right_D" value="${userRightsInstance?.right_D}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="right_E"><g:message code="userRights.right_E.label" default="Right E" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userRightsInstance, field: 'right_E', 'errors')}">
                                    <g:textField name="right_E" value="${userRightsInstance?.right_E}" />
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
