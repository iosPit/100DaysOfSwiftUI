//
//  ContentView.swift
//  BetterRest
//
//  Created by Pitambar Dayal on 12/12/21.
//
import CoreML
import SwiftUI

struct ContentView: View {
    
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var bedtime: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            //alertTitle = "Your ideal bedtime is..."
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "Error in function"
        }
    }

    
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    
                    VStack (alignment: .leading, spacing: 0) {
                        Text("What time do you want to wake up?")
                            .font(.headline)
                        DatePicker("Please enter a time: ", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .labelsHidden()
                            .accentColor(.blue)
                    }
                } header: {
                    Text("Wake Up Time")
                }
                
                Section {
                    VStack (alignment: .leading, spacing: 0) {
                        Text("Desired amount of sleep")
                            .font(.headline)
                        Stepper("\(sleepAmount.formatted()) Hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                }
                    //.labelsHidden()
                
                VStack (alignment: .leading, spacing: 0) {
                    Text("Amount of coffee")
                    Picker("Cups", selection: $coffeeAmount) {
                        ForEach(0..<20) {
                            Text("\($0) cups")
                        }
                    }
                    Stepper(coffeeAmount == 1 ? "\(coffeeAmount) cup" : "\(coffeeAmount) cups",
                            value: $coffeeAmount, in: 0...10, step: 1)
                }
                
                Text("Your bedtime should be \(bedtime)")
                
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "There was an error calculating your bedtime"
        }
        
        showingAlert = true
        
        
    }
    
    func trivialExample() {
        var components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let date = Calendar.current.date(from: components)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Unused Code
//Stepper("\(sleepAmount.formatted()) Hours", value: $sleepAmount, in: 4...13, step: 0.25)
//
//DatePicker("Select a date:", selection: $wakeUp, displayedComponents: .hourAndMinute)
//    .labelsHidden()
//
//DatePicker("Select a date:", selection: $wakeUp, in: Date.now...)
