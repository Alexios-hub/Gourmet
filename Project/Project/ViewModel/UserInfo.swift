//
//  UserInfo.swift
//  Project
//
//  Created by 刘洪博 on 2022/5/2.
//

import SwiftUI

class UserInfo:ObservableObject{
    @Published var user:User
    @Published var iflogin:Bool
    init(user:User,iflogin:Bool){
        self.user = user
        self.iflogin = iflogin
    }
}
