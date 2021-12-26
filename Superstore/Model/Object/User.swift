//
//  User.swift
//  Superstore
//
//  Created by Mahdi D. O. Taha on 12/25/21.
//

import Foundation

struct User:Codable{
    var id:Int
    var email:String
    var username:String
    var password:String
    
    struct name:Codable {
        var firstname:String
        var lastname:String
    }
    
    struct address:Codable {
        var city:String
        var street:String
        var number:Int
        var zipcode:String
        
        struct geolocation:Codable{
            var lat:String
            var long:String
        }
    }
    var phone:String
}
