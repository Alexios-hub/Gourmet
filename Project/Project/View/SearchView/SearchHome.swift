//
//  SearchHome.swift
//  Food
//
//  Created by admin on 2022/4/27.
//

import SwiftUI

struct SearchHome: View {

    var animation: Namespace.ID
    @EnvironmentObject var sharedData: ShareDataModel
    @StateObject var searchData: SearchViewModel = SearchViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing:15){
                
                ZStack{
                    if searchData.searchActivated{
                        SearchBar()
                    }else{
                        SearchBar()
                            .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                    }
                }
                .frame(width: getRect().width / 1.6)
                .padding(.horizontal,25)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut){
                        searchData.searchActivated = true
                    }
                }
                
                Text("在这里发现\n你所喜欢的口味")
                    .font(.title).bold()
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal,25)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing:18){
                        ForEach(TasteType.allCases,id:\.self){type in
                            
                            TasteTypeView(type: type)
                        }
                    }
                }
                .padding(.top,28)
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing:25){
                        ForEach(searchData.filteredTastes){taste in
                            TasteCardView(taste: taste)
                        }
                    }
                    .padding(.horizontal,25)
                    .padding(.bottom)
                    .padding(.top,50)
                }
                .padding(.top,30)
                
                Button{
                    searchData.showMoreTastesOnType.toggle()
                }label:{
                    Label{
                        Image(systemName: "arrow.right")
                    }icon: {
                        Text("查看更多")
                    }
                    .font(.custom("customSize", size: 15).bold())
                    .foregroundColor(Color.purple)
                }
                .frame(maxWidth:.infinity,alignment: .trailing)
                .padding(.trailing)
                .padding(.top,10)
            }
            .padding(.vertical)
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .onChange(of: searchData.tasteType){newValue in
            searchData.filterTasteByType()
        }
        .sheet(isPresented: $searchData.showMoreTastesOnType){
            
        }content:{
            MoreTasteView()
        }
        .overlay(
            ZStack{
                if(searchData.searchActivated){
                    SearchView(animation: animation)
                        .environmentObject(searchData)
                }
            }
        )
        
    }
    @ViewBuilder
    func SearchBar()->some View{
        
        HStack(spacing:15){
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.gray)
            TextField("搜索",text: .constant(""))
                .disabled(true)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(
            Capsule()
                .strokeBorder(Color.gray,lineWidth: 0.8)
        )
    }
    
    @ViewBuilder
    func TasteCardView(taste: Taste)->some View{
        VStack(spacing: 10){
            ZStack{
                if sharedData.showDetailTaste{
                    Image(taste.tasteImages)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0)
                }else{
                    Image(taste.tasteImages)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(taste.id)\(sharedData.fromSearchView ? "SEARCH" : "IMAGE")", in: animation)
                }
            }
            .frame(width: getRect().width/2.5, height: getRect().width/2.5)
            .cornerRadius(20)
            .offset(y:-80)
            .padding(.bottom,-80)
            Text(taste.title)
                .font(.custom("customFont", size: 20))
                .fontWeight(.semibold)
                .padding(.top)
            Text(taste.subtitle)
                .font(.custom("customFont", size: 18))
                .foregroundColor(.gray)
        }
        .padding(.horizontal,20)
        .padding(.bottom , 22)
        .background(
            Color.gray.opacity(0.1)
                .cornerRadius(15)
        )
        .onTapGesture {
            withAnimation(.easeInOut){
                sharedData.detailTaste = taste
                sharedData.showDetailTaste = true
            }
        }
        .padding(.top,80)
    }
    
    @ViewBuilder
    func TasteTypeView(type:TasteType)->some View{
        Button{
            withAnimation{
                searchData.tasteType = type
            }
        }label:{
            Text(type.rawValue)
                .font(.custom("customFont", size: 25))
                .fontWeight(.semibold)
                .foregroundColor(searchData.tasteType == type ? Color.purple : Color.gray)
                .padding(.bottom,10)
                .overlay(
                    ZStack{
                        if searchData.tasteType == type{
                            Capsule()
                                .fill(Color.purple)
                                .matchedGeometryEffect(id: "TASTETAB", in: animation)
                                .frame(height:2)
                        }else{
                            Capsule()
                                .fill(Color.clear)
                                .frame(height:2)
                        }
                    }
                        .padding(.horizontal,-5)
                    ,alignment: .bottom
                )
                
        }
        .padding(.horizontal,25)
    }
    
}

struct SearchHome_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
