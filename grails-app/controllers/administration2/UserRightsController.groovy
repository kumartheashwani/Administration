package administration2
import java.sql.*

class UserRightsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/administration","root","");
    Statement smt=con.createStatement();

    def index = {
        redirect(action: "list", params: params)
    }
    
    def my_rights = {
	String userName=session.userID
//	render ("HI "+userName)
	ResultSet rs=smt.executeQuery("select * from user_rights_admin where userid='$userName' ")
	int no;
	while(rs.next())
	{
	    no=Integer.parseInt(rs.getString("id"))
	}
    
	redirect(controller:"userRightsAdmin",action: "show", id:no)
    }
    
    def accept={
	def para=UserRights.get(params["id"])
	String ID=para.id;
	//render (ID)
	
	String id_final;
	String userID;
	String right_A;
	String right_B;
	String right_C;
	String right_D;
	String right_E;
	
	ResultSet rs=smt.executeQuery("select * from user_rights where id='$ID'")
	while(rs.next())
	{
	    userID=rs.getString("userid")
	    right_A=rs.getString("right_a")
	    right_B=rs.getString("right_b")
	    right_C=rs.getString("right_c")
	    right_D=rs.getString("right_d")
	    right_E=rs.getString("right_e")
	}
	rs=smt.executeQuery("select id from user_rights_admin where id='$ID'")
	while(rs.next())
	{
	    id_final=rs.getString("id")
	}
	smt.executeUpdate("delete from user_rights_admin where userid='$userID'")
	smt.executeUpdate("insert into user_rights_admin values ($id_final,0,'$right_A','$right_B','$right_C','$right_D','$right_E','$userID')")
	smt.executeUpdate("delete from user_rights where id='$ID'")
	
	redirect (action:"list")
    }


    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userRightsInstanceList: UserRights.list(params), userRightsInstanceTotal: UserRights.count()]
    }

    def create = {
        def userRightsInstance = new UserRights()
        userRightsInstance.properties = params
        return [userRightsInstance: userRightsInstance]
    }

    def save = {
        def userRightsInstance = new UserRights(params)
        if (userRightsInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'userRights.label', default: 'UserRights'), userRightsInstance.id])}"
            redirect(action: "show", id: userRightsInstance.id)
        }
        else {
            render(view: "create", model: [userRightsInstance: userRightsInstance])
        }
    }

    def show = {
        def userRightsInstance = UserRights.get(params.id)
        if (!userRightsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRights.label', default: 'UserRights'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userRightsInstance: userRightsInstance]
        }
    }

    def edit = {
        def userRightsInstance = UserRights.get(params.id)
        if (!userRightsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRights.label', default: 'UserRights'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userRightsInstance: userRightsInstance]
        }
    }

    def update = {
        def userRightsInstance = UserRights.get(params.id)
        if (userRightsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userRightsInstance.version > version) {
                    
                    userRightsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'userRights.label', default: 'UserRights')] as Object[], "Another user has updated this UserRights while you were editing")
                    render(view: "edit", model: [userRightsInstance: userRightsInstance])
                    return
                }
            }
            userRightsInstance.properties = params
            if (!userRightsInstance.hasErrors() && userRightsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'userRights.label', default: 'UserRights'), userRightsInstance.id])}"
                redirect(action: "show", id: userRightsInstance.id)
            }
            else {
                render(view: "edit", model: [userRightsInstance: userRightsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRights.label', default: 'UserRights'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userRightsInstance = UserRights.get(params.id)
        if (userRightsInstance) {
            try {
                userRightsInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'userRights.label', default: 'UserRights'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'userRights.label', default: 'UserRights'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRights.label', default: 'UserRights'), params.id])}"
            redirect(action: "list")
        }
    }
}
