//
//  LastFmModel.swift
//  TopArtistApp
//
//  Created by X Code User on 7/16/15.
//  Copyright (c) 2015 Tim Jaroch & Remo Hoeppli. All rights reserved.
//
/*
Last.fm
API Key: 8d17f0666c65636f9aebe297ab017d2f
Secret: is b57dc5ed9872ea60449b046e06e8aa47
*/

import Foundation

class LastFmModel {
    
    init(){
        //DO NOT PUBLISH: API Token needs to be safely handled, this is NOT safe!!
        let fullUrl: String = "http://ws.audioscrobbler.com/2.0/?method=geo.gettoptracks&country=japan&api_key=8d17f0666c65636f9aebe297ab017d2f&format=json" //500ms call time!!!
        
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: fullUrl)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error)
            
            if let topLevelObject = parsedObject as? NSDictionary {
                
                if let topTracks = topLevelObject.objectForKey("toptracks") as? NSDictionary {
                    if let tracks = topTracks.objectForKey("track") as? NSArray {
                        for track in tracks{
                            if let artist = track.objectForKey("artist") as? NSDictionary {
                                if let artistName = artist.objectForKey("name") as? NSString {
                                    println(artistName)
                                    //ASSIGN NAME FROM HERE
                                }
                                if let artistUrl = artist.objectForKey("url") as? NSString {
                                    println(artistUrl)
                                    //ASSIGN URL HERE
                                }
                            }
                            if let listeners = track.objectForKey("listeners") as? NSString {
                                println(listeners)
                                //ASSIGN Listeners HERE
                            }
                            //BUILD SINGLE OBJECT AND SUBMIT
                        }
                        
                    }
                    
                }
            }
        })
    }
}