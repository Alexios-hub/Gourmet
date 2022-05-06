//
//  SearchView.swift
//  Food
//
//  Created by admin on 2022/4/28.
//

import SwiftUI

struct SearchView: View {
    var animation: Namespace.ID
    @EnvironmentObject var sharedData: ShareDataModel
    @EnvironmentObject var searchData: SearchViewModel
    @FocusState var startTF: Bool
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing:20){
                Button{
                    withAnimation{
                        searchData.searchActivated = false
                    }
                    searchData.searchText = ""
                    sharedData.fromSearchView = false
                }label:{
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.black.opacity(0.7))
                }
                
                HStack(spacing:15){
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    TextField("搜索",text: $searchData.searchText)
                        .focused($startTF)
                        .disableAutocorrection(true)
                }
                .padding(.vertical)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(Color.purple,lineWidth: 1.5)
                )
                .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing,20)
            }
            .padding([.horizontal])
            .padding(.top)
            .padding(.bottom,10)
            
            if let tastes = searchData.searchedTastes{
                if tastes.isEmpty{
                    Text("没有找到想要的结果哦😭")
                        .font(.custom("customFont",size:30).bold())
                        .fontWeight(.bold)
                        .padding(.vertical)
                }else{
                    ScrollView(.vertical,showsIndicators: false){
                        VStack(spacing:0){
                            Text("找到 \(tastes.count)个结果")
                                .font(.custom("customFont",size:30).bold())
                                .fontWeight(.bold)
                                .padding(.vertical)
                            StaggeredGrid(columns: 2,spacing: 20, list: tastes){taste in
                                
                                TasteCardView(taste: taste)
                            }
                        }
                        .padding()
                    }
                }
            }else{
                ProgressView()
                    .padding(.top,30)
                    .opacity(searchData.searchText == "" ? 0 : 1)
            }
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .background(.white)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+0.1){
                startTF = true
            }
        }
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
                        .matchedGeometryEffect(id: "\(taste.id)SEARCH", in: animation)
                }
            }
                .cornerRadius(20)
                .offset(y:-50)
                .padding(.bottom,-50)
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
        .padding(.top,50)
        .onTapGesture {
            withAnimation(.easeInOut){
                sharedData.detailTaste = taste
                sharedData.fromSearchView = true
                sharedData.showDetailTaste = true
            }
        }
    }
  
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
