//
//  AppDetailsViewController.swift
//  InClass05
//
//  Created by student on 7/19/16.
//  Copyright © 2016 mnr_iOS. All rights reserved.
//

import UIKit

class AppDetailsViewController: UIViewController {
    var app:(title: String, developer: String, imgSmall: String, imgLarge: String, price: String, releaseDate: String)?
    override func viewDidLoad() {
        super.viewDidLoad()
        appTitleField.text = app!.title
        appDescriptionField.text = app!.developer
        dateField.text = app!.releaseDate
        appCostField.text = app!.price
        
            let appImageURL = NSURL(string: app!.imgLarge)
            if let imageData = NSData(contentsOfURL: appImageURL!) {
                appImageField.image = UIImage(data: imageData)
            }
       
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var appTitleField: UILabel!
    
    @IBOutlet weak var appImageField: UIImageView!

    @IBOutlet weak var appDescriptionField: UILabel!
    
    @IBOutlet weak var dateField: UILabel!
    
    @IBOutlet weak var appCostField: UILabel!
    
}
