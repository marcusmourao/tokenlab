package br.ufscar.tokenlab

class Contact {

    static belongsTo = [owner: User]

    String name
    Date birthday
    String email
    String address
    String phone


    static constraints = {
        name blank: false, nullable: false
        birthday nullable: false
        email blank: false, nullable: false
        address blank: false, nullable: false
        phone blank: false, nullable: false
    }
}
