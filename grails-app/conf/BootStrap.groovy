import br.ufscar.tokenlab.User
import br.ufscar.tokenlab.Role
import br.ufscar.tokenlab.UserRole

class BootStrap {

    def init = { servletContext ->

        if (!Role.list()) {
            new Role(authority: "ROLE_ADMIN").save flush: true
            new Role(authority: "ROLE_DEV").save flush: true

            log.debug "Roles: ok"
        }

        if (!User.list()) {
            def admin = new User(
                    username: "admin",
                    password: "root",
                    email: "marcusmmourao@gmail.com",
                    firstName: "Marcus",
                    lastName: "Mourão",
                    enabled: true
            )

            admin.save flush: true

            UserRole.create admin, Role.findByAuthority("ROLE_ADMIN"), true
            UserRole.create admin, Role.findByAuthority("ROLE_DEV"), true

            log.debug "Users: ok"
        }
    }
    def destroy = {
    }
}
