//
//  CharacterItem.swift
//  TestAPI
//
//  Created by Omar Aldair on 25/06/25.
//

import SwiftUI

struct CharacterItem: View {
    var character: Character
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .bold()
                Text(character.status)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    CharacterItem(character: Character(id: 1, name: "", status: "Status", species: "Specie", type: "Type", gender: "Male", origin: Origin(name: "A", url: "http://www.google.com"), location: Location(name: "", url: ""), image: "", episode: [], url: "", created: ""))
}
