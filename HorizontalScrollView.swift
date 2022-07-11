//
//  HorizontalScrollView.swift
//  Moonshot
//
//  Created by Derya Antonelli on 11/07/2022.
//

import SwiftUI

    struct HorizontalScrollView: View {
        let crew: [CrewMember]
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink {
                            AstronautView(astronaut: crewMember.astronaut)
                        } label: {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 104, height: 72)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .strokeBorder(.white, lineWidth: 1)
                                    )

                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                }
            }
        }
        
    }


struct HorizontalScrollView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        HorizontalScrollView(crew: [CrewMember(role: missions[0].crew[0].role, astronaut: astronauts[missions[0].crew[0].name]!), CrewMember(role: missions[1].crew[1].role, astronaut: astronauts[missions[1].crew[1].name]!)])
            .background(.darkBackground)
    }
}
