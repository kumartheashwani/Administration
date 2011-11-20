
<%@ page import="administration2.EmployeeInfo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employeeInfo.label', default: 'EmployeeInfo')}" />
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
                            <td valign="top" class="name"><g:message code="employeeInfo.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: employeeInfoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="employeeInfo.fname.label" default="Fname" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: employeeInfoInstance, field: "fname")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="employeeInfo.lname.label" default="Lname" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: employeeInfoInstance, field: "lname")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="employeeInfo.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: employeeInfoInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="employeeInfo.dob.label" default="Dob" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${employeeInfoInstance?.dob}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="employeeInfo.designation.label" default="Designation" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: employeeInfoInstance, field: "designation")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="employeeInfo.tempAddress.label" default="Temp Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: employeeInfoInstance, field: "tempAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="employeeInfo.permAddress.label" default="Perm Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: employeeInfoInstance, field: "permAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="employeeInfo.securityQues.label" default="Security Ques" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: employeeInfoInstance, field: "securityQues")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="employeeInfo.securityAns.label" default="Security Ans" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: employeeInfoInstance, field: "securityAns")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${employeeInfoInstance?.id}" />
		    <g:if test="${session.userID}">
		      <g:if test="${session.designation=='Administrator'}">
		    <span class="button"><g:actionSubmit class="edit" controller="employeeInfo" action="accept" value="Accept" params="${[employeeInfoId:employeeInfoInstance.id]}"/></span>
		    <span class="button"><g:actionSubmit class="delete" controller="employeeInfo" action="delete" value="Deny" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		      </g:if>
		    </g:if>
		    <g:else>
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		    </g:else>
                </g:form>
            </div>
        </div>
    </body>
</html>
