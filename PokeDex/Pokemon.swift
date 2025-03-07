//
//  Pokemon.swift
//  PokeDex
//
//  Created by Salvador Chavez on 3/6/25.
//

import Foundation

struct Pokemon: Codable {
    let pokedex_number: Int
    let name: String
    let ability: String
    let movement: String
    let image_name: String
}
