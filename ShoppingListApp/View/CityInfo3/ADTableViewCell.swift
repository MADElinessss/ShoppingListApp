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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        badgeLabel.layer.cornerRadius = 20
        backgroundColor = .orange
    }
}
