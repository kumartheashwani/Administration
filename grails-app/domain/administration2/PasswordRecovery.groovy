package administration2

class PasswordRecovery {
    String userID

    static constraints = {
	    userID(length:4..10,blank:false)

    }
}
