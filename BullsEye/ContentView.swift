//
//  ContentView.swift
//  BullsEye
//
//  Created by  cindy on 2021/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var game = BullsEyeGame()
    @State var currentValue: Double = 50
    @State var showAlert = false
    
    private var alpha: Double {
      abs(Double(game.targetValue) - currentValue) / 100.0
    }
    
    var body: some View {
        VStack {
            Text("Put the Bull's Eye as close as you can to:\(game.targetValue)")
                .padding()
            HStack {
                Text("0")
                ColorUISlider(color: .blue, value: $currentValue, alpha: .constant(alpha))
                Text("100")
            }
            Button("Hit Me!") {
                showAlert = true
                game.checkGuess(Int(currentValue))
            }.alert(isPresented: $showAlert, content: {
                Alert(title: Text("Your Score"), message: Text(String(game.scoreRound)), dismissButton: .default(Text("OK"), action: {
                    game.startNewRound()
                    currentValue = 50.0
                }))
            })
            
            HStack {
              Text("Total Score: \(game.scoreTotal)")
              Text("Round: \(game.round)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
