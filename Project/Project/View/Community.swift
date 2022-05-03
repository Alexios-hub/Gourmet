//
//  Home.swift
//  socialClub
//
//  Created by 刘洪博 on 2022/4/30.
//

import SwiftUI

struct Community: View {
    
    
    @Namespace var animation
    @EnvironmentObject var baseData:BaseViewModel

    
    
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(spacing:15){
                HStack{
                    Button{
                        
                    }label: {
                        Image(systemName: "filemenu.and.cursorarrow")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button{
                        
                    }label: {
                        Image(systemName: "magnifyingglass")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                    }
                }
                .foregroundColor(.black)
                .overlay(Image(systemName: "logo.playstation"))
                HStack{
                    Text("社区")
                        .font(.title.bold())
                    Spacer()
                    Button{
                        
                    }label: {
                        HStack(spacing:3){
                            Text("Sort by")
                                .font(.caption.bold())
                            Image(systemName: "list.bullet.rectangle")
                                .font(.caption.bold())
                        }
                        .foregroundColor(.gray)
                    }
                }
                .padding(.top,25)
                
                
                ScrollView(.horizontal,showsIndicators :false){
                    HStack{
                        SegmentButton(image: "facemask.fill", title: "正餐")
                        SegmentButton(image: "command", title: "小吃")
                        SegmentButton(image: "option", title: "饮品")
                    }
                }
                
                let columns = Array(repeating:GridItem(.flexible(),spacing: 15 ),count: 2)
                LazyVGrid(columns: columns, spacing: 18){
                    
                    
                    ForEach(recipes){
                        recipe in
                        CardView(recipe: recipe)
                            .onTapGesture {
                                withAnimation{
                                    baseData.currentRecipe = recipe
                                    baseData.showDetail = true
                                 
                                    
                                }
                            }
                    }
                }
                
            }
            .padding()
        }
        .fullScreenCover(isPresented: $baseData.showDetail, content:{DetailView(animation: animation).environmentObject(baseData)})
//        .overlay(DetailView(animation: animation).environmentObject(baseData))
    }
    @ViewBuilder
    func CardView(recipe:Recipe)->some View{
        VStack(spacing:15){
            Button{
                
            }label: {
                Image(systemName: "suit.heart.fill")
                    .font(.system(size: 13))
                    .foregroundColor(recipe.isLiked ? .white : .gray)
                    .padding(5)
                    .background(
                        Color.red.opacity(recipe.isLiked ? 1 : 0),
                        in: Circle()
                    )
            }
            .frame(maxWidth: .infinity,  alignment: .trailing)
            
            Image(recipe.image)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(12)
                .matchedGeometryEffect(id: recipe.image, in: animation)
                
                
           
            Text(recipe.name)
                .fontWeight(.semibold)
                
            
            Text(recipe.location)
                .font(.title2.bold())
            
            HStack(spacing:4){
                ForEach(1...5,id:\.self){
                    index in
                    Image(systemName: "star.fill")
                        .font(.system(size:9.5))
                        .foregroundColor(recipe.rating >= index ? .yellow : Color.gray.opacity(0.6))
                    
                }
                Text("(\(recipe.rating).0)")
                    .font(.caption.bold())
                    .foregroundColor(.gray)
                
            }
        }
        .padding()
        .background(Color.white,in:RoundedRectangle(cornerRadius: 12))
        
    }
    
    @ViewBuilder
    func SegmentButton(image:String,title:String)->some View{
        Button{
            withAnimation{baseData.homeTab = title}
        }label: {
            HStack(spacing:8){
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                Text(title)
                    .font(.system(size: 12.5))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding(.vertical,10)
            .padding(.horizontal,12)
            .background(
                ZStack{
                    if baseData.homeTab == title{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                    }
                }
            )
        }
        .padding()
      
    }
    
    }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
