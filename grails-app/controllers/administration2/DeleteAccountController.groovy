package administration2
import java.sql.*
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


class DeleteAccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/administration","root","");
    Statement smt=con.createStatement();
    static String answer1;

    ////////////////
    
        def accept={
	String userID=params.id
	//def employeeInfo=EmployeeInfo.get(params["employeeInfoId"])
	ResultSet rs=smt.executeQuery("select email from employee where ID='$userID'")
	String email;
	if(rs.next())
	{
		email=rs.getString("email")
	}
	
	//render (userID+email)
	
	String sub="Account Deletion"
	String msg="Your account has been deleted."
	smt.executeUpdate("delete from delete_account where userid='$userID'")
	smt.executeUpdate("delete from employee where ID='$userID'")
	sendEmail(email,sub,msg)
	redirect(action:"list")
    }
//
void sendEmail(String email,String sub,String msg){
   String SMTP_HOST_NAME = "smtp.gmail.com";
   int SMTP_HOST_PORT = 465;
   String SMTP_AUTH_USER = "aabbdefg@gmail.com";
   String SMTP_AUTH_PWD  = "iitropar";

       Properties props = new Properties();

       props.put("mail.transport.protocol", "smtps");
       props.put("mail.smtps.host", SMTP_HOST_NAME);
       props.put("mail.smtps.auth", "true");
       // props.put("mail.smtps.quitwait", "false");

       Session mailSession = Session.getDefaultInstance(props);
       mailSession.setDebug(true);
       Transport transport = mailSession.getTransport();

       MimeMessage message = new MimeMessage(mailSession);
       message.setSubject(sub);
       message.setContent(msg, "text/plain");

       message.addRecipient(Message.RecipientType.TO,
            new InternetAddress(email));

       transport.connect(SMTP_HOST_NAME, SMTP_HOST_PORT, SMTP_AUTH_USER, SMTP_AUTH_PWD);

       transport.sendMessage(message,
           message.getRecipients(Message.RecipientType.TO));
       transport.close();
}

    //////////////////
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [deleteAccountInstanceList: DeleteAccount.list(params), deleteAccountInstanceTotal: DeleteAccount.count()]
    }

    def create = {
        def deleteAccountInstance = new DeleteAccount()
        deleteAccountInstance.properties = params
        return [deleteAccountInstance: deleteAccountInstance]
    }
////////////////
    def security={
	String userID1=params.userID
	String pass=params.password
	ResultSet rs1=smt.executeQuery("select password from login where userID='$userID1'")
	if (rs1.next())
	{
	    ResultSet rs=smt.executeQuery("select security_ques,security_ans from employee where ID='$userID1'")
	    if(rs.next())
	    {
		def sec_ques=rs.getString("security_ques")
		def sec_ans=rs.getString("security_ans")	    
		answer1=sec_ans
		[secure:sec_ques,userIDme:userID1]
	    }
	}
	else
	{
	    flash.message="given userID does not exists"
	    redirect(action:"create")
	}
    }

    def saveTable={
	String userAnswer=params.answer
	String userID=params.userID
	if(userAnswer.equals(answer1))
	{
	      smt.executeUpdate("insert INTO delete_account (userid) VALUES ('$userID')")
              flash.message="A request has been sent for Account Deletion"  
	      redirect(uri:"/index.gsp")
	}
	else
	{
	    flash.message="Your answer is wrong"
	    redirect (action:"create")
	}
    }

////////////////
    def save = {
        def deleteAccountInstance = new DeleteAccount(params)
        if (deleteAccountInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'deleteAccount.label', default: 'DeleteAccount'), deleteAccountInstance.id])}"
            redirect(action: "show", id: deleteAccountInstance.id)
        }
        else {
            render(view: "create", model: [deleteAccountInstance: deleteAccountInstance])
        }
    }

    def show = {
        def deleteAccountInstance = DeleteAccount.get(params.id)
        if (!deleteAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deleteAccount.label', default: 'DeleteAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            [deleteAccountInstance: deleteAccountInstance]
        }
    }

    def edit = {
        def deleteAccountInstance = DeleteAccount.get(params.id)
        if (!deleteAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deleteAccount.label', default: 'DeleteAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [deleteAccountInstance: deleteAccountInstance]
        }
    }

    def update = {
        def deleteAccountInstance = DeleteAccount.get(params.id)
        if (deleteAccountInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (deleteAccountInstance.version > version) {
                    
                    deleteAccountInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'deleteAccount.label', default: 'DeleteAccount')] as Object[], "Another user has updated this DeleteAccount while you were editing")
                    render(view: "edit", model: [deleteAccountInstance: deleteAccountInstance])
                    return
                }
            }
            deleteAccountInstance.properties = params
            if (!deleteAccountInstance.hasErrors() && deleteAccountInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'deleteAccount.label', default: 'DeleteAccount'), deleteAccountInstance.id])}"
                redirect(action: "show", id: deleteAccountInstance.id)
            }
            else {
                render(view: "edit", model: [deleteAccountInstance: deleteAccountInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deleteAccount.label', default: 'DeleteAccount'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def deleteAccountInstance = DeleteAccount.get(params.id)
        if (deleteAccountInstance) {
            try {
                deleteAccountInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'deleteAccount.label', default: 'DeleteAccount'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'deleteAccount.label', default: 'DeleteAccount'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deleteAccount.label', default: 'DeleteAccount'), params.id])}"
            redirect(action: "list")
        }
    }
}
