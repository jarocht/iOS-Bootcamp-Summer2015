//
//  ViewController.swift
//  DistanceCalculator
//
//  Created by X Code User on 7/14/15.
//  Copyright (c) 2015 gvsu.edu. All rights reserved.
//
//  Remo Hoeppli & Tim Jaroch
//  GVSU - CIS 380 - Lab03

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ConvertBtnClick(sender: AnyObject) {
        if (inputTextField.text != nil){
            var input: Double = (inputTextField.text as NSString).doubleValue
            var result = input * 1.60934
            resultLabel.text = String(format: "Distance is %.6f Kilometers", result)
            hideKeyboard()
        }
    }
    
    @IBAction func ClearBtnClick(sender: AnyObject) {
        inputTextField.text = ""
        resultLabel.text = ""
        hideKeyboard()
    }
    
    func hideKeyboard(){
        self.inputTextField.resignFirstResponder()
    }
}
