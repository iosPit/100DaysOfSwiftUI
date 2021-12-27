//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Pitambar Dayal on 12/26/21.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
