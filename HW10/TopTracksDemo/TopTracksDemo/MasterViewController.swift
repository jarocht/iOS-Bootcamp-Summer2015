//
//  MasterViewController.swift
//  TopTracksDemo
//
//  Created by Jonathan Engelsma on 5/26/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects = [AnyObject]()


    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: Update the URL in the following line with an API KEY of your own from last.fm.
        let url = NSURL(string: "http://ws.audioscrobbler.com/2.0/?method=geo.gettopartists&country=japan&api_key=8d17f0666c65636f9aebe297ab017d2f&format=json")
        let session = NSURLSession.sharedSession()
        var parseError : NSError?
        let task = session.downloadTaskWithURL(url!) {
            (loc:NSURL!, response:NSURLResponse!, error:NSError!) in
            let d = NSData(contentsOfURL: loc)!
            let parsedObject: AnyObject?  =
            NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.AllowFragments, error: &parseError)
            if let topLevelObject = parsedObject as? NSDictionary {
                //println(topLevelObject)
                if let topartists = topLevelObject.objectForKey("topartists") as? NSDictionary {
                    //println(topartists)
                    if let artists = topartists.objectForKey("artist") as? NSArray {
                        for a in artists {
                            println(a)
                            self.objects.append(a)
                        }
                        dispatch_async(dispatch_get_main_queue()) {
                            (UIApplication.sharedApplication().delegate as! AppDelegate).decrementNetworkActivity()
                            self.tableView.reloadData()
                        }
                    }
                }
            }

            
        }
        (UIApplication.sharedApplication().delegate as! AppDelegate).incrementNetworkActivity()
        task.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                var index = indexPath.row
                let artist = objects[index] as! NSDictionary
                var mobileUrl = artist.objectForKey("url") as? String
                mobileUrl = mobileUrl!.stringByReplacingOccurrencesOfString("www.last.fm", withString: "m.last.fm")
                (segue.destinationViewController as? CustomWebViewController)?.webUrl = mobileUrl
            }
        }
    }

    // MARK: - Table View

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        let artist = objects[indexPath.row] as! NSDictionary
        
        // Listener Count
        cell.detailTextLabel!.text = "Listeners: " + (artist.objectForKey("listeners") as? String)!
        
        // artist name
        cell.textLabel!.text = artist.objectForKey("name") as? String

        // thumbnail image
        cell.imageView?.image = UIImage(named: "Last_fm_logo")
        if let image = artist.objectForKey("image") as? NSArray {
            if let firstImage = image[2] as? NSDictionary {
                if let imageUrl = firstImage["#text"] as? String {
                    cell.imageView?.loadImageFromURL(NSURL(string:imageUrl),
                        placeholderImage: cell.imageView?.image, cachingKey: imageUrl)
                }
            }
        }

        return cell
    }



}

