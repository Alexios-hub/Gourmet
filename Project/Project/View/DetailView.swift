//
//  DetailView.swift
//  socialClub
//
//  Created by 刘洪博 on 2022/4/30.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var baseData:BaseViewModel
    var animation : Namespace.ID
    @State var size = "Step1"
    @State var shoeColor: Color = .red
    var body: some View {
        if let recipe = baseData.currentRecipe,baseData.showDetail{
            VStack(spacing:0){
                
                HStack{
                    Button{
                        
                        withAnimation{
                            baseData.showDetail = false
                        }
                    }label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button{
                        
                    }label: {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.red,in: Circle())
                }
                }
                .foregroundColor(.black)
                .overlay(Image(systemName: "logo.playstation"))
                .padding(.horizontal)
                    
                Image(recipe.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: recipe.image, in: animation)
                        .frame(width: 250, height: 250)
                        .cornerRadius(12)
                        .frame(height:getScreenBounds().height/3)
                VStack(alignment: .leading, spacing: 18){
                    HStack{
                        Text(recipe.name)
                            .font(.title.bold())
                        Spacer(minLength: 10)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("(\(recipe.rating))")
                            .foregroundColor(.gray)
                    }
                    Text(recipe.description)
                        .font(.callout)
                        .lineSpacing(10)
                    
                    
                    
                    HStack(spacing:0){
                        Text("制作步骤:")
                            .font(.caption.bold())
                            .foregroundColor((.gray))
                            .padding(.trailing)
                        ScrollView(.horizontal,showsIndicators :false){
                            HStack{
                        ForEach(["Step1","Step2","Step3"],id:\.self){
                            size in
                            Button{
                                self.size = size
                            }label: {
                                Text(size)
                                    .font(.callout)
                                    .foregroundColor(.black)
                                    .padding(.vertical,8)
                                    .padding(.horizontal)
                                    .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.blue)
                                        .opacity(self.size == size ? 0.3 : 0)
                                    )
                            }
                        }
                            }
                    }
                    }
                    .padding(.vertical)
                    
                    
                    
//                    HStack(spacing:15){
//                        let colors:[Color] = [.yellow,.red,.purple,.green]
//                        Text("Available Color:")
//                            .font(.caption.bold())
//                            .foregroundColor((.gray))
//
//                        ForEach(colors,id:\.self){
//                            color in
//                            Button{
//                                self.shoeColor = color
//                            }label: {
//                                Circle()
//                                    .fill(color.opacity(0.5))
//                                    .frame(width:25,height: 25)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(Color.blue,lineWidth: 1.5)
//                                            .opacity(shoeColor == color ? 0.2 : 0)
//                                            .padding(-4)
//                                    )
//
//                            }
//                        }
//                    }
//                    .padding(.vertical)
                    Button{
                        
                    }label: {
                        HStack(spacing:15){
                            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width:20,height: 20)
                            Text("留言")
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.blue)
                        .padding(.vertical,15)
                        .frame(maxWidth:.infinity)
                        .background(.blue.opacity(0.06))
                        .clipShape(Capsule())
                    }
                    .padding(.top)
                }
                .padding(.top)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background((Color.purple)
                    .opacity(0.05)
                .cornerRadius(20)
                .ignoresSafeArea(.container,edges: .bottom)
                )
                
                
            }
            .padding(.top)
            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
            .background(Color.white)
            .transition(.opacity)
            
        }
        
    }
}

struct DetailView_Previews:PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

extension View{
    func getScreenBounds()->CGRect{
        return UIScreen.main.bounds
    }
}

