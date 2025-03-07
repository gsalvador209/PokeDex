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
        
        private let numberLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .darkGray
            label.textAlignment = .right
            return label
        }()
    
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

    
    /**-------------------CONFIGURACION DE PROPIEDADES-----------**/
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            contentView.addSubview(iconImageView)
            contentView.addSubview(numberLabel)
            contentView.addSubview(nameLabel)
//            contentView.addSubview(abilityLabel)
//            contentView.addSubview(moveLabel)
            
            NSLayoutConstraint.activate([
                iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                iconImageView.widthAnchor.constraint(equalToConstant: 90),
                iconImageView.heightAnchor.constraint(equalToConstant: 90),
                
                numberLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor,constant: 4),
                numberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17),
                numberLabel.widthAnchor.constraint(equalToConstant: 45),
                
                
                nameLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 12),
                nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15)
                
          ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configure(with pokemon: Pokemon) {
            iconImageView.image = UIImage(named: pokemon.image_name) ?? UIImage(systemName: "questionmark.square")
            numberLabel.text = "#\(String(format: "%03d", pokemon.pokedex_number)) "
            nameLabel.text = "\(pokemon.name)"
            
        }
    
    
}
