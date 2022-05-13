//
//  ScheduleCard.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 13/05/22.
//

import SwiftUI

struct ScheduleCard: View {
    //Color
    let darkgray = Color(0xb1b1b1)
    let lightgray = Color(0xeeeeee)
    let gold = Color(0xFFBA4B)
    let purple = Color(0x9A6CDB)
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Xiao")
                    .font(.system(size: 16))
                HStack{
                    Text("Talent Book:")
                        .font(.system(size: 14))
                }
            }
            Spacer()
            
        }
        .padding(.horizontal)
        .frame(width: .infinity, height: 100)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: darkgray, radius: 3, x: 0, y: 1)
    }
}

struct ScheduleCard_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleCard()
    }
}
