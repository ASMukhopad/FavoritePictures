//
//  PictureFeedTableViewCell.swift
//  FavoritePictures
//
//  Created by Alexander on 23.12.2023.
//

import UIKit

class PictureFeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var numberCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func actionLikeButton(_ sender: Any) {
        
    }
}
