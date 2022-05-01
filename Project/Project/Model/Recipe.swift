//
//  Recipe.swift
//  socialClub
//
//  Created by 刘洪博 on 2022/5/1.
//

import SwiftUI

struct Recipe: Identifiable{
   var id = UUID()
    var name = String()
    var video = String()
    var history = String()
    var todo = [String()]
    var description = String()
    var image = String()
    var location = String()
    var isLiked = false
    var rating = 5

}


var recipes : [Recipe] = [Recipe(name: "太谷饼", video: "", history: "history", todo: ["todo"], description: "description", image: "太谷饼", location: "山西"),Recipe( name: "鲜花饼", video: "", history: "history", todo: ["todo"], description: "description", image: "鲜花饼", location: "云南",isLiked: true),Recipe(name: "鱼糕", video: "", history: "history", todo: ["todo"], description: "description", image: "鱼糕", location: "湖北"),Recipe( name: "热干面", video: "", history: "history", todo: ["todo"], description: "description", image: "热干面", location: "武汉",isLiked: true)
                          ,Recipe( name: "五芳斋粽子", video: "", history: "history", todo: ["todo"], description: "description", image: "五芳斋粽子", location: "浙江")]




