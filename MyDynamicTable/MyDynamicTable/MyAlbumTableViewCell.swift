//
//  MyAlbumTableViewCell.swift
//  MyDynamicTable
//
//  Created by X Code User on 7/15/15.
//  Copyright (c) 2015 Tim Jaroch & Remo Hoeppli. All rights reserved.
//

import UIKit
import AssetsLibrary

class MyAlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var Thumbnail: UIImageView!
    @IBOutlet weak var Title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFromAlbum(album: ALAssetsGroup){
        self.Thumbnail!.image = UIImage(CGImage: album.posterImage().takeUnretainedValue())
        self.Title!.text = album.valueForProperty(ALAssetsGroupPropertyName) as? String
    }
    
}
