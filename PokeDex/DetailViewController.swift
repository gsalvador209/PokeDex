//
//  DetailViewController.swift
//  NavigatorController_Code_UIK_IB
//
//  Created by Salvador Chavez on 3/1/25.
//

import UIKit

class DetailViewController: UIViewController {

    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    init(titleText : String){
        super.init(nibName: nil, bundle: nil)
        self.titleLabel.text = titleText
        self.view.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
