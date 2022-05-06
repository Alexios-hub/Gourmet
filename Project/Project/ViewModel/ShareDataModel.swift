//
//  ShareDataModel.swift
//  Food
//
//  Created by admin on 2022/4/29.
//

import SwiftUI

class ShareDataModel: ObservableObject {
    @Published var detailTaste: Taste?
    @Published var showDetailTaste: Bool = false
    
    @Published var fromSearchView: Bool = false
}

