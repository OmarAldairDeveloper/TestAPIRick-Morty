//
//  CharacterDetailView.swift
//  TestAPI
//
//  Created by Omar Aldair on 25/06/25.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            
            Text(character.name)
                .font(.largeTitle)
                .bold()
            Text("Status: \(character.status)")
            Text("Specie: \(character.species)")
            Text("Gender: \(character.gender)")
            Text("Origin: \(character.origin.name)")
        }
    }
}
