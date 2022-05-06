//
//  SearchViewModel.swift
//  Food
//
//  Created by admin on 2022/4/28.
//

import SwiftUI
import Combine
class SearchViewModel: ObservableObject {
    @Published var tasteType: TasteType = .solid
    
    @Published var tastes: [Taste] = [
        Taste(type: .solid, title: "安康酸菜两掺面", subtitle: "酸", description: "一般酸", tasteImages: "安康酸菜两掺面"),
        Taste(type: .solid, title: "贵州酸汤鱼", subtitle: "酸", description: "一般酸", tasteImages: "贵州酸汤鱼"),
        Taste(type: .sweet, title: "蜂蜜麻糖", subtitle: "很甜", description: "description", tasteImages: "蜂蜜麻糖"),
        Taste(type: .sweet, title: "杨村糕干", subtitle: "甜", description: "一般甜", tasteImages: "杨村糕干"),
        Taste(type: .bitter, title: "广东杏仁饼", subtitle: "苦", description: "一般酸", tasteImages: "广东杏仁饼"),
        Taste(type: .bitter, title: "青岛苦肠", subtitle: "苦", description: "一般苦", tasteImages: "青岛苦肠"),
        Taste(type: .spicy, title: "新疆椒麻鸡", subtitle: "辣", description: "一般酸", tasteImages: "新疆椒麻鸡"),
        Taste(type: .spicy, title: "古蔺麻辣鸡", subtitle: "辣", description: "一般辣", tasteImages: "古蔺麻辣鸡"),
        Taste(type: .solid, title: "柳州螺蛳粉", subtitle: "酸", description: "一般酸", tasteImages: "柳州螺蛳粉"),
        Taste(type: .solid, title: "梅花烙酸蘸儿", subtitle: "酸", description: "一般酸", tasteImages: "梅花烙酸蘸儿"),
    ]
    
    @Published var filteredTastes:[Taste] = []
    
    @Published var showMoreTastesOnType: Bool = false
    
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var searchedTastes: [Taste]?
    var searchCancellable: AnyCancellable?
    init(){
        filterTasteByType()
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: {str in
                if str != ""{
                    self.filterTasteBySearch()
                }else{
                    self.searchedTastes = nil
                }
            })
    }
    func filterTasteByType(){
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.tastes
                .lazy
                .filter{taste in
                    return taste.type == self.tasteType
                }
                .prefix(4)
            DispatchQueue.main.async {
                self.filteredTastes = results.compactMap({taste in
                    return taste
                })
            }
        }
    }
    func filterTasteBySearch(){
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.tastes
                .lazy
                .filter{taste in
                    return taste.title.contains(self.searchText)
                }
            DispatchQueue.main.async {
                self.searchedTastes = results.compactMap({taste in
                    return taste
                })
            }
        }
    }
}

