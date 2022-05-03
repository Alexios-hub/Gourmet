//
//  Recipe.swift
//  socialClub
//
//  Created by 刘洪博 on 2022/5/1.
//

import SwiftUI

struct Recipe: Identifiable{
   var id = UUID()
    var name = String()
    var video = String()
    var history = String()
    var todo = [ToDo()]
    var description = String()
    var image = String()
    var location = String()
    var isLiked = false
    var rating = 5

}

struct ToDo : Identifiable{
    var id = UUID()
    var step = Int()
    var description = String()
}


var recipes : [Recipe] = [Recipe(name: "太谷饼", video: "", history: "history", description: "description", image: "太谷饼", location: "山西"),Recipe( name: "鲜花饼", video: "", history: "history", todo: [ToDo(step: 1, description: "打奶油，使用人工搅拌，搅拌时，顺同一方向匀速搅拌，这样搅拌产生的比较集中，能使空气更好的渗透进奶油，让曲奇烘焙出的口感不是那么干燥。"),ToDo(step: 2, description: "和面，力道要轻柔适中，方向也很有讲究，从下而上，反复不断，直至完成。"),ToDo(step: 3, description: "成形，整形时，用手轻压成型。"),ToDo(step: 4, description: "烘焙，烘焙温度保持在恒温200度，虽然延长了烘焙时长，但烘焙出的曲奇口感松软、干湿合宜，吃了更不容易上火。"),ToDo(step: 5, description: "冷却,对冷却温度的要求更为严格，在室温下自然冷却却至曲奇中心温度为35度。即确保了不会因冷却不足，而导致容易发霉；也确保了冷却过久，导致外来菌浸入。"),ToDo(step: 6, description: "装盒,包装盒印刷符合欧盟食品安全标准，在铝盒内还特制石头纸内盒。冷却后的曲奇放入石头纸内盒，并附赠精美的产品说明书后才密封封装，封装完成时，一盒爱的曲奇就算烘焙完成了。另外，为了防止松软的曲奇在运输中破碎，每盒曲奇还特制密封的外盒充气袋，每个细节成分考虑。")], description: "鲜花饼是一款以云南特有的食用玫瑰花入料的酥饼，是具有云南特色的云南经典点心代表。鲜花饼在云南当地烘焙品牌均有销售。每年4月，鲜花饼的上市早已成为当地人民的共同期待，排着长队等待购买新鲜上市的鲜花饼在当地早已司空见惯。", image: "鲜花饼", location: "云南",isLiked: true),Recipe(name: "鱼糕", video: "", history: "history", description: "description", image: "鱼糕", location: "湖北"),Recipe( name: "热干面", video: "", history: "history",  description: "description", image: "热干面", location: "武汉",isLiked: true)
                          ,Recipe( name: "五芳斋粽子", video: "", history: "history",  description: "description", image: "五芳斋粽子", location: "浙江")]




