//
//  CharacterListView.swift
//  TestAPI
//
//  Created by Omar Aldair on 25/06/25.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                List(viewModel.characters.indices, id: \.self) { idx in
                    LazyVStack {
                        NavigationLink(destination: CharacterDetailView(character: viewModel.characters[idx])) {
                            CharacterItem(character: viewModel.characters[idx])
                                .onAppear {
                                    if viewModel.characters[idx].id == (viewModel.characters.last?.id ?? 0) {
                                        viewModel.loadMoreCharacters()
                                    }
                                }
                        }
                    }
                }
                .navigationTitle("Rick & Morty")
                
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
           
        }
    }
}

#Preview {
    CharacterListView()
}
