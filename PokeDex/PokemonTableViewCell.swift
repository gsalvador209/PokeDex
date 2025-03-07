//
//  DetailTableViewCell.swift
//  NavigatorController_Code_UIK_IB
//
//  Created by Salvador Chavez on 3/1/25.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    /***********CREACION DE ELEMENTOS DE CELDA********/
    private let iconImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let abilityLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .darkGray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let moveLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .blue
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    /**-------------------CONFIGURACION DE PROPIEDADES-----------**/
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            contentView.addSubview(iconImageView)
            contentView.addSubview(nameLabel)
            contentView.addSubview(abilityLabel)
            contentView.addSubview(moveLabel)
            
            NSLayoutConstraint.activate([
                iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                iconImageView.widthAnchor.constraint(equalToConstant: 48),
                iconImageView.heightAnchor.constraint(equalToConstant: 48),
                
                nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
                nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                
                abilityLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                abilityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
                
                moveLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                moveLabel.topAnchor.constraint(equalTo: abilityLabel.bottomAnchor, constant: 4),
                moveLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configure(with pokemon: Pokemon) {
            iconImageView.image = UIImage(named: pokemon.image_name) ?? UIImage(systemName: "questionmark.square")
            nameLabel.text = "#\(pokemon.pokedex_number) \(pokemon.name)"
            abilityLabel.text = "Ability: \(pokemon.ability)"
            moveLabel.text = "Move: \(pokemon.movement)"
        }
    
    
}
