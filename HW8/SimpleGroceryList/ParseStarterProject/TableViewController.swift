//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class TableViewController: UITableViewController {
    
    var objects = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        var query = PFQuery(className: "GroceryItems")
        query.findObjectsInBackgroundWithBlock {(objects: [AnyObject]?, error: NSError?) -> Void in
            if (error == nil){
                if let groceryObjects = objects as? [PFObject] {
                    self.objects = []
                    for groceryItem in groceryObjects {
                        self.objects.insert(GroceryItem(objectId: groceryItem.objectId!, name: groceryItem.objectForKey("name") as! String, selected: groceryItem.objectForKey("selected") as! Bool), atIndex: 0)
                    }
                    self.tableView.reloadData()
                }
            } else {
                println("Error")
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! GroceryCell
        var index = indexPath.row
        if ((objects[index] as! GroceryItem).selected){
            (objects[index] as! GroceryItem).selected = false
        } else {
            (objects[index] as! GroceryItem).selected = true
        }
        
        var query = PFQuery(className: "GroceryItems")
        query.getObjectInBackgroundWithId((objects[index] as! GroceryItem).objectId) { (groceryObject: PFObject?, error: NSError?) -> Void in
            if error != nil {
                println("Error occured updating item")
            } else if let groceryObject = groceryObject {
                groceryObject["selected"] = (self.objects[index] as! GroceryItem).selected
                groceryObject.saveInBackground()
            }
        }
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func insertNewObject(sender: AnyObject) {
        self.performSegueWithIdentifier("AddEntry", sender: self)
    }
    
    // MARK: - Segues
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row] as! NSDate
                (segue.destinationViewController as! DetailViewController).detailItem = object
            }
        }
    }*/
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! GroceryCell
        
        let object = objects[indexPath.row] as! GroceryItem
        cell.itemLabel!.text = object.name
        
        if (object.selected){
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            var query = PFQuery(className: "GroceryItems")
            query.getObjectInBackgroundWithId((objects[indexPath.row] as! GroceryItem).objectId) { (groceryObject: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    println("Error occured deleting item")
                } else if let groceryObject = groceryObject {
                    groceryObject.deleteInBackground()
                }
            }
            
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

}