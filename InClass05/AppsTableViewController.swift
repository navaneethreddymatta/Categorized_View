//
//  AppsTableViewController.swift
//  InClass05
//
//  Created by student on 7/19/16.
//  Copyright © 2016 mnr_iOS. All rights reserved.
//

import UIKit

class AppsTableViewController: UITableViewController {
    var selectedCategory:String?
    var selectedApp:(title: String, developer: String, imgSmall: String, imgLarge: String, price: String, releaseDate: String)?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let data = AppsData.data
        return data[selectedCategory!]!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myAppCell", forIndexPath: indexPath)
        //let data = AppsData.data
        let myApp = AppsData.data[selectedCategory!]![indexPath.row]
        // Configure the cell...
        //cell.textLabel?.text = apps[indexPath.row].title
        if let appCell = cell as? AppsTableViewCell {
            appCell.app = myApp
        }
        selectedApp = myApp
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC: AnyObject = segue.destinationViewController
        if let appsTVC = destinationVC as? AppDetailsViewController {
            appsTVC.app = selectedApp
            
            appsTVC.app = AppsData.data[selectedCategory!]![(tableView.indexPathForSelectedRow?.row)!]

        }
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
        
        
    }

}
