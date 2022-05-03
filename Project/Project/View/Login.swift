//
//  ContentView.swift
//  eat
//
//  Created by 刘洪博 on 2021/12/7.
//

import SwiftUI




func findusr(email:String)->User{
    for item in users{
        if(email == item.email){
            return item
        }
    }
    return defaultuser
}



struct TitleText:View{
    var body:some View{
        Text("User Login")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom,20)
            .padding(.top,20)
}
}

struct TitleImage: View {
    @State var ul: String
    init(ul:String){
        self.ul = ul
    }
    var body: some View {
        Image("headp1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
  
    }
}
struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 50)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}


struct CShape:Shape{
    func path(in rect:CGRect) -> Path{
        return Path{
            path in
            path.move(to: CGPoint(x:rect.width,y:100))
            path.addLine(to: CGPoint(x:rect.width,y:rect.height))
            path.addLine(to: CGPoint(x:0,y:rect.height))
            path.addLine(to: CGPoint(x:0,y:0))
        }
    }
}





struct CShape1:Shape{
    func path(in rect:CGRect) -> Path{
        return Path{
            path in
            path.move(to: CGPoint(x:0,y:100))
            path.addLine(to: CGPoint(x:0,y:rect.height))
            path.addLine(to: CGPoint(x:rect.width,y:rect.height))
            path.addLine(to: CGPoint(x:rect.width,y:0))
        }
    }
}

class imgurl:ObservableObject{
    @Published var ul = String()
}

struct Login:View{
    @State var email = ""
    @State var pass = ""
    @Binding var index : Int
    @ObservedObject var ul:imgurl
//    @State var usr = User()
    @State var ifpassright = false
    @State var iftapped = false
    @StateObject var userinfo = UserInfo(user: User(), iflogin: false)

    var body: some View{

        ZStack(alignment: .bottom){
            VStack{
                HStack{
                    VStack(spacing:10){
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    Spacer(minLength: 0)
                }.padding(.top,40)
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.blue)
                        TextField("Email Address",text: self.$email).disableAutocorrection(true)
                            .onChange(of: email){
                                newValue in
                                userinfo.user = findusr(email:email)
                                self.ul.ul = userinfo.user.head_portrait
                            }
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,30)
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.blue)
                        SecureField("Password",text: $pass)
                        if(iftapped == true && ifpassright == false){
                            Image(systemName: "xmark.octagon")
                                .foregroundColor(.red)
                        }

                            
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,30)
                HStack{
                    Spacer(minLength: 0)
                    Button(action: {
                        
                    }){
                        Text("Forget Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                    .padding(.horizontal)
                    .padding(.top,30)
                }
            }
            .padding()
            .padding(.bottom,65)
//            .background(Color.gray)
            .background(Color.lavender)
            .clipShape(CShape())
            .contentShape(CShape())
            .cornerRadius(35)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .padding(.horizontal,20)
            
            Button(action: {
                iftapped = true
                if pass == userinfo.user.password{
                    ifpassright = true
                }
                else {
                    ifpassright = false
                }
            }){
              
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal,50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                    
                
            }
            .fullScreenCover(isPresented: $ifpassright, content: {BaseView()})
            
            
//            .background(NavigationLink(destination: BaseView(),isActive: $ifpassright){
//                EmptyView()})
            .offset(y:25)
            .opacity(self.index == 0 ? 1 : 0)
          
        }
    
    }
}



struct Signup:View{
    @State var email = ""
    @State var pass = ""
    @State var Repass = ""
    @Binding var index : Int
    @State var ifshow1 = false
    @State var ifshow2 = false
    @State var signtext = "SignUp"
    @State var ifsignup = false
    var body: some View{
        ZStack(alignment: .bottom){
            VStack{
                HStack{
                    Spacer(minLength: 0)
                    VStack(spacing:10){
                        Text("SIGNUP")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule().fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                   
                   
                }.padding(.top,30)
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.blue)
                        TextField("Email Address",text: self.$email)
                        if(ifshow1){
                        Image(systemName: "xmark.octagon")
                            .foregroundColor(Color.red)
                        }
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,40)
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.blue)
                        SecureField("Password",text: self.$pass)
                        if(ifshow2){
                        Image(systemName: "xmark.octagon")
                            .foregroundColor(Color.red)
                        }
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,30)
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.blue)
                        SecureField("Password",text: self.$Repass)
                        if(ifshow2){
                            
                        Image(systemName: "xmark.octagon")
                            .foregroundColor(Color.red)
                        }
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,30)
            }
            .padding()
            .padding(.bottom,65)
            //.background(Color.gray)
            .background(Color.lavender)
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            Button(action: {
                let ifsame = checkpassword(pass: pass, passagain: Repass)
                if(email == ""){
                    ifshow1 = true
                }
               else if( ifsame == false){
                  ifshow2 = true
                }
                else{
                    ifshow1 = false
                    ifshow2 = false
                  
                    signtext = "Complete!"
                    ifsignup = true
                }
                
            }){
                HStack{
                Text(signtext)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal,50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                }
            }
            .offset(y:25)
            .opacity(self.index == 1 ? 1 : 0)
            .disabled(ifsignup)
        }
    }
}


func checkpassword(pass:String,passagain:String)->Bool{
    if pass == passagain{
        return true
    }
    else {
        return false
    }
}

struct LoginRegister:View{
    @State var index = 0
   @ObservedObject var imgul = imgurl()
    var body: some View{
        NavigationView{
        GeometryReader{
            _ in
            VStack{
                Text("中国非遗美食图鉴").font(.title)
                    .fontWeight(.bold)
                    .opacity(0.9)
                    .foregroundColor(.purple)
                Spacer()
                Image(imgul.ul)
                    
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(150)
                    .padding(.bottom, 75)
            
                ZStack{
                    Signup(index: self.$index)
                        .zIndex(Double(self.index))
                    Login(index: self.$index,ul:imgul)
                        
                }
                
            }
            }
//        .background(Image("food").edgesIgnoringSafeArea(.all))//设置背景图片
        }
        
    }
}

extension Color{
    public static var lavender: Color{
        Color("lavender",bundle: nil)
    }
}
