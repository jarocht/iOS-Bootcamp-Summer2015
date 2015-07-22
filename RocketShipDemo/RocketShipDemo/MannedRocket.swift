//
//  MannedRocket.swift
//  RocketShipDemo
//
//  Created by X Code User on 7/14/15.
//  Copyright (c) 2015 gvsu.edu. All rights reserved.
//

import Foundation

class MannedRocket : Rocket {
    var astronaut1: String
    var astronaut2: String?
    
    convenience init(fuel: Int, astro1: String){
        self.init(fuel:fuel, astro1:astro1, astro2:nil)
    }
    
    //Designiation Init
    init (fuel: Int, astro1: String, astro2: String?){
        self.astronaut1 = astro1
        self.astronaut2 = astro2
        super.init(fuel:fuel)
    }
    
    override func programmableBlastOff(instructions: (Int) -> Void) {
        instructions(fuelTank)
        println(self.astronaut1 + " is now in space")
        if (self.astronaut2 != nil){
            println(self.astronaut2! + " is ALSO now in space")
        }
    }
}