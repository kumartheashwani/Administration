package administration2

class EmployeeInfo {
    String fname
    String lname
    String email
    String tempAddress
    String permAddress
    Date dob
    String designation
//    String employeeID
    String securityQues
    String securityAns
    
    static optionals=["tempAddress"]
    
    static constraints = {
	fname(length:3..20,blank:false)
	lname(length:3..20,blank:false)
	email(email:true,blank:false)
	dob ()
	designation(inList:['Accountant','Administrator','Cashier','Manager','Officer'],blank:false)
	tempAddress()
	permAddress(blank:false)
	securityQues(blank:false)
	securityAns(blank:false)
    }
}
