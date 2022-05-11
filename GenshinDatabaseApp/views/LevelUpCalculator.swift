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
    
//    @ObservedObject var result:Result
    
    //Data
    //Character Info
    
    //Character Level
    @State private var currentlevel = 1
    @State private var desiredlevel = 1
    
    //Character Mora Cost
    @State private var totallevelupcost = 0
    
    //Character EXP Books
    @State private var heros_wit = 0
    @State private var adv_exp = 0
    @State private var wand_adv = 0
    
    //Character Normal Boss Materials
    @State private var normalbossmaterial = 0
    
    var normalbossdrops = [
        0,
        0,
        2,
        4,
        8,
        12,
        20
    ]
    
    //Character Local Materials
    @State private var localmaterial = 0
    
    var localspecialties = [
        0,
        3,
        10,
        20,
        30,
        45,
        60
    ]
    
    
    
    //Normal Attack Talent Level
    @State private var currentnatalentlevel = 1
    @State private var desirednatalentlevel = 1
    
    //Elemental Skill Talent Level
    @State private var currentestalentlevel = 1
    @State private var desiredestalentlevel = 1
    
    //Burst Talent Level
    @State private var currentbursttalentlevel = 1
    @State private var desiredbursttalentlevel = 1
    
    //Crown of Insight
    @State private var na_crown = 0
    @State private var es_crown = 0
    @State private var burst_crown = 0
    @State private var totalcrown = 0
    
    //Talent Boss Drops
    @State private var na_talentbossdrops = 0
    @State private var es_talentbossdrops = 0
    @State private var burst_talentbossdrops = 0
    @State private var totaltalentbossdrops = 0
    
    //Talent Cost
    @State private var na_talentcost = 0
    @State private var es_talentcost = 0
    @State private var burst_talentcost = 0
    @State private var totaltalentcost = 0
    
    //Talent Common Books
    @State private var na_talentbooks = 0
    @State private var es_talentbooks = 0
    @State private var burst_talentbooks = 0
    @State private var totaltalentbooks = 0
    
    var talentBossDrops = [
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1,
        2,
        2,
        0
    ]
    
    //Talent Materials
    var talentMaterials = [
        0,
        6,
        3,
        4,
        6,
        9,
        4,
        6,
        9,
        12,
        0
    ]
    
    //Talent Books
    var talentBooks = [
        0,
        3,
        6,
        12,
        18,
        27,
        36,
        54,
        108,
        144,
        0
    ]
    
    //Character Talent Cost
    var talentCost = [
        0,
        12500,
        17500,
        25000,
        30000,
        37500,
        120000,
        260000,
        450000,
        700000,
        0
        
    ]
    
    //Character Ascension Cost
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
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text(character.attack.name)
                                                .font(.system(size: 16))
                                            HStack{
                                                Text("Priority:")
                                                    .font(.system(size: 14))
                                                ForEach((1...character.attack.priority), id: \.self) { priority in
                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .frame(width: 12.0, height: 12.0)
                                                            }
                                                if(character.attack.priority < 5){
                                                    ForEach((1...(5-character.attack.priority)), id: \.self) { priority in
                                                        Image(systemName: "star")
                                                            .resizable()
                                                            .frame(width: 12.0, height: 12.0)
                                                                }
                                                }
                                            }
                                        }
                                        Spacer()
                                        
                                    }
                                    .padding(.horizontal)
                                    .frame(width: .infinity, height: 100)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: darkgray, radius: 3, x: 0, y: 1)
                                    
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
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text(character.elementalSkill.name)
                                                .font(.system(size: 16))
                                            HStack{
                                                Text("Priority:")
                                                    .font(.system(size: 14))
                                                ForEach((1...character.elementalSkill.priority), id: \.self) { priority in
                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .frame(width: 12.0, height: 12.0)
                                                            }
                                                if(character.elementalSkill.priority < 5){
                                                    ForEach((1...(5-character.elementalSkill.priority)), id: \.self) { priority in
                                                        Image(systemName: "star")
                                                            .resizable()
                                                            .frame(width: 12.0, height: 12.0)
                                                                }
                                                }
                                            }
                                        }
                                        Spacer()
                                        
                                    }
                                    .padding(.horizontal)
                                    .frame(width: .infinity, height: 100)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: darkgray, radius: 3, x: 0, y: 1)
                                    
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
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text(character.burst.name)
                                                .font(.system(size: 16))
                                            HStack{
                                                Text("Priority:")
                                                    .font(.system(size: 14))
                                                
                                                ForEach((1...character.burst.priority), id: \.self) { priority in
                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .frame(width: 12.0, height: 12.0)
                                                            }
                                                if(character.burst.priority < 5){
                                                    ForEach((1...(5-character.burst.priority)), id: \.self) { priority in
                                                        Image(systemName: "star")
                                                            .resizable()
                                                            .frame(width: 12.0, height: 12.0)
                                                                }
                                                }
                                            }
                                        }
                                        Spacer()
                                        
                                    }
                                    .padding(.horizontal)
                                    .frame(width: .infinity, height: 100)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: darkgray, radius: 3, x: 0, y: 1)
                                    
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
    
    func calculateResources(){
        
        //Calculate EXP
        let startLevel = currentlevel, endLevel = desiredlevel-1;
        var total_mora = 0
        if(desiredlevel == 1){
            print("Total Books: 0")
            print("Total Mora: 0")
        } else {
            let totalExp = characterExp[startLevel...endLevel].reduce(0, +)
            heros_wit = totalExp/20000
            let heros_wit_remainder = totalExp%20000
            adv_exp = heros_wit_remainder/5000
            let adv_exp_remainder = heros_wit_remainder%5000
            wand_adv = adv_exp_remainder/1000
            let wand_adv_remainder = adv_exp_remainder%1000
            
            print("Total Hero's Wit: " + String(heros_wit))
            print("Total Adventurer's Exp: " + String(adv_exp))
            print("Total Wanderer's Adv: " + String(wand_adv))
            print("Total EXP Wasted: " +  String(wand_adv_remainder))
            
            //Calculate Level Up Cost
            total_mora = totalExp/5
        }
        
        
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
        var totalAscCost = 0
        if(desiredAscension == 1){
            print("Total Ascension Cost: 0")
        } else {
            totalAscCost = ascensionCost[startAsc...endAsc].reduce(0, +)
            normalbossmaterial = normalbossdrops[startAsc...endAsc].reduce(0, +)
            localmaterial = localspecialties[startAsc...endAsc].reduce(0, +)
            
        }
        totallevelupcost = total_mora + totalAscCost
        print("Total Mora Needed for Leveling Up a Character: " + String(totallevelupcost))
        print("Total Normal Boss Materials Needed for Leveling Up a Character: " + String(normalbossmaterial))
        print("Total Local Materials Needed for Leveling Up a Character: " + String(localmaterial))
        
        //Calculate Talent
        //Calculate Normal Attack Talent Level
        let startAttackTalent = currentnatalentlevel, endAttackTalent = desirednatalentlevel-1;
        if(desirednatalentlevel == 1){
        } else {
            na_talentcost = talentCost[startAttackTalent...endAttackTalent].reduce(0, +)
            
            //Calculate Normal Talent Books
            let startAttackBook = currentnatalentlevel, endAttackBook = desirednatalentlevel-1;
            na_talentbooks = talentBooks[startAttackBook...endAttackBook].reduce(0, +)
            
            //Crown
            if(desirednatalentlevel == 10){
                na_crown = 1
            }
            
            //Weekly Boss Drops
            let startAttackBossDrops = currentnatalentlevel, endAttackBossDrops = desirednatalentlevel-1;
            na_talentbossdrops = talentBossDrops[startAttackBossDrops...endAttackBossDrops].reduce(0, +)
        }
        
        //Calculate Elemental Skill Talent Level
        let startElementalTalent = currentestalentlevel, endElementalTalent = desiredestalentlevel-1;
        if(desiredestalentlevel == 1){
        } else {
            es_talentcost = talentCost[startElementalTalent...endElementalTalent].reduce(0, +)
            
            //Calculate Elemental Talent Books
            let startElementalBook = currentestalentlevel, endElementalBook = desiredestalentlevel-1;
            es_talentbooks = talentBooks[startElementalBook...endElementalBook].reduce(0, +)
            
            //Crown
            if(desiredestalentlevel == 10){
                es_crown = 1
            }
            
            //Weekly Boss Drops
            let startElementalBossDrops = currentestalentlevel, endElementalBossDrops = desiredestalentlevel-1;
            es_talentbossdrops = talentBossDrops[startElementalBossDrops...endElementalBossDrops].reduce(0, +)
        }
        
        //Calculate Burst Talent Level
        let startBurstTalent = currentbursttalentlevel, endBurstTalent = desiredbursttalentlevel-1;
        if(desiredbursttalentlevel == 1){
        } else {
            burst_talentcost = talentCost[startBurstTalent...endBurstTalent].reduce(0, +)
            
            //Calculate Normal Talent Books
            let startBurstBook = currentbursttalentlevel, endAttackBook = desiredbursttalentlevel-1;
            burst_talentbooks = talentBooks[startBurstBook...endAttackBook].reduce(0, +)
            
            //Crown
            if(desiredbursttalentlevel == 10){
                burst_crown = 1
            }
            
            //Weekly Boss Drops
            let startBurstBossDrops = currentbursttalentlevel, endBurstBossDrops = desiredbursttalentlevel-1;
            burst_talentbossdrops = talentBossDrops[startBurstBossDrops...endBurstBossDrops].reduce(0, +)
        }
        
        
        //Talent: Mora, Crown, Boss Drops,Books
        
        //Calculate Total Books
        totaltalentbooks = na_talentbooks + es_talentbooks + burst_talentbooks
        print("Total Common Books Needed for Leveling up Talents: " + String(totaltalentbooks))
        
        //Calculate Total Talent Cost
        totaltalentcost = na_talentcost + es_talentcost + burst_talentcost
        print("Total Mora Needed for Leveling up Talents: " + String(totaltalentcost))
        
        //Calculate Total Crown
        totalcrown = na_crown + es_crown + burst_crown
        print("Total Crown Needed for Leveling up Talents: " + String(totalcrown))
        
        //Calculate Total Boss Drops
        totaltalentbossdrops = na_talentbossdrops + es_talentbossdrops + burst_talentbossdrops
        print("Total Boss Drops Needed for Leveling up Talents: " + String(totaltalentbossdrops))
        
        
        
//        result.character = character
//        result.characterCost.heros_wit = heros_wit
//        result.characterCost.adv_exp = adv_exp
//        result.characterCost.wand_adv = wand_adv
//        result.characterCost.mora = totallevelupcost
//        result.characterCost.normal_boss_drops = normalbossmaterial
//        result.characterCost.local_mat = localmaterial
//        result.talentCost.mora = totaltalentcost
//        result.talentCost.common_books = totaltalentbooks
//        result.talentCost.crown = totalcrown
//        result.talentCost.weekly_boss_drops = totaltalentbossdrops
//
        
 
        
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



