//
//  ViewController.swift
//  StopWatchDemo
//
//  Created by X Code User on 7/14/15.
//  Copyright (c) 2015 gvsu.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerText: UILabel!
    @IBOutlet weak var dayNightToggle: UIButton!
    @IBOutlet weak var startStopToggleBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    
    var timerModel: TimerModel = TimerModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.timerModel.stopWatchTimer = NSTimer(timeInterval: 1.0/10.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.timerModel.stopWatchTimer, forMode: NSRunLoopCommonModes)
    }
    
    func updateTimer(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleMode(sender: UIButton) {
        if(!timerModel.nightDisplayMode){
            self.view.backgroundColor = UIColor.blackColor()
            timerText.textColor = UIColor.whiteColor()
            timerModel.nightDisplayMode = true
        } else {
            self.view.backgroundColor = UIColor.whiteColor()
            timerText.textColor = UIColor.blackColor()
            timerModel.nightDisplayMode = false
        }
        
        
    }
    @IBAction func startTimer(sender: UIButton) {
        if(!timerModel.running){
            timerModel.running = true
            clearBtn.enabled = false
            startStopToggleBtn.setTitle("Stop", forState: UIControlState.Normal)

        } else {
            timerModel.running = false
            clearBtn.enabled = true
            startStopToggleBtn.setTitle("Start", forState: UIControlState.Normal)
            self.view.backgroundColor = UIColor.whiteColor()
        }
        
    }
    @IBAction func clearTimer(sender: UIButton) {
        self.timerText.text = "00:00:00:000"
    }

}

