//
//  AccountViewController.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/12/21.
//

import UIKit

class AccountViewController: UIViewController {
    @IBOutlet weak var accountSettingsTV: UITableView!
    private let settingsList = ["Edit Profile","Shipping Address","Wishlist","Order History","Track Order","Cards","Notifications","Log Out"]
    private let icosnList = [UIImage(named: "editProfile"),UIImage(named: "locationProfile"),UIImage(named: "wishlistProfile"),UIImage(named: "historyProfile"),UIImage(named: "orderProfile"),UIImage(named: "paymentProfile"),UIImage(named: "alertProfile"),UIImage(named: "exitProfile")]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
}

extension AccountViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellInflate(indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHight(indexPath)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    

    private func cellInflate(_ indexPath: IndexPath) -> UITableViewCell{

        if indexPath.row == 0 {
            let cell = accountSettingsTV.dequeueReusableCell(withIdentifier: "userCell") as! ProfileTableViewCell
            return cell
        }
        else if (indexPath.row >= 1) && (indexPath.row <= 8) {
            let cell = accountSettingsTV.dequeueReusableCell(withIdentifier: "settingsCell") as! AccountTableViewCell
            cell.setteingLable.text = settingsList[indexPath.row-1]
            cell.settingImage.image = icosnList[indexPath.row-1]
            return cell
        }
        else{
            let cell = accountSettingsTV.dequeueReusableCell(withIdentifier: "settingsCell") as! AccountTableViewCell
            return cell
        }
    }

    private func cellHight(_ indexPath:IndexPath) -> CGFloat{
        if indexPath.row == 0 {
            return 120
        }else if (indexPath.row >= 1) && (indexPath.row <= 8){
            return 76
        }else{
            return 76
        }
    }
}
