
<%@ page import="administration2.UserRights" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'userRights.label', default: 'UserRights')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
	      <g:if test="${session.userID && session.designation=='Administrator'}">
	      <span class="menuButton"><a class="home" href="../home.gsp"><g:message code="default.home.label"/></a></span>
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
                            <td valign="top" class="name"><g:message code="userRights.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userRightsInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="userRights.userID.label" default="User ID" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userRightsInstance, field: "userID")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="userRights.right_A.label" default="Right A" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userRightsInstance, field: "right_A")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="userRights.right_B.label" default="Right B" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userRightsInstance, field: "right_B")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="userRights.right_C.label" default="Right C" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userRightsInstance, field: "right_C")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="userRights.right_D.label" default="Right D" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userRightsInstance, field: "right_D")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="userRights.right_E.label" default="Right E" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userRightsInstance, field: "right_E")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${userRightsInstance?.id}" />
		    <g:if test="${session.userID}">
		      <g:if test="${session.designation=='Administrator'}">
			<span class="button"><g:actionSubmit class="edit" action="accept" value="Accept" params="${[id:userRightsInstance.id]}"/></span>
			<span class="button"><g:actionSubmit class="delete" action="deny" value="Deny" onclick="return confirm('Are you sure?')}');" /></span>
		      </g:if>
		      <g:else>
			<span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
			<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		      </g:else>
		    </g:if>
                </g:form>
            </div>
        </div>
    </body>
</html>
