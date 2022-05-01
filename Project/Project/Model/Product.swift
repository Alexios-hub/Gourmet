//
//  Product.swift
//  socialClub
//
//  Created by 刘洪博 on 2022/4/30.
//

import SwiftUI

struct Product:Identifiable{
    var id = UUID().uuidString
    var productImage: String
    var productTitle:String
    var productPrice:String
    var productBG:Color
    var isLiked:Bool = false
    var productRating:Int
}

var products = [
    Product(productImage: "signature", productTitle: "Nike Air Max 20", productPrice: "$240.0", productBG: Color.black, isLiked: false, productRating: 4),
    Product(productImage: "paragraphsign", productTitle: "Nike Air Max 20", productPrice: "$240.0", productBG: Color.black, isLiked: false, productRating: 3),
    Product(productImage: "strikethrough", productTitle: "Nike Air Max 20", productPrice: "$240.0", productBG: Color.black, isLiked: false, productRating: 5),
    
    Product(productImage: "shadow", productTitle: "Nike Air Max 20", productPrice: "$240.0", productBG: Color.black, isLiked: false, productRating: 4)

]
