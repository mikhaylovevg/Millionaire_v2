//
//  AnswerButtonsView.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 11.02.23.
//

import UIKit

class AnswersContainerView: UIView {
    
    private let offset: CGFloat = 30
    
    private let stackView = UIStackView()
    var answerButtons: [UIButton] = []
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupStackView()
        setupAnswerButtons()
    }
    
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupAnswerButtons() {
        for _ in 0...3 {
            let button = UIButton(type: .system)
            button.setTitle("Answer", for: .normal)
            let image = UIImage(named: R.Images.AnswerButton.blue)
            button.setBackgroundImage(image, for: .normal)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.tintColor = .white
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            
            //            button.layer.shadowColor = UIColor.darkGray.cgColor
            //            button.layer.shadowRadius = 4
            //            button.layer.shadowOffset = .init(width: 5, height: 5)
            //            button.layer.shadowOpacity = 10
            
            stackView.addArrangedSubview(button)
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 45)])
            
            answerButtons.append(button)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

