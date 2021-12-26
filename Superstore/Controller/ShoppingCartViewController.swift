//
//  ShoppingCartViewController.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/16/21.
//

import UIKit
import JGProgressHUD
import SDWebImage

class ShoppingCartViewController: UIViewController{

    @IBOutlet weak var shoppingCartTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let hud = JGProgressHUD()
        loadRequest(hud)
    }
    var cart:[Cart] = []
    var products:[Product] = []
    private func loadRequest(_ hud:JGProgressHUD){
        Opperations.getUserCrt(userId: "8") { (response, error) in
            hud.textLabel.text = "Loading..."
            hud.show(in: self.view)
            if error == nil{
                guard let data = response else {return}
                self.cart.append(contentsOf: data)
                self.loadProducts(hud)
            }else{
                hud.textLabel.text = error?.localizedDescription
                hud.show(in: self.view)
                hud.dismiss(afterDelay: 3.0)
            }
        }
    }
    
    private func loadProducts(_ hud:JGProgressHUD){
        Opperations.getAllProducts { (response, error) in
            if error == nil{
                guard let data = response else {return}
                self.products.append(contentsOf: data)
                self.shoppingCartTableview.reloadData()
                hud.dismiss(afterDelay: 0)
            }else{
                hud.textLabel.text = error?.localizedDescription
                hud.show(in: self.view)
                hud.dismiss(afterDelay: 3.0)
            }
        }
    }
}

extension ShoppingCartViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        products.forEach { (Product) in
            cart.forEach { (Cart) in
                Cart.products.forEach { (product) in
                    if product.productId == Product.id{
                        count+=1
                    }
                }
            }
        }
        return count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellInflate(indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHight(indexPath)
    }
    private func cellInflate(_ indexPath: IndexPath) -> UITableViewCell{

        if indexPath.row == 0 {
            let cell = shoppingCartTableview.dequeueReusableCell(withIdentifier: "hederCell") as! ShoppingCartHeaderTableViewCell
            return cell
        }
        else if (indexPath.row > 0) {
            let cell = shoppingCartTableview.dequeueReusableCell(withIdentifier: "productItemCell") as! ShoppingCartItemTableViewCell
            products.forEach { (Product) in
                cart.forEach { (Cart) in
                    Cart.products.forEach { (product) in
                        if product.productId == Product.id{
                            cell.pname.text = products[indexPath.row].title
                            cell.pfor.text = products[indexPath.row].category
                            cell.pprice.text = "$\(products[indexPath.row].price)"
                            if indexPath.row-1 >= 0 && indexPath.row-1 < cart.count {
                                let p = cart[indexPath.row-1].products
                                if indexPath.row-1 <= p.count{
                                    cell.pcount.text = "\(p[indexPath.row-1].quantity)"
                                }
                            }
                            cell.pimg.sd_setImage(with: URL(string: products[indexPath.row].image))
                            
                        }
                    }
                }
            }
            cell.button.addTarget(self, action: #selector(whichButtonPressed(sender:)), for: .touchUpInside)
            return cell
        }
        else{
            let cell = shoppingCartTableview.dequeueReusableCell(withIdentifier: "productItemCell") as! ShoppingCartItemTableViewCell
            return cell
        }
    }
    
    @objc func whichButtonPressed(sender: UIButton) {
        let buttonNumber = sender.tag+1
        deleteItem(id: buttonNumber)
    }
    
    func deleteItem(id:Int) {
        let hud = JGProgressHUD()
        deleteReq(id,hud)
    }
    
    func deleteReq(_ id:Int?, _ hud:JGProgressHUD){
        Opperations.deleteCart(cartId: "\(id!)") { (response, error) in
            hud.textLabel.text = "Deleting..."
            hud.show(in: self.view)
            if error == nil{
                self.cart.remove(at: id!-1)
                hud.textLabel.text = "Deleted Successfully."
                self.shoppingCartTableview.reloadData()
                hud.dismiss(afterDelay: 0)
            }else{
                hud.textLabel.text = error?.localizedDescription
                hud.show(in: self.view)
                hud.dismiss(afterDelay: 3.0)
            }
        }
    }
    
    private func cellHight(_ indexPath:IndexPath) -> CGFloat{
        if indexPath.row == 0 {
            return 260
        }else if (indexPath.row>0){
            return 152
        }else{
            return 152
        }
    }
    
    
}
