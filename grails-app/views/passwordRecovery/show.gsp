
<%@ page import="administration2.PasswordRecovery" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'passwordRecovery.label', default: 'PasswordRecovery')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
	      <g:if test="${session.userID && session.designation=='Administrator'}">
	      <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
	      </g:if>
	      <g:else>
	      </g:else>
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
                            <td valign="top" class="name"><g:message code="passwordRecovery.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: passwordRecoveryInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="passwordRecovery.userID.label" default="User ID" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: passwordRecoveryInstance, field: "userID")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id2" value="${passwordRecoveryInstance?.userID}" />
		    <g:hiddenField name="id" value="${passwordRecoveryInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" controller="passwordRecovery" action="accept" value="Accept" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
