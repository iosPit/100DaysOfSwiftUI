//
//  NewHabitView.swift
//  HabitTracker
//
//  Created by Pitambar Dayal on 1/8/22.
//

import SwiftUI

struct NewHabitView: View {
    @ObservedObject var habitArray = HabitArray()
    @State private var name = ""
    @State private var color = Color.blue
    let habitColors = [Color.blue, Color.green]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                    Picker("Habit Color", selection: $color) {
                        ForEach(habitColors, id: \.self) { color in
                            Circle()
                                .foregroundColor(color)
                        }
                    }
                    //.pickerStyle(.segmented)
                }
            }
            .toolbar {
                Button("Save") {
                    let newHabit = Habit(habitName: name)
                    habitArray.habits.append(newHabit)
                }
            }
        }
    }
}
    
    struct NewHabitView_Previews: PreviewProvider {
        static var previews: some View {
            NewHabitView()
        }
    }
