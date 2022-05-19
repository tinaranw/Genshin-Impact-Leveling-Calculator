//
//  ResultView.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 10/05/22.
//

import SwiftUI

struct ResultView: View {
    var character:Character
    var result:Result
    
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
                                    .accessibility(label: Text("\(character.name) is a 5-star character."))
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
                                    .accessibility(label: Text("\(character.name) is a 4-star character."))
                                }
                                Text(character.description)
                                
                                Spacer()
                                    .frame(height: 10)
                                
                                
                                //Character Resources
                                Group{
                                    Text("Character Resources")
                                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                                    
                                    VStack{
                                        Group{
                                            HStack{
                                                Image("heroswit")
                                                    .resizable()
                                                    .scaledToFill() // <=== Saves aspect ratio
                                                    .frame(width: 40.0, height:40)
                                                
                                                Text("Hero's Wit")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                HStack{
                                                    Text("x")
                                                    Text(String(result.chara_heros_wit))
                                                }
                                                
                                            }
                                            .accessibility(label: Text("\(result.chara_heros_wit) Hero's Wit needed."))
                                            Divider()
                                        }
                                        
                                        Group{
                                            HStack{
                                                Image("advexp")
                                                    .resizable()
                                                    .scaledToFill() // <=== Saves aspect ratio
                                                    .frame(width: 40.0, height:40)
                                                
                                                Text("Adventurer's Experience")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                HStack{
                                                    Text("x")
                                                    Text(String(result.chara_adv_exp))
                                                }
                                                
                                            }
                                            .accessibility(label: Text("\(result.chara_adv_exp) Adventurer's Experience needed."))
                                            Divider()
                                        }
                                        
                                        Group{
                                            HStack{
                                                Image("wandadv")
                                                    .resizable()
                                                    .scaledToFill() // <=== Saves aspect ratio
                                                    .frame(width: 40.0, height:40)
                                                
                                                Text("Wanderer's Advice")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                HStack{
                                                    Text("x")
                                                    Text(String(result.chara_wand_adv))
                                                }
                                                
                                            }
                                            .accessibility(label: Text("\(result.chara_wand_adv) Wanderer's Advice needed."))
                                            Divider()
                                        }
                                        
                                        Group{
                                            HStack{
                                                Image("mora")
                                                    .resizable()
                                                    .scaledToFill() // <=== Saves aspect ratio
                                                    .frame(width: 40.0, height:40)
                                                
                                                Text("Mora")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                HStack{
                                                    Text("x")
                                                    Text(String(result.chara_mora))
                                                }
                                                .accessibility(label: Text("\(result.chara_mora) Mora needed."))
                                            }
                                            Divider()
                                        }
                                        
                                        Group{
                                            HStack{
                                                Image(character.normalBossDropsImage)
                                                    .resizable()
                                                    .scaledToFill() // <=== Saves aspect ratio
                                                    .frame(width: 40.0, height:40)
                                                
                                                Text(character.normalBossDrops)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                HStack{
                                                    Text("x")
                                                    Text(String(result.chara_normal_boss_drops))
                                                }
                                                .accessibility(label: Text("\(result.chara_normal_boss_drops) \((character.normalBossDrops)) needed."))
                                                
                                            }
                                            Divider()
                                        }
                                        
                                        Group{
                                            HStack{
                                                Image(character.ascensionMatsImage)
                                                    .resizable()
                                                    .scaledToFill() // <=== Saves aspect ratio
                                                    .frame(width: 30.0, height:30)
                                                
                                                Text(character.ascensionMats)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                HStack{
                                                    Text("x")
                                                    Text(String(result.chara_local_mat))
                                                }
                                                
                                            }
                                            .accessibility(label: Text("\(result.chara_local_mat) \((character.ascensionMats)) needed."))
                                        }
                                        
                                    }
                                    .padding(.horizontal)
                                    .frame(width: .infinity, height: 380)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: darkgray, radius: 3, x: 0, y: 1)
                                }
                                
                                Spacer()
                                    .frame(height: 20)
                                
                                //Talent Resources
                                Group{
                                    Text("Talent Resources")
                                        .font(.custom("Georgia", size: 20, relativeTo: .headline))
                                    
                                    VStack{
                                        Group{
                                            HStack{
                                                Image("mora")
                                                    .resizable()
                                                    .scaledToFill() // <=== Saves aspect ratio
                                                    .frame(width: 40.0, height:40)
                                                
                                                Text("Mora")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                HStack{
                                                    Text("x")
                                                    Text(String(result.talent_mora))
                                                }
                                            }
                                            .accessibility(label: Text("\(result.talent_mora) Mora needed."))
                                            Divider()
                                        }
                                        Group{
                                            HStack{
                                                Image(character.talentBooks)
                                                    .resizable()
                                                    .scaledToFill() // <=== Saves aspect ratio
                                                    .frame(width: 40.0, height:40)
                                                
                                                Text(character.talentBooks)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                HStack{
                                                    Text("x")
                                                    Text(String(result.talent_common_books))
                                                }
                                            }
                                            .accessibility(label: Text("\(result.talent_common_books) \((character.talentBooks)) needed."))
                                            Divider()
                                        }
                                        Group{
                                            HStack{
                                                Image("crown")
                                                    .resizable()
                                                    .scaledToFill() // <=== Saves aspect ratio
                                                    .frame(width: 40.0, height:40)
                                                
                                                Text("Crown of Insight")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                HStack{
                                                    Text("x")
                                                    Text(String(result.talent_crown))
                                                }
                                            }
                                            .accessibility(label: Text("\(result.talent_crown) Crown needed."))
                                            Divider()
                                        }
                                        Group{
                                            HStack{
                                                Image(character.weeklyBossDropsImage)
                                                    .resizable()
                                                    .scaledToFill() // <=== Saves aspect ratio
                                                    .frame(width: 40.0, height:40)
                                                
                                                Text(character.weeklyBossDrops)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                HStack{
                                                    Text("x")
                                                    Text(String(result.talent_weekly_boss_drops))
                                                }
                                            }
                                            .accessibility(label: Text("\(result.talent_weekly_boss_drops) \((character.weeklyBossDrops)) needed."))
                                        }
                                        
                                    }
                                    .padding(.horizontal)
                                    .frame(width: .infinity, height: 250)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: darkgray, radius: 3, x: 0, y: 1)
                                }
                            }
 
                            
                        })

                        
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
    
}

struct ResultView_Previews: PreviewProvider {
    static let resultPreview = Result(
        chara_heros_wit: 0,
        chara_adv_exp: 0,
        chara_wand_adv: 0,
        chara_mora: 0,
        chara_normal_boss_drops: 0,
        chara_local_mat: 0,
        talent_mora: 0,
        talent_common_books: 0,
        talent_crown: 0,
        talent_weekly_boss_drops: 0
        
    )
    static var previews: some View {
        ResultView(character: characters[0], result: resultPreview)
    }
}
