//
//  GameOverView.swift
//  Millionaire_v2
//
//  Created by Иван Осипов on 10.02.2023.
//

import UIKit

class GameOverView: UIView {
    // MARK: UIImageView
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background")
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
    
    // MARK: UILabel
    
    private lazy var loseLabel: UILabel = {
        let label = UILabel()
        label.text = "Игра окончена!"
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var levelLabel: UILabel = {
        let label = UILabel()
        label.text = "Уровень 4"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var winningAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "💰 15.000"
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: UIButton
    
    lazy var newGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Новая игра", for: .normal)
        button.tintColor = .white
        button.setBackgroundImage(UIImage(named: "ButtonBlue"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var mainScreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Главная", for: .normal)
        button.tintColor = .white
        button.setBackgroundImage(UIImage(named: "ButtonBlue"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: UIStackView
    
    private var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
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
    
    // MARK: Init
    
    required init?(coder: NSCoder) {
        fatalError("\(coder)")
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    // MARK: Private Methods
    
    private func setupView() {
        self.addSubview(backgroundImageView)
        self.addSubview(topStackView)
        self.addSubview(bottomStackView)
        
        setupStackView()
        setConstraints()
    }
    
    private func setupStackView() {
        topStackView.addArrangedSubview(logoImageView)
        topStackView.addArrangedSubview(loseLabel)
        topStackView.addArrangedSubview(levelLabel)
        topStackView.addArrangedSubview(winningAmountLabel)
        
        bottomStackView.addArrangedSubview(newGameButton)
        bottomStackView.addArrangedSubview(mainScreenButton)
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
            newGameButton.heightAnchor.constraint(equalToConstant: 40),
            newGameButton.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            mainScreenButton.heightAnchor.constraint(equalToConstant: 40),
            mainScreenButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
