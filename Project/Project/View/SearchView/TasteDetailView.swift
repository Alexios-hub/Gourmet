//
//  TasteDetailView.swift
//  Food
//
//  Created by admin on 2022/4/29.
//

import SwiftUI

struct TasteDetailView: View {
    var taste: Taste
    
    var animation: Namespace.ID
    
    @EnvironmentObject var sharedData: ShareDataModel
    var body: some View {
        VStack{
            
            VStack{
                
                HStack{
                    Button{
                        withAnimation(.easeInOut){
                            sharedData.showDetailTaste = false
                        }
                    }label:{
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black.opacity(0.7))
                    }
                    Spacer()
                    Button{
                        
                    }label:{
                        Image(systemName: "star")
                            .font(.title)
                            .foregroundColor(.black.opacity(0.7))
                    }
                }
                .padding()
                
                Image(taste.tasteImages)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "\(taste.id)IMAGE", in: animation)
                    .padding(.horizontal)
                    .offset(y:-12)
                    .frame(maxHeight:.infinity)
            }
            .frame(height: getRect().height / 2.7)
            
            ScrollView(.vertical,showsIndicators: false){
                VStack(alignment:.leading,spacing: 15){
                    Text(taste.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(taste.subtitle)
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Text(taste.description)
                    
                    Button{
                        
                    }label:{
                        Text("分享给好友")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical,20)
                            .frame(maxWidth: .infinity)
                            .background(
                                Color.purple
                                    .cornerRadius(15)
                                    .shadow(color: .black.opacity(0.06), radius: 5, x: 5, y: 5)
                            )
                    }
                    
                }
                .padding([.horizontal,.bottom],20)
                .padding(.top,25)
                .frame(maxWidth:.infinity,alignment: .leading)
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(
                RoundedCorners(color: .white, tl: 25, tr: 25, bl: 0, br: 0)
                    .ignoresSafeArea()
            )
        }
        .background(.gray.opacity(0.1))
    }
}

struct TasteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
