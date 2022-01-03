//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Pitambar Dayal on 12/7/21.
//

import SwiftUI

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline.weight(.semibold))
            .padding()
            .foregroundColor(.primary)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .buttonStyle(.bordered)
    }
}
extension View {
    func buttonStyle() -> some View {
        modifier(ButtonStyle())
    }
}




struct ContentView: View {
    @State private var correctAnswer = ""
    @State private var win = Bool.random()
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var computerMove = Int.random(in: 0..<3)
    
    let moves = ["Rock", "Paper", "Scissors"]
    let winningMoves = ["Paper", "Scissors", "Rock"]
    let losingMoves = ["Scissors", "Rock", "Paper"]
    let humanMove = ""
    
    func playGame(_ humanMove: String) {
        correctAnswer = win ? winningMoves[computerMove] : losingMoves[computerMove]
        
        if humanMove == correctAnswer {
            score += 1
        }
        
        playAgain()
    }
    
    func playAgain() {
        computerMove = Int.random(in: 0..<3)
        win = Bool.random()
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Computer Selects \(moves[computerMove])")
                Text(win ? "You must win" : "You must lose")
                                
                HStack {
                    ForEach(moves, id: \.self) { humanMove in
                        Button(humanMove) {
                            playGame(humanMove)
                        }
                        .buttonStyle()
                    }
                }
                
                Text("Score: \(score)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
