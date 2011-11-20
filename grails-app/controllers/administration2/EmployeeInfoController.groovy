package administration2
import java.sql.*
import java.util.*
import java.lang.*
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;





class EmployeeInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/administration","root","");
    Statement smt=con.createStatement();

    
def otheremployee={
	String userName=params.userID
	ResultSet rs=smt.executeQuery("select * from user_rights where userid='$userName'")
	HashMap rights=new HashMap()
//	ArrayList rights=new ArrayList()
//	while(rs.next())
//	{
//	    rights.add("right1",rs.getString("right1"))
//	    rights.add("right2",rs.getString("right2"))
//	    rights.add("right3",rs.getString("right3"))
//	    rights.add("right4",rs.getString("right4"))
//	    rights.add("right5",rs.getString("right5"))
//	    rights.add("right6",rs.getString("right6"))
//	}
//	HashMap rightsGranted=new HashMap()
//	HashMap rightsRequest=new HashMap()
//
//
//	for(int j=0;j<rights.size();j++)
//	{
//	    if(((int)rights.get(j))==0)
//		    rightsRequest.add()
//	}
//	[rightsList:rights,rightsInstanceTotal:rights.size()]
}    
    
    
 def admin={
   params.max = Math.min(params.max ? params.int('max') : 10, 100)
   [employeeInfoInstanceList: EmployeeInfo.list(params), employeeInfoInstanceTotal: EmployeeInfo.count()]
 }

 def accept={

//	def employeeInfo=EmployeeInfo.get(params["employeeInfoId"])
	String ID=params.id;
	ResultSet rs=smt.executeQuery("select * from employee_info where id='$ID'")
	String fname;
	String lname;
	String designation;
	Date dob;
	String email;
	String permAddress;
	String tempAddress;
	String security_ques;
	String security_ans;
	String employeeID;
	String password;
	while(rs.next())
	{
	    fname=rs.getString("fname")
	    lname=rs.getString("lname")
	    designation=rs.getString("designation")
	    dob=rs.getDate("dob")
	    email=rs.getString("email")
	    permAddress=rs.getString("perm_address")
	    tempAddress=rs.getString("temp_address")
	    security_ques=rs.getString("security_ques")
	    security_ans=rs.getString("security_ans")
	}
/// GENERATION OF EMPLOYEE ID AND PASSWORD
char[] symbols=new char[36]
char[] numbers=new char[10]
	for(int idx=0;idx<10;++idx)
	    {
		numbers[idx]=(char)(48+idx);
		symbols[idx]=(char)(48+idx);
	    }
	for(int idx=10;idx<36;++idx)
		symbols[idx]=(char)(97+idx-10);
	
char[] pwd=new char[10];
char[] empID=new char[10];
	Random random=new Random();
	for(int idx=0;idx<10;++idx)
	    {
		pwd[idx]=symbols[random.nextInt(symbols.length)];
		empID[idx]=numbers[random.nextInt(numbers.length)];
	    }
	
	smt.executeUpdate("insert into employee values ('$empID','$fname','$lname','$designation','$dob','$email','$permAddress','$tempAddress','$security_ques','$security_ans')")
	smt.executeUpdate("delete from employee_info where id='$ID'")
	smt.executeUpdate("insert into login values ('$empID','$pwd')")
	//render(fname+" "+dob+" "+pwd+" "+empID)
	String sub="Request "
	String msg="Your request for account creation for ABC Bank has been accepted.\nYour account details are:\n"
	msg=msg+"EmployeeID: "+empID+"\n"+"Password: "+pwd
	
	int []right=new int[5]
//
	rs=smt.executeQuery("select * from rights where designation='$designation' ")
	while(rs.next())
	{
	    right[0]=rs.getString("right1")
	    right[1]=rs.getString("right2")
	    right[2]=rs.getString("right3")
	    right[3]=rs.getString("right4")
	    right[4]=rs.getString("right5")
	    //right[5]=rs.getInt("right6")
	}
	
	smt.executeUpdate("insert into user_rights (right_a,right_b,right_c,right_d,right_e,userid) VALUES ('$right[0]','$right[1]','$right[2]','$right[3]','$right[4]','$empID') ")
		
	sendEmail(email,sub,msg);
	redirect(action:"list")
//	render "Ashwani"
    }
    
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

    
void apple(){
    render "Ashwani"
}
//    def register=
//    {
//    String userName=params.userID
//    String password=params.password
//    
//	
//    int rs=smt.executeUpdate("INSERT INTO login VALUES ('$userName','$password')");
//  //  redirect(action: "login")
//    render "Registration"
//    }
//
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [employeeInfoInstanceList: EmployeeInfo.list(params), employeeInfoInstanceTotal: EmployeeInfo.count()]
    }

    def create = {
        def employeeInfoInstance = new EmployeeInfo()
        employeeInfoInstance.properties = params
        return [employeeInfoInstance: employeeInfoInstance]
    }

    def save = {
        def employeeInfoInstance = new EmployeeInfo(params)
        if (employeeInfoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'employeeInfo.label', default: 'EmployeeInfo'), employeeInfoInstance.id])}"
            redirect(action: "show", id: employeeInfoInstance.id)
        }
        else {
            render(view: "create", model: [employeeInfoInstance: employeeInfoInstance])
        }
    }

    def show = {
        def employeeInfoInstance = EmployeeInfo.get(params.id)
        if (!employeeInfoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'employeeInfo.label', default: 'EmployeeInfo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [employeeInfoInstance: employeeInfoInstance]
        }
    }

    def edit = {
        def employeeInfoInstance = EmployeeInfo.get(params.id)
        if (!employeeInfoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'employeeInfo.label', default: 'EmployeeInfo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [employeeInfoInstance: employeeInfoInstance]
        }
    }

    def update = {
        def employeeInfoInstance = EmployeeInfo.get(params.id)
        if (employeeInfoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (employeeInfoInstance.version > version) {
                    
                    employeeInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'employeeInfo.label', default: 'EmployeeInfo')] as Object[], "Another user has updated this EmployeeInfo while you were editing")
                    render(view: "edit", model: [employeeInfoInstance: employeeInfoInstance])
                    return
                }
            }
            employeeInfoInstance.properties = params
            if (!employeeInfoInstance.hasErrors() && employeeInfoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'employeeInfo.label', default: 'EmployeeInfo'), employeeInfoInstance.id])}"
                redirect(action: "show", id: employeeInfoInstance.id)
            }
            else {
                render(view: "edit", model: [employeeInfoInstance: employeeInfoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'employeeInfo.label', default: 'EmployeeInfo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def employeeInfoInstance = EmployeeInfo.get(params.id)
        if (employeeInfoInstance) {
            try {
                employeeInfoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'employeeInfo.label', default: 'EmployeeInfo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'employeeInfo.label', default: 'EmployeeInfo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'employeeInfo.label', default: 'EmployeeInfo'), params.id])}"
            redirect(action: "list")
        }
    }
}
