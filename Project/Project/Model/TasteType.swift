//
//  TasteType.swift
//  Food
//
//  Created by admin on 2022/4/28.
//

import SwiftUI

struct Taste: Identifiable,Hashable{
    var id = UUID().uuidString
    var type = TasteType.solid
    var title: String
    var subtitle: String
    var description: String = ""
    var tasteImages: String = ""
}

enum TasteType: String,CaseIterable{
    case solid = "酸"
    case sweet = "甜"
    case bitter = "苦"
    case spicy = "辣"
}

