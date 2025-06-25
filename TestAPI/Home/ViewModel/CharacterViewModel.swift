//
//  CharacterViewModel.swift
//  TestAPI
//
//  Created by Omar Aldair on 25/06/25.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var pagesCounter = 1
    
    init() {
        isLoading = true
        CharacterService.shared.getCharacters { result in
            switch result {
            case .success(let characters):
                self.characters = characters.results
                self.pagesCounter += 1
                
            case .failure(let error):
                print("Error with characters: \(error.localizedDescription)")
            }
            self.isLoading = false
        }
    }
    
    func loadMoreCharacters() {
        isLoading = true
        CharacterService.shared.getCharacters(page: pagesCounter) { result in
            switch result {
            case .success(let characters):
                self.characters += characters.results
                self.pagesCounter += 1
                
            case .failure(let error):
                print("Error with characters: \(error.localizedDescription)")
            }
            self.isLoading = false
        }
    }
}
