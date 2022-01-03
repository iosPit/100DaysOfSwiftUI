//
//  MissionsGridView.swift
//  Moonshot
//
//  Created by Pitambar Dayal on 12/31/21.
//

import SwiftUI

struct MissionsGridView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [ GridItem(.adaptive(minimum: 150)) ]
    
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts), label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground))
                })
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct MissionsGridView_Previews: PreviewProvider {
    static var previews: some View {
        MissionsGridView()
    }
}
