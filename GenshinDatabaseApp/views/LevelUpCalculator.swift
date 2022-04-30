//
//  LevelUpCalculator.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 28/04/22.
//

import Foundation
import SwiftUI

struct LevelUpCalculator: View {
    @State var offset: CGFloat = 0
    
    //Data
    //Character Level
    @State private var currentlevel:String = "0"
    @State private var desiredlevel:String = "0"
    
    //Normal Attack Talent Level
    @State private var currentnatalentlevel:String = "0"
    @State private var desirednatalentlevel:String = "0"
    
    //Elemental Skill Talent Level
    @State private var currentestalentlevel:String = "0"
    @State private var desiredestalentlevel:String = "0"
    
    //Burst Talent Level
    @State private var currentbursttalentlevel:String = "0"
    @State private var desiredbursttalentlevel:String = "0"
    
    //Color
    let lightgray = Color(0xeeeeee)
    let darkgray = Color(0xb1b1b1)
    let gold = Color(0xFFBA4B)
    let purple = Color(0x9A6CDB)
    
    var body: some View {
        
        
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack(spacing:15){
                    
                    //Header View
                    GeometryReader{proxy -> AnyView in
                        
                        //Sticky Header
                        let minY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            self.offset = minY
                        }
                        
                        
                        return AnyView(
                            ZStack{
                                Image("dummy_namecard")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: getRect().width, height: minY > 0 ? 180 + minY : nil, alignment: .center)
                                    .cornerRadius(0)
                            }
                            //Stretchy Header..
                                .frame(height: minY > 0 ? 180 + minY : nil)
                                .offset(y: minY > 0 ? -minY : -minY < 80 ? 0 : -minY - 80)
                        )
                    }
                    .frame(height: 180)
                    .zIndex(1)
                    
