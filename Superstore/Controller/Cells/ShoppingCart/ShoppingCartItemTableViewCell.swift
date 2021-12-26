//
//  ShoppingCartItemTableViewCell.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/19/21.
//

import UIKit
class ShoppingCartItemTableViewCell: UITableViewCell {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var pname: UILabel!
    @IBOutlet weak var pprice: UILabel!
    @IBOutlet weak var pfor: UILabel!
    @IBOutlet weak var pimg: UIImageView!
    @IBOutlet weak var pcount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func stepper(_ sender: UIStepper) {
        pcount.text = String(Int(sender.value))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
