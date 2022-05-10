//
//  Character.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 27/04/22.
//

import Foundation
import SwiftUI
import Combine

class Character: Identifiable, Decodable, ObservableObject {
    
    var id: Int
    var name: String
    var description: String
    var weapon: String
    var rarity: String
    var vision: String
    var profileImage: String
    var attack: Attack
    var elementalSkill: ElementalSkill
    var burst: Burst
   
}

struct Burst: Decodable {
    var name, description: String
    var priority: Int
}

struct Attack: Decodable {
    var name, description: String
    var priority: Int
}

struct ElementalSkill: Decodable {
    var name, description: String
    var priority: Int
}
