//
//  PokemonDataManager.swift
//  PokeDex
//
//  Created by Salvador Chavez on 3/6/25.
//

import Foundation

class PokemonDataManager {
    static let shared = PokemonDataManager() // Singleton instance
    
    private init() {} // Prevent external instantiation

    func loadPokemonData(completion: @escaping ([Pokemon]) -> Void) {
        DispatchQueue.global(qos: .background).async {
            guard let path = Bundle.main.path(forResource: "pokedex", ofType: "json") else {
                print("Error: Pokemon JSON file not found")
                return
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decodedData = try JSONDecoder().decode([Pokemon].self, from: data)
                
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}
