//
//  ContentView.swift
//  Animations
//
//  Created by Pitambar Dayal on 12/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var animationAmount2 = 2.0
    @State private var rotationAnimation = 0.0
    @State private var dragAmount = CGSize.zero
    
    let animationCharacters = Array("Snake Animation")
    @State private var isEnabled = false
    @State private var dragAmount2 = CGSize.zero
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<animationCharacters.count) { number in
                    Text("\(String(animationCharacters[number]))")
                        .padding(5)
                        .font(.title)
                        .background(isEnabled ? .blue : .red)
                        .offset(dragAmount2)
                        .animation(.default.delay(Double(number)/20), value: dragAmount2)
                
                }
                
            }
            .gesture(
            DragGesture()
                .onChanged { dragAmount2 = $0.translation }
                .onEnded({_ in dragAmount = .zero
                    isEnabled.toggle()
                })
            )
            
            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in dragAmount = .zero }
                )
            
            Stepper("Scale amount", value: $animationAmount2.animation(), in: 1...10)
            Spacer()
            Button("Tap me") {
                animationAmount2 += 1
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) { rotationAnimation += 360 }
            }
            .padding(40)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount2)
            .rotation3DEffect(.degrees(rotationAnimation), axis: (x: 0, y: 1, z: 0))
            
            
            
            Button("Hello") {
            }
            .padding()
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2-animationAmount)
                    .animation(
                        .easeInOut(duration: 2)
                            .repeatForever(autoreverses: false),
                        value: animationAmount)
            )
            .onAppear {
                animationAmount = 2
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
