//
//  MasterViewController.swift
//  SimpleContacts
//
//  Created by X Code User on 7/15/15.
//  Copyright (c) 2015 Tim Jaroch & Remo Hoeppli. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var contacts: [Contact] = []

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // open and parse a file named data.json dragged into my iOS project
        var filePath = NSBundle.mainBundle().pathForResource("data", ofType:"json")
        var data = NSData(contentsOfFile:filePath!)
        var parseError: NSError?
        let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(data!,
            options: NSJSONReadingOptions.AllowFragments,
            error:&parseError)
        if let topLevelObj = parsedObject as? NSDictionary {
            if let data = topLevelObj["data"] as? NSArray {
            var contact: Contact
                for item in data {
                    contact = Contact(name: item[0] as! String, email: item[1] as! String, phone: item[2] as! String)
                    self.contacts.append(contact)
                }
            }
        }
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //self.navigationItem.rightBarButtonItem = addButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationViewController: DetailViewController = segue.destinationViewController as! DetailViewController
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            var index = indexPath.row
            
            destinationViewController.ContactNameLabelText = contacts[index].name
            destinationViewController.ContactEmailLabelText = contacts[index].email
            destinationViewController.ContactPhoneLabelText = contacts[index].phone
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ContactTableViewCell
        var contact = contacts[indexPath.row]
        cell.setContact(contact)
        //let object = objects[indexPath.row] as! NSDate
        //cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //objects.removeAtIndex(indexPath.row)
            contacts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

