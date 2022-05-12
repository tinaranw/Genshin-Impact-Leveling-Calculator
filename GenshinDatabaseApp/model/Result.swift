//
//  Result.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 11/05/22.
//

import Foundation
import SwiftUI

struct Result: Decodable {
    
//    var characterCost:CharacterCost
//    var talentCost:TalentCost
//
//    struct CharacterCost: Decodable {
//        var heros_wit:Int
//        var adv_exp:Int
//        var wand_adv:Int
//        var mora:Int
//        var normal_boss_drops:Int
//        var local_mat:Int
//    }
//
//    struct TalentCost: Decodable {
//        var mora:Int
//        var common_books:Int
//        var crown:Int
//        var weekly_boss_drops:Int
//    }
    
    var chara_heros_wit:Int
    var chara_adv_exp:Int
    var chara_wand_adv:Int
    var chara_mora:Int
    var chara_normal_boss_drops:Int
    var local_mat:Int
    var talent_mora:Int
    var talent_common_books:Int
    var talent_crown:Int
    var talent_weekly_boss_drops:Int
}

