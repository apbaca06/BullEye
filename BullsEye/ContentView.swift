//
//  ContentView.swift
//  BullsEye
//
//  Created by  cindy on 2021/3/23.
//

import SwiftUI

struct ContentView: View {
    
    var targetValue: Int = Int.random(in: 1...100)
    @State var currentValue: Double = 50
    @State var showAlert = false
    
    var body: some View {
        VStack {
            Text("Put the Bull's Eye as close as you can to:\(targetValue)")
                .padding()
            HStack {
                Text("0")
                ColorUISlider(color: .blue, value: $currentValue, alpha: .constant(1.0 - Double(computeScore())/100.0))
                Text("100")
            }
            Button("Hit Me!") {
                showAlert = true
            }.alert(isPresented: $showAlert, content: {
                Alert(title: Text("Your Score"), message: Text(String(computeScore())), dismissButton: nil)
            })
        }
    }
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lroundf(Float(currentValue)))
        let points = 100 - difference
        return points
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
