//
//  DetailViewController.swift
//  NavigatorController_Code_UIK_IB
//
//  Created by Salvador Chavez on 3/1/25.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    private let pokemon: Pokemon
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let abilityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    private let movementLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Close", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        return button
    }()
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        configureView()
    }
    
    private func setupLayout() {
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(abilityLabel)
        view.addSubview(movementLabel)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            abilityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            abilityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            movementLabel.topAnchor.constraint(equalTo: abilityLabel.bottomAnchor, constant: 10),
            movementLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.topAnchor.constraint(equalTo: movementLabel.bottomAnchor, constant: 20),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureView() {
        nameLabel.text = "\(pokemon.pokedex_number) - \(pokemon.name)"
        abilityLabel.text = "Ability: \(pokemon.ability)"
        movementLabel.text = "Move: \(pokemon.movement)"
        imageView.image = UIImage(named: pokemon.image_name)
    }
    
    @objc private func closeModal() {
        dismiss(animated: true)
    }
}
