//
//  ContactsWidgetsViewController.swift
//  DeepLinkTest
//
//  Created by Artem Golikov on 07.02.2024.
//

import UIKit
import SnapKit
import ContactsUI

class ContactsWidgetsViewController: UIViewController {
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Small • 1 contact"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var smallWidgetView = SmallContactWidgetView()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "Medium • 4 contacts"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var mediumWidgetView = MediumContactWidgetView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        setupHierarchy()
        setupLayout()
        addTargets()
    }

    private func setupHierarchy() {
        view.addSubview(topLabel)
        view.addSubview(smallWidgetView)
        view.addSubview(bottomLabel)
        view.addSubview(mediumWidgetView)
    }
    
    private func setupLayout() {
        topLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(0.3)
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
        
        smallWidgetView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(topLabel.snp.bottom).offset(25)
            $0.width.height.equalTo(150)
        }
        
        bottomLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
        
        mediumWidgetView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(bottomLabel.snp.bottom).offset(25)
            $0.width.equalToSuperview().multipliedBy(0.8)
            $0.height.equalTo(150)
        }
    }
    
    private func addTargets() {
        [smallWidgetView, mediumWidgetView].forEach {
            $0.addGestureRecognizer(UITapGestureRecognizer(
                target: self,
                action: #selector(presentContactPickerVC)
            ))
        }
    }
}

// MARK: - Methods

extension ContactsWidgetsViewController {
    func getContacts() {
        
    }
}

// MARK: - CNContactPickerDelegate Extension

extension ContactsWidgetsViewController: CNContactPickerDelegate {
    
}

// MARK: - Obcj Methods

@objc
private extension ContactsWidgetsViewController {
    func presentContactPickerVC() {
        let vc = CNContactPickerViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
}
