package administration2

class UserRightsAdmin {
    String userID
    String Right_A
    String Right_B
    String Right_C
    String Right_D
    String Right_E

    static constraints = {
	userID(blank:false)
	Right_A(inList:['Yes','No'])
	Right_B(inList:['Yes','No'])
	Right_C(inList:['Yes','No'])
	Right_D(inList:['Yes','No'])
	Right_E(inList:['Yes','No'])
    }
}
