//
//  ViewController.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/4/21.
//

import UIKit
import JGProgressHUD
class ViewController: UIViewController {
    let hud = JGProgressHUD()
    private var users:[User] = []
    @IBOutlet weak var usernameTextFiled: UITextField!
    @IBOutlet weak var pswTextFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRequest(hud: hud)
    }
    
    @IBAction func signIn(_ sender: Any) {
        if (usernameTextFiled.text?.isEmpty == false) && (pswTextFiled.text?.isEmpty == false) {
            users.forEach { (user) in
                if user.username == usernameTextFiled.text && user.password == pswTextFiled.text{
                    performSegue(withIdentifier: "login", sender: sender)
                }else{
                    hud.textLabel.text = "Invalid Username or Password."
                    hud.show(in: self.view)
                    hud.dismiss(afterDelay:0)
                }
            }
        }else{
            hud.textLabel.text = "Fill Fileds!!"
            hud.show(in: self.view)
            hud.dismiss(afterDelay:0)
        }
    }
    
    private func loadRequest(hud:JGProgressHUD){
        Opperations.getAllUsers { (response, error) in
            if error == nil{
                guard let data = response else {return}
                self.users.append(contentsOf: data)
            }else{
                hud.textLabel.text = error?.localizedDescription
                hud.show(in: self.view)
                hud.dismiss(afterDelay: 3.0)
            }
        }
    }
}
