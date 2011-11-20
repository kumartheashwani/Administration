

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>login</title>
    </head>
    <body>
        <div class="pageBody">
            <h1>Welcome to ABC Bank</h1>
       <div class="buttons">
	 <table width=100% border="0">
	   <g:if test="${session.userID}">
	      <tr>
		<td>
		    <span class="menuButton">Login as: ${session.userID}</span>
		</td>
		<td>
		    <span class="menuButton"><g:link controller="user" action="logout">logout</g:link></span>
		</td>
		
	      </tr>
	   </g:if>
	 </table>
       </div>
	    <table width=100% border="0">
	      <tr>
		<td width=50%>
		    <br/>
		    <br/>
		    <g:link controller ="employeeInfo" action="create">> Request for New account </g:link>
		    <br/>
		    <br/>
		    <g:link controller ="passwordRecovery" action="create">> Request for Password Recovery </g:link>
		    <br/>
		    <br/>
		    <g:link controller ="deleteAccount" action="create">> Request for Account Deletion </g:link>
		    <br/>
		    <br/>
		</td>
		<td width=50%>
	       <g:if test="${session.userID}">
	       </g:if>
		<g:else>
		      <g:form controller="user" action ="login" method="post">
			<table border="0">
			  <tr>
			    <td><label>Name: </label></td>
			    <td><input type="text" name="userID"/></td>
			  </tr>
			  <tr>
			    <td> <label>Password: </label></td>
			    <td><input type="password" name="password"/></td>
			  </tr>
			  <tr>
			    <td></td>
			    <td> <input type="submit" value="submit"/></td>
			  </tr>
			</table>
			
		      </g:form>
	      </g:else> 
		</td>
	      </tr>
	    </table>
	    <g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
            </g:if>

	    <div class="dialog">
            </div>
            <div class="buttons">
            </div>
        </div>
    </body>
</html>
