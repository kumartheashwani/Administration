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

class PasswordRecoveryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/administration","root","");
    Statement smt=con.createStatement();
    static String answer1;
    def index = {
        redirect(action: "list", params: params)
    }

    def accept={
	String userID=params.id2
	//def employeeInfo=EmployeeInfo.get(params["employeeInfoId"])
	ResultSet rs=smt.executeQuery("select email from employee where ID='$userID'")
	String email;
	if(rs.next())
	{
		email=rs.getString("email")
	}
	
	//render (userID+email)
	char[] symbols=new char[36]
	for(int idx=0;idx<10;++idx)
	    {
		symbols[idx]=(char)(48+idx);
	    }
	for(int idx=10;idx<36;++idx)
		symbols[idx]=(char)(97+idx-10);
	
	char[] pwd=new char[10];
	Random random=new Random();
	for(int idx=0;idx<10;++idx)
	    {
		pwd[idx]=symbols[random.nextInt(symbols.length)];
	    }
	
	String sub="Password Recovery"
	String msg="Your password has been reset.\nYour new password is:\n"
	msg=msg+pwd
	smt.executeUpdate("delete from password_recovery where userid='$userID'")
	smt.executeUpdate("update login set password='$pwd' where userID='$userID'")
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

    
//

    
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [passwordRecoveryInstanceList: PasswordRecovery.list(params), passwordRecoveryInstanceTotal: PasswordRecovery.count()]
    }

    def create = {
        def passwordRecoveryInstance = new PasswordRecovery()
        passwordRecoveryInstance.properties = params
        return [passwordRecoveryInstance: passwordRecoveryInstance]
    }
    
    def security={
	String userID1=params.userID
	ResultSet rs=smt.executeQuery("select security_ques,security_ans from employee where ID='$userID1'")
	if(rs.next())
	{
	    def sec_ques=rs.getString("security_ques")
	    def sec_ans=rs.getString("security_ans")	    
	    answer1=sec_ans
	    [secure:sec_ques,userIDme:userID1]
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
	      smt.executeUpdate("insert INTO password_recovery (userid) VALUES ('$userID')")
              flash.message="Request has been sent for password recovery"  
	      redirect(uri:"/index.gsp")
	}
	else
	{
	    flash.message="Your answer is wrong"
	    redirect (action:"create")
	}
    }
    
    def save = {
        def passwordRecoveryInstance = new PasswordRecovery(params)
        if (passwordRecoveryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'passwordRecovery.label', default: 'PasswordRecovery'), passwordRecoveryInstance.id])}"
            redirect(action: "show", id: passwordRecoveryInstance.id)
        }
        else {
            render(view: "create", model: [passwordRecoveryInstance: passwordRecoveryInstance])
        }
    }

    def show = {
        def passwordRecoveryInstance = PasswordRecovery.get(params.id)
        if (!passwordRecoveryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'passwordRecovery.label', default: 'PasswordRecovery'), params.id])}"
            redirect(action: "list")
        }
        else {
            [passwordRecoveryInstance: passwordRecoveryInstance]
        }
    }

    def edit = {
        def passwordRecoveryInstance = PasswordRecovery.get(params.id)
        if (!passwordRecoveryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'passwordRecovery.label', default: 'PasswordRecovery'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [passwordRecoveryInstance: passwordRecoveryInstance]
        }
    }

    def update = {
        def passwordRecoveryInstance = PasswordRecovery.get(params.id)
        if (passwordRecoveryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (passwordRecoveryInstance.version > version) {
                    
                    passwordRecoveryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'passwordRecovery.label', default: 'PasswordRecovery')] as Object[], "Another user has updated this PasswordRecovery while you were editing")
                    render(view: "edit", model: [passwordRecoveryInstance: passwordRecoveryInstance])
                    return
                }
            }
            passwordRecoveryInstance.properties = params
            if (!passwordRecoveryInstance.hasErrors() && passwordRecoveryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'passwordRecovery.label', default: 'PasswordRecovery'), passwordRecoveryInstance.id])}"
                redirect(action: "show", id: passwordRecoveryInstance.id)
            }
            else {
                render(view: "edit", model: [passwordRecoveryInstance: passwordRecoveryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'passwordRecovery.label', default: 'PasswordRecovery'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def passwordRecoveryInstance = PasswordRecovery.get(params.id)
        if (passwordRecoveryInstance) {
            try {
                passwordRecoveryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'passwordRecovery.label', default: 'PasswordRecovery'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'passwordRecovery.label', default: 'PasswordRecovery'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'passwordRecovery.label', default: 'PasswordRecovery'), params.id])}"
            redirect(action: "list")
        }
    }
}
