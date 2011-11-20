

<%@ page import="administration2.EmployeeInfo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employeeInfo.label', default: 'EmployeeInfo')}" />
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
            <g:hasErrors bean="${employeeInfoInstance}">
            <div class="errors">
                <g:renderErrors bean="${employeeInfoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fname"><g:message code="employeeInfo.fname.label" default="Fname" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: employeeInfoInstance, field: 'fname', 'errors')}">
                                    <g:textField name="fname" value="${employeeInfoInstance?.fname}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lname"><g:message code="employeeInfo.lname.label" default="Lname" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: employeeInfoInstance, field: 'lname', 'errors')}">
                                    <g:textField name="lname" value="${employeeInfoInstance?.lname}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="employeeInfo.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: employeeInfoInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${employeeInfoInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dob"><g:message code="employeeInfo.dob.label" default="Dob" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: employeeInfoInstance, field: 'dob', 'errors')}">
                                    <g:datePicker name="dob" precision="day" value="${employeeInfoInstance?.dob}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="designation"><g:message code="employeeInfo.designation.label" default="Designation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: employeeInfoInstance, field: 'designation', 'errors')}">
                                    <g:select name="designation" from="${employeeInfoInstance.constraints.designation.inList}" value="${employeeInfoInstance?.designation}" valueMessagePrefix="employeeInfo.designation"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tempAddress"><g:message code="employeeInfo.tempAddress.label" default="Temp Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: employeeInfoInstance, field: 'tempAddress', 'errors')}">
                                    <g:textField name="tempAddress" value="${employeeInfoInstance?.tempAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="permAddress"><g:message code="employeeInfo.permAddress.label" default="Perm Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: employeeInfoInstance, field: 'permAddress', 'errors')}">
                                    <g:textField name="permAddress" value="${employeeInfoInstance?.permAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="securityQues"><g:message code="employeeInfo.securityQues.label" default="Security Ques" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: employeeInfoInstance, field: 'securityQues', 'errors')}">
                                    <g:textField name="securityQues" value="${employeeInfoInstance?.securityQues}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="securityAns"><g:message code="employeeInfo.securityAns.label" default="Security Ans" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: employeeInfoInstance, field: 'securityAns', 'errors')}">
                                    <g:textField name="securityAns" value="${employeeInfoInstance?.securityAns}" />
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
