//
//  ViewController.swift
//  DeepLinkTest
//
//  Created by User on 06.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "NEW LABEL"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "ANOTHER NEW LABEL"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(label)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }
    
    func setText(_ text: String) {
        label.text = text
    }
}

