//
//  ProductDetailsTableViewCell.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/24/21.
//

import UIKit

class ProductDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var countView: UILabel!
    @IBOutlet weak var factoryDetailsName: UILabel!
    @IBOutlet weak var productDetailsPrice: UILabel!
    @IBOutlet weak var productDetailsDescription: UILabel!
    @IBOutlet weak var addToCartView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addToCartView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addToCart(_ sender: Any) {
    }
    @IBAction func stepper(_ sender: UIStepper) {
        countView.text = String(Int(sender.value))
    }
}
