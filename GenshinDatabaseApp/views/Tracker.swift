//
//  Tracker.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 29/04/22.
//

import SwiftUI

struct Tracker: View {
    //Color
    let darkgray = Color(0xb1b1b1)
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
//                HStack{
//                    VStack(alignment: .leading){
//                        Text("Welcome Back,")
//                            .foregroundColor(.secondary)
//                            .font(.subheadline)
//                        Text("Traveler")
//                            .font(.largeTitle)
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    ZStack{
//                        HStack{
//                            Image("brownsquare")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 80, height: 80)
//                                .clipShape(Circle())
//
//                        }
//                        .padding(.top, -10)
//                        HStack{
//                            Image("xiao")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 80, height: 80)
//                                .clipShape(Circle())
//
//                        }
//                        .padding(.top, -10)
//                    }
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//
//                }
//                .padding(.horizontal)
                
                HStack{
                    HStack{
                        Image("resin")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Text("148/160")
                        
                    }
                    Spacer()
                    HStack{
                        Text("13 hours left")
                        Image(systemName: "chevron.right")
                    }
                    
                }
                .padding(.horizontal)
                .frame(width: .infinity, height: 100)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: darkgray, radius: 3, x: 0, y: 1)
                
                
                
                
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
        }
        
        
    }
    
}

struct Tracker_Previews: PreviewProvider {
    static var previews: some View {
        Tracker()
    }
}
