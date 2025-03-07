//
//  ViewController.swift
//  PokeDex
//
//  Created by Salvador Chavez on 3/4/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var pokemonList : [Pokemon] = []


    //Creacion de la tabla
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false //Sirve para definir los constraints a nivel código
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "PokemonCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokedex"
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
                    tableView.topAnchor.constraint(equalTo: view.topAnchor),
                    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Load Data using DataManager
        PokemonDataManager.shared.loadPokemonData { [weak self] data in
            self?.pokemonList = data
            self?.tableView.reloadData()
        }
    }

    // MARK: TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        let pokemon = pokemonList[indexPath.row]
        cell.configure(with: pokemon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // Deselect row after tap
        
        let selectedPokemon = pokemonList[indexPath.row]
        let detailVC = PokemonDetailViewController(pokemon: selectedPokemon)
        detailVC.modalPresentationStyle = .pageSheet // Makes it a bottom sheet
        present(detailVC, animated: true)
    }
}

