//
//  TimerModel.swift
//  StopWatchDemo
//
//  Created by X Code User on 7/14/15.
//  Copyright (c) 2015 gvsu.edu. All rights reserved.
//

import Foundation

struct TimerModel {
    var startTime: NSDate
    var pauseTime: NSDate
    var nightDisplayMode: Bool = false
    var running: Bool = false
    var stopWatchTimer: NSTimer
    
    init() {
        startTime = NSDate()
        pauseTime = startTime
        stopWatchTimer = NSTimer()
    }
}