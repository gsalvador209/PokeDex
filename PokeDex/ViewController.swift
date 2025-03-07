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
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .never // Prevent auto adjustments
            
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90+16
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemBackground

        let label = UILabel()
        label.text = "Pokedex"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.frame = CGRect(x: 16, y: 2, width: tableView.frame.width, height: 20)
        headerView.addSubview(label)

        return headerView
    }
    
}

