//
//  ContentView.swift
//  HabitTracker
//
//  Created by Pitambar Dayal on 1/7/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var habitArray = HabitArray()
    @State private var addNewHabit = false
    @State private var name = ""
    
    let columns = [ GridItem(.adaptive(minimum: 120)) ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(habitArray.habits) {habit in
                            NavigationLink(destination: Text("Hello")) {
                                ZStack {
                                    Text("\(habit.habitName)")
                                        .foregroundColor(.white)
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.red).opacity(0.8)
                                     .frame(height: 200)
                                        .padding()
                                    VStack {
                                        Text("🔥")
                                        Text("✅3")
                                        Button {
                                            // Add 1 to fire emoji
                                            // Turn button green
                                        } label: {
                                            Image(systemName: "plus")
                                        }
                                        .clipShape(Capsule())
                                        .foregroundColor(.red)
                                        .offset(x: 0.0, y: 90.0)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                .toolbar {
                    Button {
                        addNewHabit = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $addNewHabit) {
                    NewHabitView(habitArray: habitArray)
                }
            }
            .navigationTitle("Habit Tracker")
        }
    }
    
    func isOdd(num: Int) -> Bool {
        if num % 2 == 0 {
            return false
        }
        return true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
