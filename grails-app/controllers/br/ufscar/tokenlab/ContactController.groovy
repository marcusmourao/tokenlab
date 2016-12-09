package br.ufscar.tokenlab

import grails.plugin.springsecurity.annotation.Secured

import java.security.Security

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('IS_AUTHENTICATED_FULLY')
class ContactController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        def user = springSecurityService.getCurrentUser()
        def list = Contact.findAllByOwner(user)
        respond list, model:[contactInstanceCount: list.size()]
    }

    def show(Contact contactInstance) {
        respond contactInstance
    }

    def create() {
        respond new Contact(params)
    }

    @Transactional
    def save(Contact contactInstance) {
        if (contactInstance == null) {
            notFound()
            return
        }

        String place = params.place
        String zipcode = params.zipcode
        String neighborhood = params.neighborhood
        String complement = params.complement
        String number = params.number
        String city = params.city
        String state = params.state

        contactInstance.address = place + ", " + number + " - " + neighborhood + " - " + complement + " - " + city + "-" + state + " - " + zipcode

        contactInstance.owner = springSecurityService.getCurrentUser()

        contactInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])
                redirect contactInstance
            }
            '*' { respond contactInstance, [status: CREATED] }
        }
    }

    def edit(Contact contactInstance) {
        respond contactInstance
    }

    @Transactional
    def update(Contact contactInstance) {
        if (contactInstance == null) {
            notFound()
            return
        }

        if (contactInstance.hasErrors()) {
            respond contactInstance.errors, view:'edit'
            return
        }

        contactInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Contact.label', default: 'Contact'), contactInstance.id])
                redirect contactInstance
            }
            '*'{ respond contactInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Contact contactInstance) {

        if (contactInstance == null) {
            notFound()
            return
        }

        contactInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Contact.label', default: 'Contact'), contactInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
