package administration2

class User {
    String userID
    String password
    

    static constraints = {
	userID(length:4..10,blank:false)
	password(length:6..20,blank:false)
    }
}
