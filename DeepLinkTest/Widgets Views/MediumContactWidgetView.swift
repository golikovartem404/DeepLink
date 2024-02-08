//
//  MediumContactWidgetView.swift
//  DeepLinkTest
//
//  Created by Artem Golikov on 07.02.2024.
//

import UIKit

class MediumContactWidgetView: UIView {
    
    private var names = ["Artem", "Denis", "Evgeniy", "Kate"]
    
    private var personStacks = [UIStackView]()
    
//    private lazy var person1ImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "person.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    private lazy var parson1NameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Artem"
//        label.textColor = .black
//        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
//        label.textAlignment = .center
//        label.numberOfLines = 1
//        return label
//    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupWidgetUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
    
    private func setupWidgetUI() {
        for name in names {
            let label = UILabel()
            label.text = name
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            label.textAlignment = .center
            label.numberOfLines = 1
            let imageView = UIImageView(image: UIImage(systemName: "person.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal))
            imageView.contentMode = .scaleAspectFit
            let stack = UIStackView()
            stack.addArrangedSubview(imageView)
            stack.addArrangedSubview(label)
            stack.axis = .vertical
            stack.spacing = 3
            personStacks.append(stack)
        }
        let commonStack = UIStackView(arrangedSubviews: personStacks)
        commonStack.axis = .horizontal
        commonStack.distribution = .fillEqually
        addSubview(commonStack)
        commonStack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
    }
}
