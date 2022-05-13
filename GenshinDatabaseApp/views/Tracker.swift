//
//  Tracker.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 29/04/22.
//

import SwiftUI

struct Tracker: View {
    //Color
    let lightgray = Color(0xeeeeee)
    let darkgray = Color(0xb1b1b1)
    let gold = Color(0xFFBA4B)
    let purple = Color(0x9A6CDB)
    let accentBlue = Color(0xB7CADB)
    
    //Talent
    @State private var mondstadtBook = ""
    @State private var liyueBook = ""
    @State private var inazumaBook = ""
    
    let day = Calendar.current.component(.weekday, from: Date())
    
    func checkDay(){
        if(day == 1) {
            mondstadtBook = "all"
            liyueBook = "all"
            inazumaBook = "all"
        } else if(day == 2 || day == 5){
            mondstadtBook = "Freedom"
            liyueBook = "Prosperity"
            inazumaBook = "Transience"
        } else if(day == 3 || day == 6){
            mondstadtBook = "Resistance"
            liyueBook = "Diligence"
            inazumaBook = "Elegance"
        } else if(day == 4 || day == 7){
            mondstadtBook = "Ballad"
            liyueBook = "Gold"
            inazumaBook = "Light"
        }
    }
    
    func bookSync (book : String) ->Bool{
        if(book == mondstadtBook){
            return true
        }
        else if(book == liyueBook){
            return true
        }
        else if(book == inazumaBook){
            return true
        }
        else{
            return false
        }
        
    }
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment: .leading){
                        Text("Welcome Back,")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                        Text("Traveler")
                            .font(.custom("Georgia", size: 30, relativeTo: .headline))
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    ZStack{
                        HStack{
                            Image("bluesquare")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                        }
                        .padding(.top, -10)
                        HStack{
                            Image("dodoco")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                        }
                        .padding(.top, -10)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    
                    
                }
                
                Spacer()
                    .frame(height: 20)
                
                VStack(alignment: .leading){
                    Text("Today's Schedule")
                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    ForEach(characters){chara  in
                        if(bookSync(book: chara.talentBooks) == true){
                            HStack{
                                ZStack{
                                    HStack{
                                        if(chara.rarity == "legendary"){
                                            Image("brownsquare")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 80, height: 80)
                                                .clipShape(Circle())
                                        } else {
                                            Image("bluesquare")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 80, height: 80)
                                                .clipShape(Circle())
                                        }
                                    }
                                    HStack{
                                        Image(chara.profileImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                    }
                                }
                                Spacer()
                                    .frame(width: 20)
                                VStack(alignment: .leading){
                                    HStack{
                                        Text(chara.name)
                                            .font(.custom("Georgia", size: 15, relativeTo: .headline))
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                        Image(chara.vision)
                                            .resizable()
                                            .scaledToFill() // <=== Saves aspect ratio
                                            .frame(width: 20.0, height:20)
                                    }
                                    HStack{
                                        if(chara.rarity == "legendary"){
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
                                        } else {
                                            HStack(spacing:1.0){
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 12.0, height: 12.0)
                                                    .foregroundColor(purple)
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 12.0, height: 12.0)
                                                    .foregroundColor(purple)
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 12.0, height: 12.0)
                                                    .foregroundColor(purple)
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 12.0, height: 12.0)
                                                    .foregroundColor(purple)
                                            }
                                        }
                                    }
                                    HStack{
                                        Image(chara.talentBooks)
                                            .resizable()
                                            .scaledToFill() // <=== Saves aspect ratio
                                            .frame(width: 30.0, height:30)
                                        Image(chara.normalBossDropsImage)
                                            .resizable()
                                            .scaledToFill() // <=== Saves aspect ratio
                                            .frame(width: 40.0, height:40)
                                        Image(chara.ascensionMatsImage)
                                            .resizable()
                                            .scaledToFill() // <=== Saves aspect ratio
                                            .frame(width: 35.0, height:35)
                                        Image(chara.weeklyBossDropsImage)
                                            .resizable()
                                            .scaledToFill() // <=== Saves aspect ratio
                                            .frame(width: 40.0, height:40)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                                
                                
                            }
                            .padding(.horizontal)
                            .frame(width: .infinity, height: 120)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: darkgray, radius: 3, x: 0, y: 1)
                            
                            Spacer()
                                .frame(height: 20)
                            
                            
                        }
                    }
                    
                }
                
                
                
                
            }
            .padding(.horizontal)
            .padding(.top, 28)
            .onAppear { checkDay() }
            
        }
        
        
    }
    
}

struct Tracker_Previews: PreviewProvider {
    static var previews: some View {
        Tracker()
    }
}
