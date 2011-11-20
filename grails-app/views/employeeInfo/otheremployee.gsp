

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>login</title>
    </head>
    <body>
        <div class="pageBody">
            <h1>Welcome to ABC Bank</h1>
     <g:if test="${session.userID}">
       <div class="buttons">
	 <table width=100% border="0">
	      <tr>
		<td>
		       Login as: ${session.userID}<br/>
		</td>
		<td>
		       <g:link controller="user" action="logout">logout</g:link>
		</td>
		
	      </tr>
	 </table>
       </div>
	    <table width=100% border="0">
	      <tr>
		<td width=50%>
		  :)
		</td>
		<td width=50%>
		  <g:if test="${session.designation=='Administrator'}">
		    <br/>
		    <br/>
		    <g:link controller ="employeeInfo" action="list">> New account requests</g:link>
		    <br/>
		    <br/>
		    <g:link controller ="passwordRecovery" action="list">> Password Recovery Requests</g:link>
		    <br/>
		    <br/>
		    <g:link controller ="deleteAccount" action="list">> Delete Account Requests</g:link>
		    <br/>
		    <br/>
		    <g:link controller ="userRights" action="list">> User Rights Requests</g:link>
		    <br/>
		    <br/>
		  </g:if>
		</td>
	      </tr>
	    </table>
       </g:if>

	    <div class="dialog">
            </div>
            <div class="buttons">
            </div>
        </div>
    </body>
</html>
