//
//  RecipeViewModel.swift
//  socialClub
//
//  Created by 刘洪博 on 2022/5/1.
//

import SwiftUI

class FavoriteRecipes:ObservableObject{
    var ifchange : Bool
    var user :User
    @Published var favoriterecipes :[Recipe]
    
    init(user:User){
        self.ifchange = false
        self.user = user
        favoriterecipes = [recipes[0],recipes[1],recipes[2]]
        
      
    }
    func removefavorite(recipe:Recipe){
        print(recipe)
        print(favoriterecipes[0])
        for i in 0..<self.favoriterecipes.count{
            if(recipe.id == self.favoriterecipes[i].id){
                self.favoriterecipes.remove(at: i)
               
                break
            }
        }
    }
    func addfavorite(recipe:Recipe){
        print(recipe)
        self.favoriterecipes.append(recipe)
    
    }
    func ifinfavorite(recipe:Recipe)->Bool{
        for i in 0..<self.favoriterecipes.count{
            if(recipe.id == self.favoriterecipes[i].id){
                return true
            }
        }
        return false
    }
   
}

var favoriterecipes = FavoriteRecipes(user: loginuser)

