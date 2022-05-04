//
//  ContentView.swift
//  CookbookDemo
//
//  Created by ZhichenRen on 2022/4/21.
//

import SwiftUI

struct TaggerView: View {
//    @State var content = ""
//    @State var words = [String]()
    @State var text = ""
    @State var tags: [Tag] = [Tag]()
    @State var stages = [String]()
    
    var body: some View {
//        VStack {
//            Text("你说：\(content)")
//
//            TextField("输入",
//            text: $content,
//                      onEditingChanged: {
//                isEditing in print("onEditingChanged::\(content)")
//            },
//                      onCommit: {
////                print("onCommit::\(content)")
////                words.append(content)
//                words = findFoods(in: content)
//            })
//                .textFieldStyle(.roundedBorder)
//                .padding()
//
//            Text("结果是：\n")
//            List(words, id: \.self) {
//                item in HStack {
//                    Text(item)
//                }
//            }
//        }
        VStack {
            Text("添加菜谱")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.black)
                .frame(width:240, height:60)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(stages, id:\.self) {stage in
                        Text(stage)
                            .font(.system(size:20, weight: .semibold))
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder(.black.opacity(1), lineWidth: 2)
                            )
                    }
                    
                    TagView(maxLimit: 20, tags: $tags)
                        .frame(height: 200)
                        .padding(.bottom, 20)
                }
            }


            
            TextField("在这里添加步骤", text: $text)
                .font(.title3)
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(.black.opacity(0.4)
                                    , lineWidth: 1)
                )
                .environment(\.colorScheme, .dark)
                .padding(.vertical, 12)
            Button {
                text = "盘内入少量油，放姜、蒜茸、黑胡椒末、糖、盐、味精及少许芡汁用高火打2分钟调成黑椒汁待用。"
                var words = findFoods(in: text)
                for word in words {
                    if !tags.contains(where: {$0.text==word}) {
                        tags.append(Tag(text:word))
                    }
                }
                stages.append(text)
                
                text = "牛肉顶刀切成厚片，放碗中加酒、老抽、蛋清、嫩肉粉拌上劲，再加少许清油拌一下；洋葱洗净切丝。"
                words = findFoods(in: text)
                for word in words {
                    if !tags.contains(where: {$0.text==word}) {
                        tags.append(Tag(text:word))
                    }
                }
                stages.append(text)
                
                text = "将洋葱丝放入盘中，上面放牛肉，用保鲜膜覆盖，用高火打2分钟，取出淋黑椒汁将牛肉拌匀，用中火续打2分钟即可。"
                words = findFoods(in: text)
                for word in words {
                    if !tags.contains(where: {$0.text==word}) {
                        tags.append(Tag(text:word))
                    }
                }
                stages.append(text)
                
                
            } label: {
                Text("添加步骤")
                    .fontWeight(.semibold)
                    .padding(.horizontal, 45)
                    .padding(.vertical, 12)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
    }
}

struct TaggerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaggerView()
        }
    }
}
