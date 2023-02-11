//
//  MainScreenView.swift
//  Millionaire_v2
//
//  Created by Иван Осипов on 11.02.2023.
//

import UIKit

class MainScreenView: UIView {

    // MARK: - UIImageView
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: R.Images.background)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK:  - UILabel
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Кто хочет стать миллионером"
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK:  - UIButton
    
    lazy var rulesGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Правила игры", for: .normal)
        button.tintColor = .white
        button.setBackgroundImage(UIImage(named: R.Images.AnswerButton.blue), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var startGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Новая игра", for: .normal)
        button.tintColor = .white
        button.setBackgroundImage(UIImage(named: R.Images.AnswerButton.blue), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - UIStackView
    
    private var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError("\(coder)")
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    private func setupView() {
        self.addSubview(backgroundImageView)
        self.addSubview(topStackView)
        self.addSubview(bottomStackView)
        
        setupStackView()
        setConstraints()
    }
    
    private func setupStackView() {
        topStackView.addArrangedSubview(logoImageView)
        topStackView.addArrangedSubview(welcomeLabel)
        topStackView.addArrangedSubview(gameNameLabel)

        
        bottomStackView.addArrangedSubview(rulesGameButton)
        bottomStackView.addArrangedSubview(startGameButton)
    }
    
    private func setConstraints() {
        // Image View Constraints
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        // Stack View Constraints
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            topStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            bottomStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        // Button Constraints
        NSLayoutConstraint.activate([
            rulesGameButton.heightAnchor.constraint(equalToConstant: 40),
            rulesGameButton.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            startGameButton.heightAnchor.constraint(equalToConstant: 40),
            startGameButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

}
