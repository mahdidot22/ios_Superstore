//
//  Opperations.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/25/21.
//

import Foundation
import Alamofire

class Opperations{
    static func getAllUsers(handler: @escaping ([User]?,Error?)-> Void){
        AF.request(Constants.API.baseUrl + "/users").responseJSON { response in
            switch response.result{
                case .success(_):
                    if let data = response.data {
                    do{
                        let res = try JSONDecoder().decode([User].self, from: data)
                        handler(res,nil)
                        print(res)
                    }
                    catch{
                        handler(nil,error)
                        print(error)
                    }
                }
                case .failure(let error):
                    handler(nil,error)
            }
        }
    }
    
    static func getAllProducts(handler: @escaping ([Product]?,Error?)-> Void){
        AF.request(Constants.API.baseUrl + "/products").responseJSON { response in
            switch response.result{
                case .success(_):
                    if let data = response.data {
                    do{
                        let res = try JSONDecoder().decode([Product].self, from: data)
                        handler(res,nil)
                        print(res)
                    }
                    catch{
                        handler(nil,error)
                        print(error)
                    }
                }
                case .failure(let error):
                    handler(nil,error)
            }
        }
    }
    
    
    static func getAllProductsByCategory(category:String,handler: @escaping ([Product]?,Error?)-> Void){
        AF.request((Constants.API.baseUrl + "/products/category/\(category)").replacingOccurrences(of: " ", with: "%20")).responseJSON { response in
            switch response.result{
                case .success(_):
                    if let data = response.data {
                    do{
                        let res = try JSONDecoder().decode([Product].self, from: data)
                        handler(res,nil)
                        print(res)
                    }
                    catch{
                        handler(nil,error)
                        print(error)
                    }
                }
                case .failure(let error):
                    handler(nil,error)
            }
        }
    }
    
    
    static func getUserCrt(userId:String,handler: @escaping ([Cart]?,Error?)-> Void){
        AF.request(Constants.API.baseUrl + "/carts/user/\(userId)").responseJSON { response in
            switch response.result{
                case .success(_):
                    if let data = response.data {
                    do{
                        let res = try JSONDecoder().decode([Cart].self, from: data)
                        handler(res,nil)
                        print(res)
                    }
                    catch{
                        handler(nil,error)
                        print(error)
                    }
                }
                case .failure(let error):
                    handler(nil,error)
            }
        }
    }
    

    
    
    static func getProduct(productId:String, handler: @escaping ([Product]?,Error?)-> Void){
        AF.request(Constants.API.baseUrl + "/products\(productId)").responseJSON { response in
            switch response.result{
                case .success(_):
                    if let data = response.data {
                    do{
                        let res = try JSONDecoder().decode([Product].self, from: data)
                        handler(res,nil)
                        print(res)
                    }
                    catch{
                        handler(nil,error)
                        print(error)
                    }
                }
                case .failure(let error):
                    handler(nil,error)
            }
        }
    }
    
    static func deleteCart(cartId:String,handler: @escaping (Cart?,Error?)-> Void){
        AF.request(Constants.API.baseUrl + "/carts/\(cartId)").responseJSON { response in
            switch response.result{
                case .success(_):
                    if let data = response.data {
                    do{
                        let res = try JSONDecoder().decode(Cart.self, from: data)
                        handler(res,nil)
                        print(res)
                    }
                    catch{
                        handler(nil,error)
                        print(error)
                    }
                }
                case .failure(let error):
                    handler(nil,error)
            }
        }
    }
    
    
}
