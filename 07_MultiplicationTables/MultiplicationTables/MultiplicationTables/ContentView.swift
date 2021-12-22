//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Pitambar Dayal on 12/21/21.
//

import SwiftUI

struct AnimalImage: ViewModifier {
    var backgroundColor = Color.green
    
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 50)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .foregroundColor(.black)
            .accentColor(.gray)
            .shadow(color: .white, radius: 5)
    }
}


struct ContentView: View {
    
    @State private var numQuestions = 10
    @State private var difficulty = [Int]()
    
    let easyNumbers = [1, 2, 3]
    let mediumNumbers = [4, 5, 6]
    let hardNumbers = [7, 8, 9]
    let multiplyBy = Array(1...10)
    
    @State private var m = 0
    @State private var n = 0
    @State private var correctAnswer = 0
    @State private var correctIndex = 0
    
    @State private var answerChoices = [0, 0, 0]
    
    @State private var score = 0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    @State private var selectedButton = -1
    
    static let allAnimals = ["parrot", "duck", "dog", "horse", "rabbit", "whale", "rhino", "elephant", "zebra", "chicken", "cow", "panda", "hippo", "gorilla", "owl", "penguin", "sloth", "frog", "buffalo", "monkey", "giraffe", "moose", "pig", "snake", "bear", "chick", "walrus", "goat", "crocodile", "narwhal"]
    
    @State private var animals = allAnimals.shuffled()
    
    
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color(red: 0.4, green: 0.2, blue: 1.0), location: 0.5),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.5)], center: .top, startRadius: 300, endRadius: 400)
                    .opacity(0.8)
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Color(.white)
                            .opacity(0.4)
                            .background(.thickMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        VStack {
                            Text("How Many Questions?")
                                .font(.headline)
                            HStack {
                                Spacer()
                                Spacer()
                                Spacer()
                                Stepper("\(numQuestions) Questions", value: $numQuestions, in: 5...20)
                                Spacer()
                                Spacer()
                                Spacer()
                            }

                            
                            Text("Select Your level")
                                .font(.headline)
                            HStack {
                                Button("Easy") {
                                    difficulty = easyNumbers
                                    newQuestion(difficulty)
                                }
                                .modifier(AnimalImage(backgroundColor: .green))
                                
                                Button("Medium") {
                                    difficulty = mediumNumbers
                                    newQuestion(difficulty)
                                }
                                .modifier(AnimalImage(backgroundColor: .yellow))
                                
                                Button("Hard") {
                                    difficulty = hardNumbers
                                    newQuestion(difficulty)
                                }
                                .modifier(AnimalImage(backgroundColor: .red))
                            }
                            
                        }
                        .padding(.vertical, 20)
                    }
                    
                    Spacer()

                    
                    
                    
                    ZStack {
                        Color(.blue)
                            .opacity(0.7)
                            .background(.thickMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        VStack {
                            Spacer()
                            Text("\(m) x \(n)")
                                .font(.largeTitle.weight(.heavy))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("Who Answered Correctly?")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            VStack {
                                ForEach(0..<3) { number in
                                    HStack {
                                        Button {
                                            checkAnswer(number)
                                        } label: {
                                            Image(animals[number])
                                                .renderingMode(.original)
                                                .resizable()
                                                .frame(width: 85, height: 85)
                                                .aspectRatio(1, contentMode: .fit)
                                                .rotationEffect(Angle.degrees(selectedButton == number ? 360 : 0))
                                                .animation(.default, value: selectedButton)
                                        }
                                        Text("\(answerChoices[number])")
                                            .font(.largeTitle)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                        }.padding()
                    }
                }
                .padding()
            }.alert(alertTitle, isPresented: $showAlert) {
                Button("Continue") {
                    newQuestion(difficulty)
                    animals = animals.shuffled()
                }
            } message: {
                Text(alertMessage)
            }
            Spacer()
        }
    }
    
    func newQuestion(_ difficulty: [Int]) {
        selectedButton = -1
        
        m = difficulty.randomElement() ?? 0
        n = multiplyBy.randomElement() ?? 0
        correctAnswer = m * n
        correctIndex = Int.random(in: 0...2)
        
        answerChoices = [(m*n+1), (m*n+2), (m*n+3), (m+n+4), (m*n-1)].shuffled()
        while answerChoices.count > 2 { answerChoices.removeLast() }
        answerChoices.insert(correctAnswer, at: correctIndex)
        
    }
    
    func checkAnswer(_ number: Int) {
        selectedButton = number
        
        if number == correctIndex {
            score += 1
            alertTitle = "Correct!"
            alertMessage = "Your score is \(score)"

        } else {
            alertTitle = "Wrong!"
            alertMessage = "\(m) x \(n) = \(correctAnswer)"
        }
        showAlert.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
