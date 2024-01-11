//
//  ADTableViewCell.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/11/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {

    static let identifier = "ADTableViewCell"
    
    @IBOutlet var badgeLabel: UILabel!
    @IBOutlet var adTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        badgeLabel.layer.cornerRadius = 50
        backgroundColor = .orange
    }
}
