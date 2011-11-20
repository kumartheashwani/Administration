

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
	      <tr >
		<td width="33%">
		       Logged in : ${session.userID}
		</td>
		<td width="34%">
		    Designation: ${session.designation}
		</td>
		<td width="33%">
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
		    <br/>
		    <br/>
		    <g:link controller ="userRights" action="my_rights">> Request for User Rights</g:link>
		    <br/>
		    <br/>
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
