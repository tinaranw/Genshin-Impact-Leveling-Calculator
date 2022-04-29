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
    @State private var currentlevel:String = "0"
    @State private var desiredlevel:String = "0"
    let lightgray = Color(0xeeeeee)
    
    var body: some View {
        
        NavigationView{
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
                    VStack{
                        HStack{
                            Image("xiao")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .background(lightgray)
                                .clipShape(Circle())
                                .offset(y: offset < 0 ? getOffset() - 20 : -20)
                                .scaleEffect(getScale())
                            Spacer()
                        }
                        .padding(.top, -50)
                        .padding(.bottom, -10)
                        
                        
                        //Character Details and Form
                        VStack(alignment: .leading, spacing: 10, content: {
                            Text("Character Name")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("Character Title")
                                .foregroundColor(.gray)
                            
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                            
                            Spacer()
                                .frame(height: 20)
                            
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
                                    Text("Current Level")
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    TextField("Set level", text: $desiredlevel)
                                        .keyboardType(.numberPad)
                                    Rectangle()
                                        .frame(height: 1.0, alignment: .bottom)
                                        .foregroundColor(Color.gray)
                                    
                                }
                            }
                            
                            Spacer()
                                .frame(height: 30)
                            
                            Text("Talent Level")
                            Text("If it has a different color, subtract it by 3")
                                .foregroundColor(.green)
                            
                            
                            
                        })
                        
                        //
                        
                        
                        
                    }
                    .padding(.horizontal)
                    //Moving the view back..
                    .zIndex(-offset > 80 ? 0 : 1)
                    
                }
                
            })
                .ignoresSafeArea(.all, edges: .top)
            
        }
        .navigationTitle("Character Detail")
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



