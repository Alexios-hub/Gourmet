//
//  Home.swift
//  Food
//
//  Created by admin on 2022/4/29.
//

import SwiftUI

struct Home: View {
    @StateObject var sharedData: ShareDataModel = ShareDataModel()
    @Namespace var animation
    var body: some View {
        SearchHome(animation: animation)
            .environmentObject(sharedData)
            .overlay(
                ZStack{
                    if let taste = sharedData.detailTaste,sharedData.showDetailTaste{
                        TasteDetailView(taste: taste, animation: animation)
                            .environmentObject(sharedData)
                            .background(.white)
                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                    }
                }
            )
    }
}


