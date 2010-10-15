<%=packageName ? "package ${packageName}\n\n" : ''%>
import javax.servlet.http.Cookie;
class ${className}Controller {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def auth(def request){
		def cookie = request.getCookie("admin_pass")
		if(!cookie || cookie != "BySouleater")
			throw new Exception("Cant access")
	}
	
	def login = {
		
	}
	
	def logged = {
		Cookie c = new Cookie("admin_pass", params.pass)
		c.path = "/"
		c.maxAge = 60*120
		response.addCookie(c)
	}
	
    def index = {
		auth(request)
        redirect(action: "list", params: params)
    }

    def list = {
		auth(request)
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [${propertyName}List: ${className}.list(params), ${propertyName}Total: ${className}.count()]
    }

    def create = {
		auth(request)
        def ${propertyName} = new ${className}()
        ${propertyName}.properties = params
        return [${propertyName}: ${propertyName}]
    }

    def save = {
		auth(request)
        def ${propertyName} = new ${className}(params)
        if (${propertyName}.save(flush: true)) {
            flash.message = "\${message(code: 'default.created.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])}"
            redirect(action: "show", id: ${propertyName}.id)
        }
        else {
            render(view: "create", model: [${propertyName}: ${propertyName}])
        }
    }

    def show = {
		auth(request)
        def ${propertyName} = ${className}.get(params.id)
        if (!${propertyName}) {
            flash.message = "\${message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
            redirect(action: "list")
        }
        else {
            [${propertyName}: ${propertyName}]
        }
    }

    def edit = {
		auth(request)
        def ${propertyName} = ${className}.get(params.id)
        if (!${propertyName}) {
            flash.message = "\${message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [${propertyName}: ${propertyName}]
        }
    }

    def update = {
		auth(request)
        def ${propertyName} = ${className}.get(params.id)
        if (${propertyName}) {
            if (params.version) {
                def version = params.version.toLong()
                if (${propertyName}.version > version) {
                    <% def lowerCaseName = grails.util.GrailsNameUtils.getPropertyName(className) %>
                    ${propertyName}.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: '${domainClass.propertyName}.label', default: '${className}')] as Object[], "Another user has updated this ${className} while you were editing")
                    render(view: "edit", model: [${propertyName}: ${propertyName}])
                    return
                }
            }
            ${propertyName}.properties = params
            if (!${propertyName}.hasErrors() && ${propertyName}.save(flush: true)) {
                flash.message = "\${message(code: 'default.updated.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])}"
                redirect(action: "show", id: ${propertyName}.id)
            }
            else {
                render(view: "edit", model: [${propertyName}: ${propertyName}])
            }
        }
        else {
            flash.message = "\${message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		auth(request)
        def ${propertyName} = ${className}.get(params.id)
        if (${propertyName}) {
            try {
                ${propertyName}.delete(flush: true)
                flash.message = "\${message(code: 'default.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "\${message(code: 'default.not.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "\${message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
            redirect(action: "list")
        }
    }
}
