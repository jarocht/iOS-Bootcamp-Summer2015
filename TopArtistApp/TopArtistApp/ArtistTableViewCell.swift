//
//  ContactTableViewCell.swift
//  SimpleContacts
//
//  Created by X Code User on 7/15/15.
//  Copyright (c) 2015 Tim Jaroch & Remo Hoeppli. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbImage: UIView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var listenerCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
