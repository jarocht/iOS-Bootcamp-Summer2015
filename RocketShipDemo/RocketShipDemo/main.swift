//
//  main.swift
//  RocketShipDemo
//
//  Created by X Code User on 7/14/15.
//  Copyright (c) 2015 gvsu.edu. All rights reserved.
//
//  Tim Jaroch & Remo Hoeppli
//  Lab02

import Foundation

var countDown: [String] = ["ten","nine","eight","seven","six","five","four","three","two","one"]

/*var rocket: Rocket = Rocket(fuel: 100) //100 Gallons!
rocket.blastOff()*/

/*rocket.programmableBlastOff { (input: Int) -> Void in
    var fuel = input
    println("Fuel Tank @ \(fuel) units")
    for v in countDown{
        fuel = fuel - 10
        println(v)
        println("Fuel Tank @ \(fuel) units")
    }
}*/

/*var fancyRocket: Rocket = MannedRocket(fuel: 2000, astro1:"Tim", astro2:"Remo")

fancyRocket.programmableBlastOff{ (Int) -> Void in
    for v in countDown{
        println(v)
    }
}*/

var teamRocket: Rocket = BestRocket(fuel: 100, astro1: "Remo", astro2: "Tim", destination: "Pluto", rocketName: "Millenium Falcon")

teamRocket.programmableBlastOff { (Int) -> Void in
    for v in countDown {
        println(v)
    }
}
