//
//  PersonalView.swift
//  socialClub
//
//  Created by 刘洪博 on 2022/5/1.
//

import SwiftUI

struct PersonalView: View {
    
    @Namespace var animation
    @EnvironmentObject var baseData:BaseViewModel
    let user:User
    @ObservedObject var recipes:FavoriteRecipes

    var body: some View {
        ScrollView{
        VStack{
            Spacer(minLength: 60)
            CircleImage(user: user)
            Spacer(minLength: 30)
            Divider()
            Text("个人收藏").font(.title2)
                .fontWeight(.bold)
                .frame(alignment: .leading)
                Spacer(minLength: 30)
 
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack(){
                ForEach(recipes.favoriterecipes, id: \.id) { recipe in
                    GeometryReader{
                        geometry in
                        
                        CardView(recipe: recipe)
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX ) / -80), axis: (x: 0, y: 1, z: 0))
                            .onTapGesture {
                                withAnimation{
                                    baseData.currentRecipe = recipe
                                    baseData.showDetail = true
                                
                                }
                            }
                        
                    }.frame(minWidth: 300,  minHeight: 300)
                 
                
                }
                
            }
           
            .padding(.horizontal)
        }
        }
        }
        .fullScreenCover(isPresented: $baseData.showDetail, content:{DetailView(animation: animation).environmentObject(baseData)})
//        .overlay(DetailView(animation: animation).environmentObject(baseData))
        }
    }


struct CircleImage: View {
    let user:User
    var body: some View {
        VStack {
            Image(user.head_portrait)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150, alignment: .top)
                .cornerRadius(75)
            
            
        }
    }
}
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
        .frame(width: 300, height: 300)
        .background(Image(recipe.image)
            .resizable()
            
           
           )
        
        
       
       
        .cornerRadius(20)
    
    
    }
}


struct PersonView_preview:PreviewProvider{
    static var previews: some View{
        PersonalView(user: loginuser, recipes: favoriterecipes)
    }
}


