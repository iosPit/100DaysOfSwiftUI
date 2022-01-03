//
//  ContentView.swift
//  WeSplit
//
//  Created by Pitambar Dayal on 11/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var tipPercent = 20
    @State private var numPeople = 2
    @FocusState private var checkAmountFocused: Bool
    
    let localCurrecy: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    
    // Uncomment if using segmented picker
    // let tipPercentages = [0, 10, 15, 18, 20]
    
    let tipPercentages = 20

    
    var totalPerPerson: Double {
        let totalPeople = Double(numPeople + 2)
        let tipAmount = checkAmount * Double(tipPercent) / 100
        let totalPerPerson = (checkAmount + tipAmount) / totalPeople
        return totalPerPerson
    }
    
    var totalAmount: Double {
        let totalAmount =  checkAmount *  (1.0 + Double(tipPercent)/100.0)
        return totalAmount
    }
    
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($checkAmountFocused)
                    
                    Picker("Number of People", selection: $numPeople) {
                        ForEach(2..<20) {
                            Text("\($0) people")
                        }
                    }
                }
                
                
                Section {
//                    Uncomment for segmented picker
//                    Picker("Tip Percentage", selection: $tipPercent) {
//                        ForEach(tipPercentages, id: \.self) {
//                            Text($0, format: .percent)
//                        }
//                    }
//                    .pickerStyle(.segmented)
                    
                    Picker("Tip Percentage", selection: $tipPercent) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                                .foregroundColor(tipPercent == 0 ? .red : .primary)
                        }
                    }
                    
                } header: {
                    Text("Tip perentage")
                }
                
                
                Section {
                    Text(totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total (Check + Tip)")
                }
                
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Amount Per Person")
                }
            }
            
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        checkAmountFocused = false
                    }
                }
            }
           
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
