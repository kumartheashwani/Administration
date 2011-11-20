

<%@ page import="administration2.DeleteAccount" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'deleteAccount.label', default: 'DeleteAccount')}" />
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
            <g:hasErrors bean="${deleteAccountInstance}">
            <div class="errors">
                <g:renderErrors bean="${deleteAccountInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="security" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userID"><g:message code="deleteAccount.userID.label" default="User ID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deleteAccountInstance, field: 'userID', 'errors')}">
                                    <g:textField name="userID" value="${deleteAccountInstance?.userID}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="deleteAccount.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deleteAccountInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" value="${deleteAccountInstance?.password}" />
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
