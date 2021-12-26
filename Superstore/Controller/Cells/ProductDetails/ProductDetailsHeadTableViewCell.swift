//
//  ProductDetailsHeadTableViewCell.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/24/21.
//

import UIKit
protocol ButtonCellDelegate {
   func dismissFromCell()
}
class ProductDetailsHeadTableViewCell: UITableViewCell {

    @IBOutlet weak var productDetailsImage: UIImageView!
    @IBOutlet weak var productDetailsName: UILabel!
    weak var delegate: ProductDetailsViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func back(_ sender: Any) {
        delegate?.dismissFromCell()
    }
    
}
