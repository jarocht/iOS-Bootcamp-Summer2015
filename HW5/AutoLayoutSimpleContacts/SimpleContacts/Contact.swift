//
//  Contact.swift
//  SimpleContacts
//
//  Created by X Code User on 7/15/15.
//  Copyright (c) 2015 Tim Jaroch & Remo Hoeppli. All rights reserved.
//

import Foundation

class Contact {
    var name : String
    var email: String
    var phone: String
    
    init(name: String, email: String, phone: String){
        self.name = name
        self.email = email
        self.phone = phone
    }
}