//
//  MissionView.swift
//  Moonshot
//
//  Created by Derya Antonelli on 07/07/2022.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
                   ScrollView {
                       VStack {
                           Image(mission.image)
                               .resizable()
                               .scaledToFit()
                               .frame(maxWidth: geometry.size.width * 0.6)
                               .padding(.top)
                           
                           Text(mission.nonAbbreviatedLaunchDate)
                               .padding()
                               .font(.title2)
                               .foregroundColor(.secondary)

                           VStack(alignment: .leading) {
                               
                               Divider()
                               
                               Text("Mission Highlights")
                                   .font(.title.bold())
                                   .padding(.bottom, 5)

                               Text(mission.description)
                               
                               Divider()
                               
                               Text("Crew")
                                   .font(.title.bold())
                                   .padding(.bottom, 5)
                           }
                           .padding(.horizontal)
                       }
                       .padding(.bottom)
                       
                       HorizontalScrollView(crew: crew)

                   }
               }
               .navigationTitle(mission.displayName)
               .navigationBarTitleDisplayMode(.inline)
               .background(.darkBackground)
           }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    }


struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0],  astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
