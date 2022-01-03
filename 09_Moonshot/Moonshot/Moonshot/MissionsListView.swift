//
//  MissionsListView.swift
//  Moonshot
//
//  Created by Pitambar Dayal on 12/31/21.
//

import SwiftUI

struct MissionsListView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        LazyVStack {
            ForEach(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts), label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .padding()
                        
                        Spacer()
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


struct MissionsListView_Previews: PreviewProvider {
    static var previews: some View {
        MissionsListView()
    }
}
