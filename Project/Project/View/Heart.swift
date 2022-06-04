//
//  PersonalView.swift
//  socialClub
//
//  Created by 刘洪博 on 2022/5/1.
//

import SwiftUI

struct Heart: View {
    
    @Namespace var animation
    @EnvironmentObject var baseData:BaseViewModel
    let user:User
    @ObservedObject var recipes:FavoriteRecipes

    var gridItemLayout = [GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {

        VStack{
          
           
            Text("个人收藏").font(.title)
                .fontWeight(.bold)
                .frame(alignment: .leading)
            Divider()
                Spacer(minLength: 30)
 
        ScrollView(){
            LazyVGrid(columns: gridItemLayout, spacing: 20){
            

            
                ForEach(recipes.favoriterecipes, id: \.id) { recipe in

                        
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
        }

        .fullScreenCover(isPresented: $baseData.showDetail, content:{DetailView(animation: animation).environmentObject(baseData)})

    
}}

struct CardView:View{
    let recipe:Recipe
    var body: some View{

        VStack{
            Text(recipe.name).fontWeight(.bold)
                .foregroundColor(.white)
                .font(.system(size: 30))
            Text(recipe.location).fontWeight(.bold)
                .foregroundColor(.white)
                .font(.system(size: 20))
        }
//        .frame(width: 300, height: 300)
        .frame(minWidth: 160, maxWidth:180,minHeight: 200)
        .background(Image(recipe.image)
            .resizable()
            
           
           )
        
        
       
       
        .cornerRadius(20)
    
    
    }
}




