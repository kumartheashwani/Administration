
<%@ page import="administration2.DeleteAccount" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'deleteAccount.label', default: 'DeleteAccount')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
	      <g:if test="${session.userID && session.designation=='Administrator'}">
	      <span class="menuButton"><a class="home" href="../../home.gsp"><g:message code="default.home.label"/></a></span>
	      <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
	      </g:if>
	      <g:else>
	      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
                            <td valign="top" class="name"><g:message code="deleteAccount.userID.label" default="User ID" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: deleteAccountInstance, field: "userID")}</td>
                            
                        </tr>
                    
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${deleteAccountInstance?.userID}" />
                    <span class="button"><g:actionSubmit class="edit" action="accept" value="Delete Account" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="list" value="Ignore Request" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
