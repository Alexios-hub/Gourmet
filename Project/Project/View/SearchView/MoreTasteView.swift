//
//  MoreTasteView.swift
//  Food
//
//  Created by admin on 2022/4/28.
//

import SwiftUI

struct MoreTasteView: View {
    var body: some View {
        VStack{
            Text("更多美味")
                .font(.custom("customFont", size: 24).bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity,alignment: .leading)
            
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        
    }
}

struct MoreTasteView_Previews: PreviewProvider {
    static var previews: some View {
        MoreTasteView()
    }
}
