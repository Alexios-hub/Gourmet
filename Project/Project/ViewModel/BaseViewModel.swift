//
//  BaseViewModel.swift
//  socialClub
//
//  Created by 刘洪博 on 2022/4/30.
//

import SwiftUI

class BaseViewModel: ObservableObject {

    //Tab Bar...
    @Published var currentTab:Tab = .Community
    
    @Published var homeTab = "正餐"
    
    @Published var currentRecipe : Recipe?
    @Published var showDetail = false
    
}

enum Tab:String{
    //原始值rawvalue
    case Home = "house"
    case Heart = "heart"
    case Community = "globe.asia.australia"
    case Person = "person"
}


