//
//  HomeViewController.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/12/21.
//

import UIKit
import JGProgressHUD
import SDWebImage
class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollecctionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRequest()
    }
    private var products:[Product] = []
    private func loadRequest(){
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        Opperations.getAllProducts { (response, error) in
            if error == nil{
                guard let data = response else {return}
                self.products.append(contentsOf: data)
                self.homeCollecctionView.reloadData()
                hud.dismiss(afterDelay: 0)
            }else{
                hud.textLabel.text = error?.localizedDescription
                hud.show(in: self.view)
                hud.dismiss(afterDelay: 3.0)
            }
        }
    }

}

extension HomeViewController:UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollecctionView.dequeueReusableCell(withReuseIdentifier: "homeProductsCell", for: indexPath)as! HomeCollectionViewCell
        cell.homeProdutImage.sd_setImage(with: URL(string: products[indexPath.item].image))
        cell.homeProductName.text = products[indexPath.row].title
        cell.homeProdutFor.text = products[indexPath.row].category
        cell.homeProductPrice.text = "$" + String(products[indexPath.row].price)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(collectionView.frame.width/2)-39, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destenation = storyBoard.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        destenation.product = products[indexPath.row] as Product
        let navController = UINavigationController(rootViewController: destenation)
        navController.isNavigationBarHidden = true
        self.present(navController, animated: true, completion: nil)
    
    }

}