                    //Profile Image
                    Group{
                        VStack{
                            ZStack{
                                HStack{
                                    Image("background_5star")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .offset(y: offset < 0 ? getOffset() - 20 : -20)
                                        .scaleEffect(getScale())
                                    Spacer()
                                }
                                .padding(.top, -50)
                                .padding(.bottom, -10)
                                HStack{
                                    Image("xiao")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .offset(y: offset < 0 ? getOffset() - 20 : -20)
                                        .scaleEffect(getScale())
                                    Spacer()
                                }
                                .padding(.top, -50)
                                .padding(.bottom, -10)
                            }
                            
                            
                            //Character Details and Form
                            VStack(alignment: .leading, spacing: 10, content: {
                                Group{
                                    Text("Character Name")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    HStack(spacing:1.0){
                                        Image(systemName: "star.fill")
                                            .resizable()
                                            .frame(width: 12.0, height: 12.0)
                                            .foregroundColor(gold)
                                        Image(systemName: "star.fill")
                                            .resizable()
                                            .frame(width: 12.0, height: 12.0)
                                            .foregroundColor(gold)
                                        Image(systemName: "star.fill")
                                            .resizable()
                                            .frame(width: 12.0, height: 12.0)
                                            .foregroundColor(gold)
                                        Image(systemName: "star.fill")
                                            .resizable()
                                            .frame(width: 12.0, height: 12.0)
                                            .foregroundColor(gold)
                                        Image(systemName: "star.fill")
                                            .resizable()
                                            .frame(width: 12.0, height: 12.0)
                                            .foregroundColor(gold)
                                    }
                                    
                                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                                    
                                    Spacer()
                                        .frame(height: 20)
                                }
      
                                Group{
                                    Text("Character Level")
                                    
                                    HStack{
                                        VStack{
                                            Text("Current Level")
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            TextField("Set level", text: $currentlevel)
                                                .keyboardType(.numberPad)
                                            Rectangle()
                                                .frame(height: 1.0, alignment: .bottom)
                                                .foregroundColor(Color.gray)
                                        }
                                        VStack{
                                            Text("Desired Level")
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            TextField("Set level", text: $desiredlevel)
                                                .keyboardType(.numberPad)
                                            Rectangle()
                                                .frame(height: 1.0, alignment: .bottom)
                                                .foregroundColor(Color.gray)
                                            
                                        }
                                    }
                                }
                                
                                Spacer()
                                    .frame(height: 10)
                                
                                Group{
                                    Text("Talent Level")
                                    Text("If it has a different color, subtract it by 3")
                                        .foregroundColor(.green)
                                }
                                
                                Group{
                                    cardTalentDetail
                                    
                                    HStack{
                                        VStack{
                                            Text("Current Level")
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            TextField("Set level", text: $currentnatalentlevel)
                                                .keyboardType(.numberPad)
                                            Rectangle()
                                                .frame(height: 1.0, alignment: .bottom)
                                                .foregroundColor(Color.gray)
                                        }
                                        VStack{
                                            Text("Desired Level")
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            TextField("Set level", text: $desirednatalentlevel)
                                                .keyboardType(.numberPad)
                                            Rectangle()
                                                .frame(height: 1.0, alignment: .bottom)
                                                .foregroundColor(Color.gray)
                                            
                                        }
                                    }
                                }
                                
                                Spacer()
                                    .frame(height: 10)
                                
                                Group{
                                    cardTalentDetail
                                    
                                    HStack{
                                        VStack{
                                            Text("Current Level")
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            TextField("Set level", text: $currentestalentlevel)
                                                .keyboardType(.numberPad)
                                            Rectangle()
                                                .frame(height: 1.0, alignment: .bottom)
                                                .foregroundColor(Color.gray)
                                        }
                                        VStack{
                                            Text("Desired Level")
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            TextField("Set level", text: $desiredestalentlevel)
                                                .keyboardType(.numberPad)
                                            Rectangle()
                                                .frame(height: 1.0, alignment: .bottom)
                                                .foregroundColor(Color.gray)
                                            
                                        }
                                    }
                                }
                                
                                Spacer()
                                    .frame(height: 10)
                                
                                Group{
                                    cardTalentDetail
                                    
                                    HStack{
                                        VStack{
                                            Text("Current Level")
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            TextField("Set level", text: $currentbursttalentlevel)
                                                .keyboardType(.numberPad)
                                            Rectangle()
                                                .frame(height: 1.0, alignment: .bottom)
                                                .foregroundColor(Color.gray)
                                        }
                                        VStack{
                                            Text("Desired Level")
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            TextField("Set level", text: $desiredbursttalentlevel)
                                                .keyboardType(.numberPad)
                                            Rectangle()
                                                .frame(height: 1.0, alignment: .bottom)
                                                .foregroundColor(Color.gray)
                                            
                                        }
                                    }
                                }
                                
                                Spacer()
                                    .frame(height: 30)
                                
                                
                                
                                
                            })
                            
                            //
                            
                            
                            
                        }
                        .padding(20)
                        //Moving the view back..
                        .zIndex(-offset > 80 ? 0 : 1)
                    }
                    
                }
                
            })
                .ignoresSafeArea(.all, edges: .top)
            
        
     
    }
    
    //Profile Shrinking Effect
    func getOffset()->CGFloat{
        let progress = (-offset / 80) * 20
        return progress <= 20 ? progress : 20
    }
    
    func getScale()->CGFloat{
        let progress = -offset/80
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        return scale < 1 ? scale : 1
    }
    
    //Talent Cards
    var cardTalentDetail:some View{
        HStack{
            VStack(alignment: .leading){
                Text("Talent Name")
                    .font(.system(size: 16))
                HStack{
                    Text("Priority:")
                        .font(.system(size: 14))
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12.0, height: 12.0)
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 12.0, height: 12.0)
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 12.0, height: 12.0)
                }
            }
            Spacer()
            
        }
        .padding(.horizontal)
        .frame(width: .infinity, height: 100)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: darkgray, radius: 3, x: 0, y: 1)
    }
}

struct LevelUpCalculator_Previews: PreviewProvider {
    static var previews: some View {
        LevelUpCalculator()
    }
}

//Extending view to get screensize
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
}



