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
                                    .frame(height: 10)
                                
                                
                                //Character Resources
                                Group{
                                    Text("Character Resources")
                                        .font(.custom("Georgia", size: 18, relativeTo: .headline))
                                    
                                    VStack{
                                        HStack{
                                            Image("xiao")
                                            Text("Hero's Wit")
                                            Text(String(result.chara_heros_wit))
                                        }
                                        
                                    }
                                    .padding(.horizontal)
                                    .frame(width: .infinity, height: 100)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: darkgray, radius: 3, x: 0, y: 1)
                                }
                                
                                //Talent Resources
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
    
}

struct ResultView_Previews: PreviewProvider {
    static let resultPreview = Result(
        chara_heros_wit: 0,
        chara_adv_exp: 0,
        chara_wand_adv: 0,
        chara_mora: 0,
        chara_normal_boss_drops: 0,
        local_mat: 0,
        talent_mora: 0,
        talent_common_books: 0,
        talent_crown: 0,
        talent_weekly_boss_drops: 0
        
    )
    static var previews: some View {
        ResultView(character: characters[0], result: resultPreview)
    }
}
