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
        else if(mondstadtBook == "all" || liyueBook == "all" || inazumaBook == "all"){
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
                    .accessibility(label: Text("Welcome Back, Traveler!"))
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
                    Text("Today's Talent Books")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                    
                    HStack(spacing: 10){
                        
                        if(mondstadtBook == "all"){
                            HStack{
                                VStack(alignment: .leading){
                                    Text("All domains are open!")
                                        .font(.system(size: 16))
                                }
                                Spacer()
                                
                            }
                            .padding(.horizontal)
                            .frame(width: .infinity, height: 100)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: darkgray, radius: 3, x: 0, y: 1)
                            .accessibility(label: Text("All domains are open on Sunday!"))
                        } else {
                            //Monstadt
                            VStack {
                                ZStack{
                                    Image("brownsquare")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Image(mondstadtBook)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(20)

                                }
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(mondstadtBook)
                                            .font(.custom("Georgia", size: 14, relativeTo: .headline))
                                            .foregroundColor(.black)
                                        Text("at Mondstatd")
                                            .font(.system(size: 12))
                                            .lineLimit(1)
                                        
                                    }
                                    .layoutPriority(100)

                                    Spacer()
                                }
                                .padding(.bottom, 12)
                                .padding(.top, 2)
                                .padding(.horizontal)
                                
                                
                            }
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: darkgray, radius: 3, x: 0, y: 1)
                            .accessibility(label: Text("\(mondstadtBook) is available now in Mondstatd."))
                            
                            //Liyue
                            VStack {
                                ZStack{
                                    Image("brownsquare")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Image(liyueBook)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(20)

                                }
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(liyueBook)
                                            .font(.custom("Georgia", size: 14, relativeTo: .headline))
                                            .foregroundColor(.black)
                                        Text("at Liyue")
                                            .foregroundColor(.black)
                                            .font(.system(size: 12))
                                            .lineLimit(1)
                                        
                                    }
                                    .layoutPriority(100)

                                    Spacer()
                                }
                                .padding(.bottom, 12)
                                .padding(.top, 2)
                                .padding(.horizontal)
                                
                            }
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: darkgray, radius: 3, x: 0, y: 1)
                            .accessibility(label: Text("\(liyueBook) is available now in Liyue."))
                            
                            //Inazuma
                            VStack {
                                ZStack{
                                    Image("brownsquare")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Image(inazumaBook)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(20)

                                }
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(inazumaBook)
                                            .font(.custom("Georgia", size: 14, relativeTo: .headline))
                                            .foregroundColor(.black)
                                        Text("at Inazuma")
                                            .foregroundColor(.black)
                                            .font(.system(size: 12))
                                            .lineLimit(1)
                                        
                                    }
                                    .layoutPriority(100)

                                    Spacer()
                                }
                                .padding(.bottom, 12)
                                .padding(.top, 2)
                                .padding(.horizontal)
                                
                            }
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: darkgray, radius: 3, x: 0, y: 1)
                            .accessibility(label: Text("\(inazumaBook) is available now in Inazuma."))
                        }
                        
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text("Today's Characters")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                    
                    ForEach(characters){chara  in
                        if(bookSync(book: chara.talentBooks) == true){
                            HStack{
                                ZStack{
                                    HStack{
                                        if(chara.vision == "anemo"){
                                            Image("anemosquare")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 90, height: 90)
                                                .clipShape(Circle())
                                        } else if(chara.vision == "geo"){
                                            Image("geosquare")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 90, height: 90)
                                                .clipShape(Circle())
                                        } else if(chara.vision == "pyro"){
                                            Image("pyrosquare")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 90, height: 90)
                                                .clipShape(Circle())
                                        } else if(chara.vision == "electro"){
                                            Image("electrosquare")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 90, height: 90)
                                                .clipShape(Circle())
                                        } else if(chara.vision == "cryo"){
                                            Image("cryosquare")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 90, height: 90)
                                                .clipShape(Circle())
                                        } else if(chara.vision == "hydro"){
                                            Image("hydrosquare")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 90, height: 90)
                                                .clipShape(Circle())
                                        }
                                    }
                                    HStack{
                                        Image(chara.profileImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 90, height: 90)
                                            .clipShape(Circle())
                                    }
                                }
                                Spacer()
                                    .frame(width: 20)
                                VStack(alignment: .leading){
                                    HStack{
                                        Text(chara.name)
                                            .lineSpacing(0)
                                            .font(.custom("Georgia", size: 16, relativeTo: .headline))
                                            .foregroundColor(.black)
                                           
                                        Spacer()
                                        Image(chara.vision)
                                            .resizable()
                                            .scaledToFill() // <=== Saves aspect ratio
                                            .frame(width: 30.0, height:30.0)
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
                                    }.padding(.top, -10)
                                    HStack{
                                        
                                        Image(chara.talentBooks)
                                            .resizable()
                                            .scaledToFill()
                                            .padding(8)
                                            .background(lightgray)
                                            .frame(width: 40.0, height: 40.0)
                                            .clipShape(RoundedRectangle(cornerRadius: 4))
                                            .overlay(RoundedRectangle(cornerRadius: 2).stroke(lineWidth: 0))
                                        Image(chara.normalBossDropsImage)
                                            .resizable()
                                            .scaledToFill()
                                            .padding(8)
                                            .background(lightgray)
                                            .frame(width: 40.0, height: 40.0)
                                            .clipShape(RoundedRectangle(cornerRadius: 4))
                                            .overlay(RoundedRectangle(cornerRadius: 2).stroke(lineWidth: 0))
                                        Image(chara.ascensionMatsImage)
                                            .resizable()
                                            .scaledToFill()
                                            .padding(8)
                                            .background(lightgray)
                                            .frame(width: 40.0, height: 40.0)
                                            .clipShape(RoundedRectangle(cornerRadius: 4))
                                            .overlay(RoundedRectangle(cornerRadius: 2).stroke(lineWidth: 0))
                                        Image(chara.weeklyBossDropsImage)
                                            .resizable()
                                            .scaledToFill()
                                            .padding(8)
                                            .background(lightgray)
                                            .frame(width: 40.0, height: 40.0)
                                            .clipShape(RoundedRectangle(cornerRadius: 4))
                                            .overlay(RoundedRectangle(cornerRadius: 2).stroke(lineWidth: 0))
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
                                .frame(height: 15)
                            
                            
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
