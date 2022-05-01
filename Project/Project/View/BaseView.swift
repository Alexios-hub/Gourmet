//
//  BaseView.swift
//  socialClub
//
//  Created by 刘洪博 on 2022/4/30.
//

import SwiftUI

struct BaseView: View {
    @StateObject var baseData = BaseViewModel()
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection: $baseData.currentTab){
          Text("Home")
                .tag(Tab.Home)
            
            Text("heart").tag(Tab.Heart)
            
            Community()
                .environmentObject(baseData)
                .frame(maxWidth:.infinity,maxHeight: .infinity)
                .background(Color.black.opacity(0.04))
                .tag(Tab.Community)
            PersonalView(user: loginuser, recipes: favoriterecipes)
                .tag(Tab.Person)
            
            
            
        }
        .overlay(
            
                HStack(spacing:0){
                    TabButton(Tab: .Home)
                    TabButton(Tab: .Heart).offset(x:-10)
                    Button{
                        
                    }label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit
                                )
                            .frame(width: 26, height: 26)
                            .foregroundColor(.white)
                            .offset(x:-1)
                            .padding(18)
                            .background(Color.purple)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                           
                           
                        
                    }
                    .offset(y:-30)
                    
                    
                    
                    TabButton(Tab: .Community)
                        .offset(x:10)
                    TabButton(Tab: .Person)
                }
                    .background(Color.white.clipShape(CustomCurveShape())
                        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                        .ignoresSafeArea(.container,edges: .bottom)
                    )
                    .offset(y: baseData.showDetail ? 200 : 0)
                    
                ,alignment: .bottom
                  
                
               
            
        )
       
    }
    
    @ViewBuilder
    func TabButton(Tab:Tab)->some View{
        Button{
            withAnimation{
                baseData.currentTab = Tab
            }
        } label: {
            Image(systemName: Tab.rawValue)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(baseData.currentTab == Tab ?
                                 Color.gray.opacity(0.5): Color.black.opacity(0.5))
                .frame(maxWidth:.infinity)
            
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
            .previewInterfaceOrientation(.portrait)
    }
}
