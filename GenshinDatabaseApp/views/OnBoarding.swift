//
//  OnBoarding.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 13/05/22.
//

import SwiftUI

struct OnBoarding: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            ContentView()
                .preferredColorScheme(.light)
        } else {
            ZStack(alignment: .leading){
                Image("onboarding")
                    .resizable()
                    .ignoresSafeArea()
                VStack(alignment: .leading){
                    Spacer()
                    Image(systemName: "suit.heart.fill")
                    Spacer()
                        .frame(height: 10)
                    Text("myDodoco")
                        .font(.custom("Georgia", size: 40, relativeTo: .headline))
                        .fontWeight(.bold)
                    Spacer()
                        .frame(height: 10)
                    Text("Your Own Genshin Impact Character Ascension and Talent Calculator")
                        .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 70)
                        .padding(.bottom, 20)
                    Button(action: {
                        isActive = true
                    }){
                        Image(systemName: "chevron.right")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    .clipShape(Circle())
                    .buttonStyle(.bordered)
                    Spacer()
                    Text("© All rights reserved by miHoYo. Other properties belong to their respective owners.")
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 70)
                        
                }
                .padding()
            }
        }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
