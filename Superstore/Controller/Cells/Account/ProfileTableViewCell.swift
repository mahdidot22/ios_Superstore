//
//  ProfileTableViewCell.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/13/21.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var profileUserImage: UIImageView!
    @IBOutlet weak var profileUsername: UILabel!
    @IBOutlet weak var profileUserMail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
