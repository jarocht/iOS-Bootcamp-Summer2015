//
//  ViewController.swift
//  MyStaticTableDemo
//
//  Created by X Code User on 7/15/15.
//  Copyright (c) 2015 Tim Jaroch & Remo Hoeppli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    var myString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailLabel.text = self.myString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

