//
//  Location.swift
//  GoogleMapsDemo
//
//  Created by X Code User on 7/21/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

import Foundation

class Location {
    var company: String
    var phone: String
    var lat: Double
    var long: Double
    
    init (company: String, phone: String, Latitude: Double, Longitude: Double){
        self.company = company
        self.phone = phone
        self.lat = Latitude
        self.long = Longitude
    }
}