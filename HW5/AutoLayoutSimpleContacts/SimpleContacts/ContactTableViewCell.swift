//
//  ContactTableViewCell.swift
//  SimpleContacts
//
//  Created by X Code User on 7/15/15.
//  Copyright (c) 2015 Tim Jaroch & Remo Hoeppli. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var ContactNameLabel: UILabel!  //Full Name Format: Firstname Lastname
    @IBOutlet weak var ContactEmailLabel: UILabel! //Email Addr Format: user@example.com
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContact(contact: Contact){
        self.ContactNameLabel.text! = contact.name
        self.ContactEmailLabel.text! = contact.email
    }

}
