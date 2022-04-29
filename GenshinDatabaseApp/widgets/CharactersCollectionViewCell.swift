//
//  CharactersCollectionViewCell.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 29/04/22.
//

import SwiftUI

struct CharactersCollectionViewCell: View {
    
    //Row and Column
    static let column = 3
    static let row = characters.count/3
    
    //Width
    let width = (UIScreen.main.bounds.width/3 - 20)
    
    //Color
    let darkgray = Color(0xb1b1b1)
    let lightgray = Color(0xeeeeee)
    let gold = Color(0xFFBA4B)
    let purple = Color(0x9A6CDB)
    
    //Index
    var index = 0
    init(row: Int, column: Int){
        index = row + column + (row*2)
        
    }
    
    var body: some View {
    
        VStack {
            Image("\(characters[index].profileImage)")
                .resizable()
                .aspectRatio(contentMode: .fit)


            HStack {
                VStack(alignment: .leading) {
                    Text("\(characters[index].name)")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                    if characters[index].rarity == "legendary" {
                        HStack(spacing:1.0){
                            Image(systemName: "star.fill")
                                .foregroundColor(gold)
                            Image(systemName: "star.fill")
                                .foregroundColor(gold)
                            Image(systemName: "star.fill")
                                .foregroundColor(gold)
                            Image(systemName: "star.fill")
                                .foregroundColor(gold)
                            Image(systemName: "star.fill")
                                .foregroundColor(gold)
                        }
                    } else {
                        HStack(spacing:1.0){
                            Image(systemName: "star.fill")
                                .foregroundColor(purple)
                            Image(systemName: "star.fill")
                                .foregroundColor(purple)
                            Image(systemName: "star.fill")
                                .foregroundColor(purple)
                            Image(systemName: "star.fill")
                                .foregroundColor(purple)
                        }
                    }
                }
                .layoutPriority(100)

                Spacer()
            }
            .padding()
            
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: darkgray, radius: 3, x: 0, y: 1)
        .onTapGesture {
            print("\(characters[index].name)")
        }
        
    }
    
}

struct CharactersCollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CharactersCollectionViewCell(row:0, column:1)
    }
}

