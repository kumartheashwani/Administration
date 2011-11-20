
<%@ page import="administration2.EmployeeInfo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employeeInfo.label', default: 'EmployeeInfo')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton">
	      <a class="home" href="../home.gsp"><g:message code="default.home.label"/></a>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'employeeInfo.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="fname" title="${message(code: 'employeeInfo.fname.label', default: 'Fname')}" />
                        
                            <g:sortableColumn property="lname" title="${message(code: 'employeeInfo.lname.label', default: 'Lname')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'employeeInfo.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="dob" title="${message(code: 'employeeInfo.dob.label', default: 'Dob')}" />
                        
                            <g:sortableColumn property="designation" title="${message(code: 'employeeInfo.designation.label', default: 'Designation')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${employeeInfoInstanceList}" status="i" var="employeeInfoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${employeeInfoInstance.id}">${fieldValue(bean: employeeInfoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: employeeInfoInstance, field: "fname")}</td>
                        
                            <td>${fieldValue(bean: employeeInfoInstance, field: "lname")}</td>
                        
                            <td>${fieldValue(bean: employeeInfoInstance, field: "email")}</td>
                        
                            <td><g:formatDate date="${employeeInfoInstance.dob}" /></td>
                        
                            <td>${fieldValue(bean: employeeInfoInstance, field: "designation")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${employeeInfoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
