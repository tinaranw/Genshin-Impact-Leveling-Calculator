//
//  LevelUpCalculator.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 28/04/22.
//

import Foundation
import SwiftUI

struct LevelUpCalculator: View {
    
    let character:Character
    
    //Data
    //Character Info
    
    //Character Level
    @State private var currentlevel = 0
    @State private var desiredlevel = 0
    
    //Normal Attack Talent Level
    @State private var currentnatalentlevel = 0
    @State private var desirednatalentlevel = 0
    
    //Elemental Skill Talent Level
    @State private var currentestalentlevel = 0
    @State private var desiredestalentlevel = 0
    
    //Burst Talent Level
    @State private var currentbursttalentlevel = 0
    @State private var desiredbursttalentlevel = 0
    
    //Character EXP
    var ascensionCost = [
        0,
        20000,
        40000,
        60000,
        80000,
        100000,
        120000
    ]
    
    //Character EXP
    var characterExp = [
        0,
        1000,
        1325,
        1700,
        2150,
        2625,
        3150,
        3725,
        4350,
        5000,
        5700,
        6450,
        7225,
        8050,
        8925,
        9825,
        10750,
        11725,
        12725,
        13775,
        14875,
        16800,
        18000,
        19250,
        20550,
        21875,
        23250,
        24650,
        26100,
        27575,
        29100,
        30650,
        32250,
        33875,
        35550,
        37250,
        38975,
        40750,
        42575,
        44425,
        46300,
        50625,
        52700,
        54775,
        56900,
        59075,
        61275,
        63525,
        65800,
        68125,
        70475,
        76500,
        79050,
        81650,
        84275,
        86950,
        89650,
        92400,
        95175,
        98000,
        100875,
        108950,
        112050,
        115175,
        118325,
        121525,
        124775,
        128075,
        131400,
        134775,
        138175,
        148700,
        152375,
        156075,
        159825,
        163600,
        167425,
        171300,
        175225,
        179175,
        183175,
        216225,
        243025,
        273100,
        306800,
        344600,
        386950,
        434425,
        487625,
        547200,
        0
    ]
    
    
    //View
    @State var offset: CGFloat = 0
    
    
    //Color
    let lightgray = Color(0xeeeeee)
    let darkgray = Color(0xb1b1b1)
    let gold = Color(0xFFBA4B)
    let purple = Color(0x9A6CDB)
    let accentBlue = Color(0xB7CADB)
    
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
                            if(character.rarity == "legendary") {
                                Image("brown")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: getRect().width, height: minY > 0 ? 180 + minY : nil, alignment: .center)
                                    .cornerRadius(0)
                            } else {
                                Image("blue")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: getRect().width, height: minY > 0 ? 180 + minY : nil, alignment: .center)
                                    .cornerRadius(0)
                            }
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
                                if(character.rarity == "legendary") {
                                    Image("background_5star")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .offset(y: offset < 0 ? getOffset() - 20 : -20)
                                        .scaleEffect(getScale())
                                    Spacer()
                                } else {
                                    Image("background_4star")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .offset(y: offset < 0 ? getOffset() - 20 : -20)
                                        .scaleEffect(getScale())
                                    Spacer()
                                }
                            }
                            .padding(.top, -50)
                            .padding(.bottom, -10)
                            HStack{
                                Image(character.profileImage)
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
                            
                            //Character Detail
                            Group{
                                Text(character.name)
                                    .font(.custom("Georgia", size: 24, relativeTo: .headline))
                                    .fontWeight(.bold)
                                
                                if(character.rarity == "legendary"){
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
                                
                                Text(character.description)
                                
                                Spacer()
                                    .frame(height: 20)
                            }
                            
                            
                            //Character Level
                            Group{
                                Text("Character Level")
                                
                                HStack{
                                    VStack{
                                        Text("Current Level")
                                            .foregroundColor(.gray)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        TextField("Set level", value: $currentlevel, format:.number)
                                            .keyboardType(.numberPad)
                                        Rectangle()
                                            .frame(height: 1.0, alignment: .bottom)
                                            .foregroundColor(Color.gray)
                                    }
                                    VStack{
                                        Text("Desired Level")
                                            .foregroundColor(.gray)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        TextField("Set level", value: $desiredlevel, format: .number)
                                            .keyboardType(.numberPad)
                                        Rectangle()
                                            .frame(height: 1.0, alignment: .bottom)
                                            .foregroundColor(Color.gray)
                                        
                                    }
                                    
                                }
                            }
                            
                            Spacer()
                                .frame(height: 10)
                            
                            //Character Talent
                            Group {
                                Group{
                                    Text("Talent Level")
                                    Text("If it has a different color, subtract it by 3")
                                        .foregroundColor(purple)
                                }
                                
                                Group{
                                    cardTalentDetail
                                    
                                    HStack{
                                        VStack{
                                            Text("Current Level")
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            TextField("Set level", value: $currentnatalentlevel, format: .number)
                                                .keyboardType(.numberPad)
                                            Rectangle()
                                                .frame(height: 1.0, alignment: .bottom)
                                                .foregroundColor(Color.gray)
                                        }
                                        VStack{
                                            Text("Desired Level")
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            TextField("Set level", value: $desirednatalentlevel, format: .number)
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
                                            TextField("Set value", value: $currentestalentlevel,format: .number)
                                                .keyboardType(.numberPad)
                                            Rectangle()
                                                .frame(height: 1.0, alignment: .bottom)
                                                .foregroundColor(Color.gray)
                                        }
                                        VStack{
                                            Text("Desired Level")
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            TextField("Set value", value: $desiredestalentlevel, format: .number)
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
                                            TextField("Set level", value: $currentbursttalentlevel, format: .number)
                                                .keyboardType(.numberPad)
                                            Rectangle()
                                                .frame(height: 1.0, alignment: .bottom)
                                                .foregroundColor(Color.gray)
                                        }
                                        VStack{
                                            Text("Desired Level")
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            TextField("Set level", value: $desiredbursttalentlevel, format: .number)
                                                .keyboardType(.numberPad)
                                            Rectangle()
                                                .frame(height: 1.0, alignment: .bottom)
                                                .foregroundColor(Color.gray)
                                            
                                        }
                                    }
                                }
                                
                                Group{
                                    Spacer()
                                        .frame(height: 30)
                                    Button("Calculate", action: calculateResources).frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
                                        .background(accentBlue)
                                        .foregroundColor(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 4))
                                    
                                }
                            }
                            
                            
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
    //VIEWS
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
    
    
    //FUNCTIONS
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
    
    func calculateCharLevel(){
        
    }
    
    func calculateTalentLevel(){
        
    }
    
    func calculateResources(){
        
        //Calculate EXP
        let startLevel = currentlevel, endLevel = desiredlevel-1;
        let totalExp = characterExp[startLevel...endLevel].reduce(0, +)
        print(startLevel)
        print(endLevel)
        print(totalExp)
        
        
        //Calculate Total Book
        //Hero's wit: 20,000
        //Adv exp: 5000
        //Wanderer's advice: 1000
        
        let heros_wit = totalExp/20000
        let heros_wit_remainder = totalExp%20000
        let adv_exp = heros_wit_remainder/5000
        let adv_exp_remainder = heros_wit_remainder%5000
        let wand_adv = adv_exp_remainder/1000
        let wand_adv_remainder = adv_exp_remainder%1000
        
        print("Total Hero's Wit: " + String(heros_wit))
        print("Total Adventurer's Exp: " + String(adv_exp))
        print("Total Wanderer's Adv: " + String(wand_adv))
        print("Total EXP Wasted: " +  String(wand_adv_remainder))
        
        //Calculate Level Up Cost
        let total_mora = totalExp/5
        print("Total Mora: " +  String(total_mora))
        
        //Calculate Ascension Cost
        var currentAscension = 0
        if (currentlevel > 80) {
            currentAscension = 7;
        } else if (currentlevel > 70 && currentlevel <= 80) {
            currentAscension = 6;
        } else if (currentlevel > 60 && currentlevel <= 70) {
            currentAscension = 5;
        } else if (currentlevel > 50 && currentlevel <= 60) {
            currentAscension = 4;
        } else if (currentlevel > 40 && currentlevel <= 50) {
            currentAscension = 3;
        } else if (currentlevel > 20 && currentlevel <= 40) {
            currentAscension = 2;
        } else if (currentlevel <= 20) {
            currentAscension = 1;
        } else {
            currentAscension = 0;
        }
        
        
        var desiredAscension = 0
        if (desiredlevel > 80) {
            desiredAscension = 7;
        } else if (desiredlevel > 70 && desiredlevel <= 80) {
            desiredAscension = 6;
        } else if (desiredlevel > 60 && desiredlevel <= 70) {
            desiredAscension = 5;
        } else if (desiredlevel > 50 && desiredlevel <= 60) {
            desiredAscension = 4;
        } else if (desiredlevel > 40 && desiredlevel <= 50) {
            desiredAscension = 3;
        } else if (desiredlevel > 20 && desiredlevel <= 40) {
            desiredAscension = 2;
        } else if (desiredlevel <= 20) {
            desiredAscension = 1;
        } else {
            desiredAscension = 0;
        }
        
        let startAsc = currentAscension, endAsc = desiredAscension-1;
        let totalAscCost = ascensionCost[startAsc...endAsc].reduce(0, +)
        print("Total Ascension Cost: " + String(totalAscCost))

        let totalResourcesMora = total_mora + totalAscCost
        print("Total Mora Needed: " + String(totalResourcesMora))
        
        
        
    }
    
    
}

struct LevelUpCalculator_Previews: PreviewProvider {
    static var previews: some View {
        LevelUpCalculator(character: characters[0])
    }
}

//Extending view to get screensize
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
}



