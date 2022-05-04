//
//  TagView.swift
//  CookbookDemo
//
//  Created by ZhichenRen on 2022/5/2.
//

import SwiftUI

struct TagView: View {
    var maxLimit: Int
    @Binding var tags: [Tag]
    var fontsize: CGFloat = 16
    var body: some View {
//        if tags.isEmpty {
//            Text("快去添加菜谱教程吧！")
//                .font(.title3)
//                .frame(width: 320, height: 20, alignment: .bottom)
//                .padding(.vertical, 10)
//        }
//        else {
//            Text("目前菜谱包括这些食材")
//                .font(.title3)
//                .frame(width: 320, height: 20, alignment: .bottom)
//                .padding(.vertical, 10)
//        }

        VStack(alignment: .leading, spacing: 15) {
            ScrollView (.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(getRows(), id: \.self) {rows in
                        HStack(spacing:5) {
                            ForEach(rows, id: \.self) {row in
                                RowView(tag: row)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 80)
                .padding(.vertical)
            }
            .frame(maxWidth: .infinity)
//            .background(
//                RoundedRectangle(cornerRadius: 10)
//                    .strokeBorder(.black.opacity(0.4), lineWidth: 1)
//            )
        }
        .onChange(of: tags, perform: { newValue in
//            guard let last = tags.last else{
//                return
//            }
            for tag in tags {
                if tag.size == 0 {
                    let font = UIFont.systemFont(ofSize: fontsize)
                    let attributes = [NSAttributedString.Key.font: font]
                    let size = (tag.text as NSString).size(withAttributes: attributes)
                    
                    print(size)
                    tags[getIndex(tag: tag)].size = size.width
                }
            }
        })
    }
    
    @ViewBuilder
    func RowView(tag: Tag)->some View {
        Text(tag.text)
            .font(.system(size: fontsize))
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(
                Capsule()
                    .fill(.blue)
            )
            .foregroundColor(.white)
    }
    
    func getIndex(tag: Tag)->Int {
        let index = tags.firstIndex { currentTag in
            return tag.id == currentTag.id
        } ?? 0
        
        return index
    }
    
    func getRows()->[[Tag]] {
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        
        var totalWidth: CGFloat = 0
        
        let screenWidth: CGFloat = UIScreen.main.bounds.width - 90
        
        tags.forEach { tag in
            totalWidth += (tag.size + 32)
            
            if totalWidth > screenWidth {
                print(totalWidth)
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
                totalWidth = tag.size + 32
            }
            else {
                currentRow.append(tag)
            }
        }
        
        if !currentRow.isEmpty {
            rows.append(currentRow)
            currentRow.removeAll()
        }
        return rows
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
