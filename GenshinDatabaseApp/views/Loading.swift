//
//  Loading.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 12/05/22.
//

import SwiftUI

struct Loading: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    let lightBlue = Color(0xB7CADB)
    
    var body: some View {
        if isActive{
            OnBoarding()
                .preferredColorScheme(.light)
        } else {
            ZStack{
                lightBlue.ignoresSafeArea()
                VStack{
                    VStack{
                        Image("loading")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150.0, height:150.0)
                        Text("myDodoco")
                            .font(Font.custom("Georgia", size: 26))
                            .foregroundColor(.black.opacity(0.80))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration:1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation{
                            self.isActive = true
                        }
                        
                    }
                }
            }
            
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
