//
//  Result.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 11/05/22.
//

import Foundation
import SwiftUI

class Result: Identifiable, Decodable, ObservableObject {
    
    var character:Character
    var characterCost:CharacterCost
    var talentCost:TalentCost
    
    struct CharacterCost: Decodable {
        var heros_wit:Int
        var adv_exp:Int
        var wand_adv:Int
        var mora:Int
        var normal_boss_drops:Int
        var local_mat:Int
    }
    
    struct TalentCost: Decodable {
        var mora:Int
        var common_books:Int
        var crown:Int
        var weekly_boss_drops:Int
    }
   
}

