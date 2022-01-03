//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Pitambar Dayal on 12/1/21.
//

import SwiftUI

struct FlagTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.primary)
            .font(.largeTitle.weight(.semibold))
    }
}
extension View {
    func flagTitleStyle() -> some View {
        modifier(FlagTitle())
    }
}

struct FlagImage: View {
    var name: String
    var body: some View {
            Image(name)
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(color: .white, radius: 5)
    }
        
}

struct ContentView: View {
    @State private var score = 0
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var questionCount = 1
    @State private var endGame = false
    @State private var countries = allCountries.shuffled()
    @State private var selectedFlag = -1

    static let allCountries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.4, green: 0.2, blue: 1.0), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                Spacer()
                
                VStack (spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .flagTitleStyle()
                    }
                    ForEach(0..<3) { number in
                        Button {
                                flagTapped(number)
                        } label: {
                            FlagImage(name: countries[number])

                    }
                        .rotation3DEffect(.degrees(selectedFlag == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(selectedFlag == -1 || selectedFlag == number ? 1.0 : 0.25)
                        .animation(.default, value: selectedFlag)
                }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                
                Spacer()
                
            } .padding()
        }
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("""
                Your score is \(score)
                \(8 - questionCount) questions remaining
                """)
        }
        .alert(scoreTitle, isPresented: $endGame) {
            Button("Play Again", action: resetGame)
        } message: {
            Text("You got \(score) out of 8 correct!")
        }
        
    }
    
    func flagTapped(_ number: Int) {
        selectedFlag = number
        
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong, that is the flag of \(countries[number])"
        }
        showScore = true
        
        if questionCount == 8 {
            scoreTitle = "Game Over"
            showScore = false
            endGame = true
        }
    }
    
    func askQuestion() {
        countries.remove(at: correctAnswer)
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCount += 1
        
        selectedFlag = -1
    }
    
    func resetGame() {
        score = 0
        questionCount = 0
        countries = Self.allCountries
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
