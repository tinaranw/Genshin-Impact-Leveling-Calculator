//
//  ContentView.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 27/04/22.
//

import SwiftUI

struct ContentView: View {
    
    //Color Palette
    let lightgray = Color(0xeeeeee)
    
    var body: some View {
        TabView {
            NavigationView{
                Tracker()
                    .navigationTitle("Tracker")
                    .navigationBarHidden(true)
                
                
            }
            .tabItem {
                Label("Tracker", systemImage: "calendar")
            }
            
            NavigationView{
                CharacterList(chosenCharacter: characters[1])
                    .navigationTitle("Characters")
                
            }
            .tabItem {
                Label("Calculator", systemImage: "number")
            }
            
            NavigationView{
                Bookmarks()
                    .navigationTitle("Bookmarks")
                
            }
            .tabItem {
                Label("Bookmarks", systemImage: "bookmark.fill")
            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}
