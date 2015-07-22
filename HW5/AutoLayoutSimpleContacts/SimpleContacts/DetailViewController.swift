//
//  DetailViewController.swift
//  SimpleContacts
//
//  Created by X Code User on 7/15/15.
//  Copyright (c) 2015 Tim Jaroch & Remo Hoeppli. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ContactNameLabel: UILabel!
    var ContactNameLabelText: String!
    @IBOutlet weak var ContactEmailLabel: UILabel!
    var ContactEmailLabelText: String!
    @IBOutlet weak var ContactPhoneLabel: UILabel!
    var ContactPhoneLabelText: String!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        ContactNameLabel.text = self.ContactNameLabelText
        ContactEmailLabel.text = self.ContactEmailLabelText
        ContactPhoneLabel.text = self.ContactPhoneLabelText
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

