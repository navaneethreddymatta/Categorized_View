//
//  CategoriesTableViewController.swift
//  InClass05
//
//  Created by student on 7/19/16.
//  Copyright © 2016 mnr_iOS. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {
    var categories:[String]?
    var selectedCategoryName:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let apps = AppsData.data
        categories = [String](apps.keys)
        //tableView.reloadData()
    }


    // MARK: - Table view data source

   override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (categories?.count)!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = categories![indexPath.row]
        // selectedCategoryName = categories![indexPath.row]
        
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC: AnyObject = segue.destinationViewController
        if let appsTVC = destinationVC as? AppsTableViewController {
            let cell = tableView.cellForRowAtIndexPath(tableView.indexPathForSelectedRow!)
            appsTVC.selectedCategory = cell!.textLabel?.text
        }
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
}
