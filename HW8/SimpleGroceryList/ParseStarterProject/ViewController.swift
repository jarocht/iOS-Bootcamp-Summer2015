//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
    }

    func insertNewObject(sender: AnyObject) {
        //Push data to Parse.com
        if (textField!.text != ""){
            let groceryObj = PFObject(className: "GroceryItems")
            groceryObj["name"] = textField!.text
            groceryObj["selected"] = false
            groceryObj.saveInBackgroundWithBlock{ (sucess: Bool, error: NSError?) in
                println("Some Sucess")
            }
        }
        
        //Return to previous view
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}