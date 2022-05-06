//
//  IntroductionView.swift
//  CookbookDemo
//
//  Created by ZhichenRen on 2022/4/26.
//

import SwiftUI

struct IntroductionView: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        if currentPage > totalPages {
            LoginRegister()
        }
        else {
            WalkthroughScreen()
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
.previewInterfaceOrientation(.portrait)
    }
}


struct WalkthroughScreen: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        
        ZStack {
            if currentPage == 1 {
                ScreenView(image: "searching", title: "提示 1", detail: "利用搜索功能，根据已有的食材寻找菜谱吧！", bgColor: Color("Color1"))
                    .transition(.scale)
            }
            if currentPage == 2 {
                ScreenView(image: "recipe", title: "提示 2", detail: "菜谱不够完善？快来上传吧！", bgColor: Color("Color1"))
                    .transition(.scale)
            }
            if currentPage == 3 {
                ScreenView(image: "food", title: "提示 3", detail: "机器学习 AR技术 新鲜食材跃然纸上", bgColor: Color("Color1"))
                    .transition(.scale)
            }
//            if currentPage == 4 {
//                ScreenView(image: "food", title: "Tip 4", detail: "AR技术 新鲜食材跃然纸上", bgColor: Color("Color1"))
//                    .transition(.scale)
//            }
            if currentPage == 4 {
                ScreenView(image: "discuss", title: "提示 4", detail: "想要分享讨论？欢迎来社区逛逛", bgColor: Color("Color1"))
                    .transition(.scale)
            }
        }
        .overlay(
            Button(action: {
                withAnimation(.easeInOut) {
                    if currentPage <= totalPages {
                        currentPage += 1
                    }
                    else {
                        currentPage = 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Color.black)
                    .clipShape(Circle())
                    .overlay(
                        ZStack{
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage)/CGFloat(totalPages))
                                .stroke(Color.black, lineWidth: 5)
                                .rotationEffect(.init(degrees: -90))
                        }
                            .padding(-15)
                    )
                    .padding(.bottom, 30)
            })
            
            ,alignment: .bottom
        )
    }
}

struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                
                if currentPage == 1 {
                    Text("欢迎!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                }
                else {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut) {
                        currentPage = 4
                    }
                }, label: {
                    Text("跳过")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer()
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300.0, height: 300.0, alignment: .center)
                .clipped()
                .cornerRadius(40)
                .padding(.bottom, 20)
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            Text(detail)
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            Spacer(minLength: 120)
        }
        .background(bgColor.cornerRadius(10).ignoresSafeArea())
    }
}

var totalPages = 4
