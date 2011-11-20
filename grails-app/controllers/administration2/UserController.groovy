package administration2
import java.sql.*

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/administration","root","");
    Statement smt=con.createStatement();

    
  //A method to check login
 def loginuser=
 {
     
 }
 
 def logout={
     session.userID=null
     session.designation=null
     redirect(uri: "/index.gsp")
 }
     
// def admin={
  //   render "yes"
 //  params.max = Math.min(params.max ? params.int('max') : 10, 100)
  // [employeeInfoInstanceList: EmployeeInfo.list(params), employeeInfoInstanceTotal: EmployeeInfo.count()]
 //}

 
 def login={
 //Creates a connection with database using jdbc   
//    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/administration","root","");
 //Creates the staement
//    Statement smt=con.createStatement();
    String userName=params.userID
    String password=params.password
    
    ResultSet rs=smt.executeQuery("select password from login where userID='$userName'");
   

   while(rs.next())
    {
	
	if(rs.getString("password").equals(password))
	{
	   // String userID=rs.getString("")
	    ResultSet rst=smt.executeQuery("select designation from employee where ID='$userName'");
//	    flash.message="Login Succeed"
            session.userID=userName
	    
	    /////////////////
	    while(rst.next())
	    {
		String designation=rst.getString("designation");
		if(designation.equals("Administrator"))
		{
                   session.designation="Administrator"
  		   //redirect (controller:"employeeInfo", action: "admin")
		    redirect(uri:"/home.gsp")
		}
		else
		{
		    session.designation=designation;
		    redirect(uri:"/home2.gsp",params:[userID:userName])
		}
	    }
	    //////////////////
	//    redirect(controller:"employeeInfo" ,action: "admin")
//    	  	    redirect(uri:"/home.gsp")
//		    redirect(controller:"employeeInfo",action:"otheremployee",params:[userID:userName])}
	
		return
	}
    }
             flash.message='Please enter a valid username and password'
	     redirect(uri:"/index.gsp")   
	//render "Login Failed"
    }

    def index = {
        //redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create = {
        def userInstance = new User()
        userInstance.properties = params
        return [userInstance: userInstance]
    }

    def save = {
        def userInstance = new User(params)
        if (userInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
            redirect(action: "show", id: userInstance.id)
        }
        else {
            render(view: "create", model: [userInstance: userInstance])
        }
    }

    def show = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userInstance: userInstance]
        }
    }

    def edit = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    def update = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            try {
                userInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }
}
