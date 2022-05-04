//
//  Tag.swift
//  CookbookDemo
//
//  Created by ZhichenRen on 2022/5/2.
//

import SwiftUI

struct Tag: Identifiable, Hashable {
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
}
