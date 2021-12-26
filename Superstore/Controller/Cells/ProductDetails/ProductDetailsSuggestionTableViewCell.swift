//
//  ProductDetailsSuggestionTableViewCell.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/24/21.
//

import UIKit

class ProductDetailsSuggestionTableViewCell: UITableViewCell {

    @IBOutlet weak var suggestedProductImage: UIImageView!
    @IBOutlet weak var suggestedProductName: UILabel!
    @IBOutlet weak var viewForImage: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewForImage.layer.cornerRadius = 10
        suggestedProductImage.layer.cornerRadius = 10
    }
    @IBOutlet weak var suggestedProductPrice: UILabel!
    @IBOutlet weak var suggestedProductFor: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
