//
//  AppsTableViewCell.swift
//  InClass05
//
//  Created by student on 7/19/16.
//  Copyright © 2016 mnr_iOS. All rights reserved.
//

import UIKit

class AppsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var appImageField: UIImageView!
    
    @IBOutlet weak var appCreatedDetailsField: UILabel!
    
    @IBOutlet weak var appTitleField: UILabel!
    
    @IBOutlet weak var appDescriptionField: UILabel!
    
    @IBOutlet weak var appCostField: UILabel!
    
    var app: (title: String, developer: String, imgSmall: String, imgLarge: String, price: String, releaseDate: String)? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        appTitleField.attributedText = nil
        appDescriptionField.text = nil
        appImageField.image = nil
        appCreatedDetailsField.text = nil
        appCostField.text = nil
        
        if let myApp = self.app {
            appTitleField.text = myApp.title
            appDescriptionField.text = myApp.developer
            appCostField.text = myApp.price
            appCreatedDetailsField.text = myApp.releaseDate
            let appImageURL = NSURL(string: myApp.imgSmall)
            if let imageData = NSData(contentsOfURL: appImageURL!) {
                appImageField?.image = UIImage(data: imageData)
            }
        }
    }
}
