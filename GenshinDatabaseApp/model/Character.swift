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
   
}
