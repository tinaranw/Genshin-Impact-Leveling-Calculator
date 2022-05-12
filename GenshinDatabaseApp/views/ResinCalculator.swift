//
//  ResinCalculator.swift
//  GenshinDatabaseApp
//
//  Created by Tinara Nathania Wiryonoputro on 30/04/22.
//

import SwiftUI

struct ResinCalculator: View {
    @State var countDownTimer = 5
    @State var timeRunning = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
       
        VStack{
            Text("\(countDownTimer)")
                .onReceive(timer){ _ in
                    if(countDownTimer > 0 && timeRunning){
                        countDownTimer -= 1
                        
                    } else {
                        timeRunning = false
                    }
                }
                .font(.system(size: 80, weight: .bold))
                .opacity(0.80)
            HStack{
                Button("Start"){
                    timeRunning = true
                }
                Button("Reset"){
                    countDownTimer = 5
                }.foregroundColor(.red)
            }
        }
    }
}

struct ResinCalculator_Previews: PreviewProvider {
    static var previews: some View {
        ResinCalculator()
    }
}
