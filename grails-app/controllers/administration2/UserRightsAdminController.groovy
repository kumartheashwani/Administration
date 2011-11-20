package administration2

class UserRightsAdminController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userRightsAdminInstanceList: UserRightsAdmin.list(params), userRightsAdminInstanceTotal: UserRightsAdmin.count()]
    }

    def create = {
        def userRightsAdminInstance = new UserRightsAdmin()
        userRightsAdminInstance.properties = params
        return [userRightsAdminInstance: userRightsAdminInstance]
    }

    def save = {
        def userRightsAdminInstance = new UserRightsAdmin(params)
        if (userRightsAdminInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'userRightsAdmin.label', default: 'UserRightsAdmin'), userRightsAdminInstance.id])}"
            redirect(action: "show", id: userRightsAdminInstance.id)
        }
        else {
            render(view: "create", model: [userRightsAdminInstance: userRightsAdminInstance])
        }
    }

    def show = {
        def userRightsAdminInstance = UserRightsAdmin.get(params.id)
        if (!userRightsAdminInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRightsAdmin.label', default: 'UserRightsAdmin'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userRightsAdminInstance: userRightsAdminInstance]
        }
    }

    def edit = {
        def userRightsAdminInstance = UserRightsAdmin.get(params.id)
        if (!userRightsAdminInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRightsAdmin.label', default: 'UserRightsAdmin'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userRightsAdminInstance: userRightsAdminInstance]
        }
    }

    def update = {
        def userRightsAdminInstance = UserRightsAdmin.get(params.id)
        if (userRightsAdminInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userRightsAdminInstance.version > version) {
                    
                    userRightsAdminInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'userRightsAdmin.label', default: 'UserRightsAdmin')] as Object[], "Another user has updated this UserRightsAdmin while you were editing")
                    render(view: "edit", model: [userRightsAdminInstance: userRightsAdminInstance])
                    return
                }
            }
            userRightsAdminInstance.properties = params
            if (!userRightsAdminInstance.hasErrors() && userRightsAdminInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'userRightsAdmin.label', default: 'UserRightsAdmin'), userRightsAdminInstance.id])}"
                redirect(action: "show", id: userRightsAdminInstance.id)
            }
            else {
                render(view: "edit", model: [userRightsAdminInstance: userRightsAdminInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRightsAdmin.label', default: 'UserRightsAdmin'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userRightsAdminInstance = UserRightsAdmin.get(params.id)
        if (userRightsAdminInstance) {
            try {
                userRightsAdminInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'userRightsAdmin.label', default: 'UserRightsAdmin'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'userRightsAdmin.label', default: 'UserRightsAdmin'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRightsAdmin.label', default: 'UserRightsAdmin'), params.id])}"
            redirect(action: "list")
        }
    }
}
