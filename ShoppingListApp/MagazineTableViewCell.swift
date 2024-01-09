//
//  MagazineTableViewCell.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/8/24.
//

import Kingfisher
import UIKit

class MagazineTableViewCell: UITableViewCell {

    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
    @IBOutlet var date: UILabel!
    
    let magazine = MagazineInfo().magazine
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImage.layer.cornerRadius = 15
    }
}
