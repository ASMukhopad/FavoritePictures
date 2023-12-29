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
    
    let selectImage = UIImage(systemName: "hand.thumbsup.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
    let emptyImage = UIImage(systemName: "hand.thumbsup")
    
    @IBAction func actionLikeButton(_ sender: Any) {
        let success = saveImage(image: (photoImageView.image ?? UIImage(named:"4"))!)
    }
    
    func saveImage(image: UIImage) -> Bool {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("fileName.png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
