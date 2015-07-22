//
//  GroceryItem.swift
//  ParseStarterProject
//
//  Created by X Code User on 7/20/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation

class GroceryItem {
    var objectId: String
    var name: String
    var selected: Bool
    
    init(objectId: String, name: String, selected: Bool){
        self.objectId = objectId
        self.name = name
        self.selected = selected
    }
}


