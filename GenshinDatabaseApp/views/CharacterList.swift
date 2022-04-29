//
//  CharacterList.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 28/04/22.
//

import Foundation
import SwiftUI

struct CharacterList: View {
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false){
                ForEach(0..<CharactersCollectionViewCell.row){i  in
                    HStack{
                        ForEach(0..<CharactersCollectionViewCell.column){j  in
                            NavigationLink(destination: LevelUpCalculator()){
                                CharactersCollectionViewCell(row: i, column: j)
                            }
                        }
                    }
                }
            }
            
            .navigationTitle("Character")
        }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
