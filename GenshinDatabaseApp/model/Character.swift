//
//  Character.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 27/04/22.
//

import Foundation
import SwiftUI

struct Character: Identifiable, Decodable {
    var id: Int
    var name: String
    var description: String
    var weapon: String
    var rarity: String
    var vision: String
    var profileImage: String
    var burst: Burst
    var attack: Attack
    var elementalSkill: ElementalSkill
   
}

struct Burst: Codable {
    var name, description: String
    var priority: Int
}

struct Attack: Codable {
    var name, description: String
    var priority: Int
}

struct ElementalSkill: Codable {
    var name, description: String
    var priority: Int
}
