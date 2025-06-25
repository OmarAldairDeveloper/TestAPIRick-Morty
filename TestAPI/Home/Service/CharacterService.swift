//
//  CharacterService.swift
//  TestAPI
//
//  Created by Omar Aldair on 25/06/25.
//

import SwiftUI

class CharacterService {
   static let shared = CharacterService()
    
    private init() {}
    
    func getCharacters(page: Int = 1, completion: @escaping (Result<CharacterResponse, Error>) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character/?page=\(page)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "No data", code: -1)))
                }
                return
            }
            
            do {
                let characters = try JSONDecoder().decode(CharacterResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(characters))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
               
            }
        }
        .resume()
    }
}
