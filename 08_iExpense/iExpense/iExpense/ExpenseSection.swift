//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Pitambar Dayal on 12/27/21.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section (title) {
            ForEach(expenses) { item in
                HStack {
                    VStack (alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                    Text(item.amount, format: .localCurrency)
                        .style(for: item)
                }
                .foregroundColor(item.amount > 100 ? .red : item.amount > 20 ? .orange : .green)
            }
            .onDelete(perform: deleteItems)
        }
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "Example", expenses: []) { _ in }
    }
}
