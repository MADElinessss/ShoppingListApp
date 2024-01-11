//
//  CityDetailTableViewCell.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/11/24.
//

import UIKit
import Cosmos

class CityDetailTableViewCell: UITableViewCell {
    
    
    static let identifier = "CityDetailTableViewCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var likeBadgeImage: UIImageView!
    @IBOutlet var saveAndReviewLabel: UILabel!
    @IBOutlet var ratingView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImageView.layer.cornerRadius = 10
    }
}
