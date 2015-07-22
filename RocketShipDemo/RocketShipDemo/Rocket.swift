//
//  Rocket.swift
//  RocketShipDemo
//
//  Created by X Code User on 7/14/15.
//  Copyright (c) 2015 gvsu.edu. All rights reserved.
//

import Foundation

protocol SelfDestructableAirShip {
    func selfDestruct() -> Void
}

class Rocket : SelfDestructableAirShip {
    var fuelTank: Int
    
    init(fuel: Int){
        self.fuelTank = fuel
    }
    
    func blastOff(){
        for var i = fuelTank; i > 0; i-- {
            print(">")
        }
        println(" Blast Off!!")
    }
    
    func programmableBlastOff(instructions: (Int) -> Void) {
        instructions(self.fuelTank)
    }
    
    func selfDestruct() {
        println("boom")
    }
}