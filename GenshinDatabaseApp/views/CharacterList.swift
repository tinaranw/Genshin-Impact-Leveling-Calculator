//
//  CharacterList.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 28/04/22.
//

import Foundation
import SwiftUI

struct CharacterList: View {
    @ObservedObject var chosenCharacter:Character
    let backgroundColor = Color(0xFBFBFB)
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false){
            ForEach(0..<CharactersCollectionViewCell.row){i  in
                HStack{
                    ForEach(0..<CharactersCollectionViewCell.column){j  in
                        NavigationLink(destination:
                                        LevelUpCalculator(character: characters[(i + j + (i*2))])){
                            CharactersCollectionViewCell(row: i, column: j)
                        }
                    }
                }
            }
        }
        .padding(20)
        .background(backgroundColor)
        
        //            .navigationTitle("Characters")
        
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList(chosenCharacter: characters[1])
    }
}
