//
//  User.swift
//  socialClub
//
//  Created by 刘洪博 on 2022/5/1.
//

import SwiftUI

struct User:Identifiable{
    var id = UUID()
    var email = String()
    var name = String()
    var password = String()
    var head_portrait = String()
}

var loginuser = User(email: "111@email.com", name: "user1", password: "111", head_portrait: "headp1")

var users : [User] = [loginuser,User(email: "112@email.com", name: "user2", password: "112", head_portrait: "headp2"),User( email: "113@email.com", name: "user3", password: "113", head_portrait: "headp3")]
var defaultuser = User(email: "", name: "", password: "", head_portrait: "")
