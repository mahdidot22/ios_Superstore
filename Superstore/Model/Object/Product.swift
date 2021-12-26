//
//  Product.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/25/21.
//

import Foundation
struct Product:Codable {
    var id:Int
    var title:String
    var price:Double
    var category:String
    var description:String
    var image:String
    
    struct rating:Codable {
        var rate:Double
        var count:Int
    }
}
