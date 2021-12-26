//
//  Cart.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/26/21.
//

import Foundation

struct Cart:Codable{
    var id:Int
    var userId:Int
    var date:String
    var products:[products]
    
    struct products:Codable {
        var productId:Int
        var quantity:Int
    }
}
