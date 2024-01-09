//
//  ShoppingListTableViewCell.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/8/24.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet var cellBackground: UIView!
    @IBOutlet var starButton: UIButton!
    @IBOutlet var checkBoxButton: UIButton!
    @IBOutlet var shoppingItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
