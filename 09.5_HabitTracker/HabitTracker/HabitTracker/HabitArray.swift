//
//  HabitArray.swift
//  HabitTracker
//
//  Created by Pitambar Dayal on 1/7/22.
//

import Foundation

class HabitArray: ObservableObject {
    @Published var habits = [Habit]()
    
//    {
//        didSet {
//            let encoder = JSONEncoder()
//            if let encoded = try? encoder.encode(habits) { UserDefaults.standard.set(encoded, forKey: "Habits") }
//        }
//    }
}
