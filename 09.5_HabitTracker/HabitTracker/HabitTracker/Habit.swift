//
//  Habit_Struct.swift
//  HabitTracker
//
//  Created by Pitambar Dayal on 1/7/22.
//

import Foundation
import SwiftUI

struct Habit: Codable, Identifiable {
    let id = UUID()
    let habitName: String
    let habitCount: Int
    //let habitColor: String
    //let dates: [Date]
    //let completions: [Bool]
}
