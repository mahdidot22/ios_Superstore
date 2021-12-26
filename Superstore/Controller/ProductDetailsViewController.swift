//
//  ProductDetailsViewController.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/24/21.
//

import UIKit
import JGProgressHUD
import SDWebImage

class ProductDetailsViewController: UIViewController {
    var product:Product?
    @IBOutlet weak var productsDetailTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRequest()
    }
    
    private var products:[Product] = []
    private func loadRequest(){
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        
        Opperations.getAllProductsByCategory(category: product!.category) { (response, error) in
            if error == nil{
                guard let data = response else {return}
                self.products.append(contentsOf: data)
                self.productsDetailTV.reloadData()
                hud.dismiss(afterDelay: 0)
            }else{
                hud.textLabel.text = error?.localizedDescription
                hud.show(in: self.view)
                hud.dismiss(afterDelay: 3.0)
            }
        }
    }


}

extension ProductDetailsViewController:UITableViewDelegate,UITableViewDataSource,ButtonCellDelegate{
    func dismissFromCell() {
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellInflate(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHight(indexPath)
    }
    
    
    private func cellInflate(_ indexPath: IndexPath) -> UITableViewCell{

        if indexPath.row == 0 {
            let cell = productsDetailTV.dequeueReusableCell(withIdentifier: "pheadCell") as! ProductDetailsHeadTableViewCell
            cell.productDetailsName.text = product?.title
            cell.productDetailsImage.sd_setImage(with:URL(string: product!.image))
            return cell
        }
        else if indexPath.row == 1 {
            let cell = productsDetailTV.dequeueReusableCell(withIdentifier: "descriptionCell") as! ProductDetailsTableViewCell
            cell.factoryDetailsName.text = product?.category
            cell.productDetailsPrice.text = "$"+String(product!.price)
            cell.productDetailsDescription.text = product?.description
            return cell
        }
        else{
            let cell = productsDetailTV.dequeueReusableCell(withIdentifier: "suggestionsCell") as! ProductDetailsSuggestionTableViewCell
            cell.suggestedProductName.text = products[indexPath.row].title
            cell.suggestedProductFor.text = products[indexPath.row].category
            cell.suggestedProductPrice.text = "$"+String(products[indexPath.row].price)
            cell.suggestedProductImage.sd_setImage(with: URL(string: products[indexPath.row].image))
            return cell
        }
    }
    
    private func cellHight(_ indexPath:IndexPath) -> CGFloat{
        if indexPath.row == 0 {
            return 260
        }else if (indexPath.row==1){
            return 310
        }else{
            return 120
        }
    }
    
    
}
