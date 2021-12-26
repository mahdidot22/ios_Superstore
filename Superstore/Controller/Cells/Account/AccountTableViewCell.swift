//
//  AccountTableViewCell.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/12/21.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    @IBOutlet weak var arrowRigth: UIImageView!
    @IBOutlet weak var setteingLable: UILabel!
    @IBOutlet weak var settingImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
