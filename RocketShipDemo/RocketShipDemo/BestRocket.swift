//
//  BestRocket.swift
//  RocketShipDemo
//
//  Created by X Code User on 7/14/15.
//  Copyright (c) 2015 gvsu.edu. All rights reserved.
//
//  Tim Jaroch & Remo Hoeppli
//  Lab02 7/14/2015
//  GVSU - CIS 380 - Mobile Applications

import Foundation

class BestRocket : MannedRocket {
    var destination: String
    var rocketName: String
    
    convenience init (fuel: Int, astro1: String, destination: String, rocketName: String){
        self.init(fuel:fuel, astro1:astro1, astro2:nil, destination:destination, rocketName:rocketName)
    }
    
    init (fuel: Int, astro1: String, astro2: String?, destination: String, rocketName: String){
        self.destination = destination
        self.rocketName = rocketName
        super.init(fuel: fuel, astro1: astro1, astro2: astro2)
    }
    
    override func programmableBlastOff(instructions: (Int) -> Void) {
        println("Preparing \(rocketName) for blast off")
        instructions(fuelTank)
        println("\(rocketName) has experienced lift off!!!")
        println(self.astronaut1 + " is now in space")
        if (self.astronaut2 != nil){
            println(self.astronaut2! + " is ALSO now in space")
        }
        println("Astronauts are now on their way to \(destination)")
    }
}