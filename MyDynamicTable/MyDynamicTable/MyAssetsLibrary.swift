//
//  MyAssetsLibrary.swift
//  MyDynamicTable
//
//  Created by X Code User on 7/15/15.
//  Copyright (c) 2015 Tim Jaroch & Remo Hoeppli. All rights reserved.
//

import Foundation
import AssetsLibrary

class MyAssetsLibrary: ALAssetsLibrary {
    static let singleton = MyAssetsLibrary()
    
    class func defaultInstance() -> MyAssetsLibrary{
        return singleton
    }
    
}