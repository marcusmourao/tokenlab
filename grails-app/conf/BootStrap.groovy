import br.ufscar.tokenlab.User
import br.ufscar.tokenlab.Role
import br.ufscar.tokenlab.UserRole

class BootStrap {

    def init = { servletContext ->


        if (!User.list()) {
            def admin = new User(
                    username: "admin",
                    password: "root",
                    enabled: true
            )

            admin.save flush: true

        }
    }
    def destroy = {
    }
}
