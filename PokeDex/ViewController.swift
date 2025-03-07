//
//  ViewController.swift
//  PokeDex
//
//  Created by Salvador Chavez on 3/4/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let pokemonList = loadPokemonData() {
                for pokemon in pokemonList {
                    print("\(pokemon.name) - Ability: \(pokemon.ability)")
                }
            }
    }


}

func loadPokemonData() -> [Pokemon]? {
    guard let url = Bundle.main.url(forResource: "pokedex", withExtension: "json") else {
        print("JSON file not found")
        return nil
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let pokemonList = try decoder.decode([Pokemon].self, from: data)
        return pokemonList
    } catch {
        print("Error decoding JSON: \(error)")
        return nil
    }
}
