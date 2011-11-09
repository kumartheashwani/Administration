package administration

class EmployeeDetails {

    String fName
    String lName
    int employeeID
    String designation
    Date dob
    String tempAddress
    String permanentAddress
    String email
    int phoneNo
    static optionals=["permanentAddress"]
    static constraints = {
      
    employeeID(maxLenth:10,blank:false)
    fName(maxLength:20,blank:false)
    lName(maxLength:20,blank:false)
    designation(inList:['Administrator','Cashier','Manager','Officer','Accountant'],blank:false)
    dob(nullable:false)
    tempAddress()
    permanentAddress()
    email(blank:false,email:true)
    phoneNo(maxLength:10,blank:false)
    
    }
}
