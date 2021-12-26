//
//  ShoppingCartHeaderTableViewCell.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/19/21.
//

import UIKit

class ShoppingCartHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var yourOrderLable: UILabel!
    @IBOutlet weak var orderLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
