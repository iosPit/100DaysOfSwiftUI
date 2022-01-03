//
//  ContentView.swift
//  Moonshot
//
//  Created by Pitambar Dayal on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showGridView = true
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                if showGridView {
                    MissionsGridView()
                } else {
                    MissionsListView()
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showGridView.toggle()
                } label: {
                    Text(showGridView ? "List" : "Grid")
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
