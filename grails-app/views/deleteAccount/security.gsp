

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>login</title>
    </head>
    <body>
        <div class="pageBody">
            <h1>Welcome to ABC Bank</h1>

               <g:form action ="saveTable" >
		 <g:hiddenField name="userID" value="${userIDme}"/>
          	    <table border="0">
			  <tr>
			    <td><label>EmployeeID: </label></td>
			    <td>${userIDme}</td>
			  </tr>
			  <tr>
			    <td><label>Question: </label></td>
			    <td>${secure}</td>
			  </tr>
			  <tr>
			    <td> <label>Answer: </label></td>
			    <td><input type="text" name="answer"/></td>
			  </tr>
			  <tr>
			    <td></td>
			    <td> <input type="submit" value="submit"/></td>
			  </tr>
			</table>
	      </g:form>
            
	    <div class="dialog">
            </div>
            <div class="buttons">
            </div>
        </div>
    </body>
</html>
