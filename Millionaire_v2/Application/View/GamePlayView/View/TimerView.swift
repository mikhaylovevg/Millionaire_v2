//
//  TimerView.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 10.02.23.
//

import UIKit

class TimerView: UIView {
    
    let spacing: CGFloat = 8
    let offset: CGFloat = 10
    
    private let timerLabel = UILabel()
    private let timerImage = UIImageView()
    
    private let containerView = UIView()
    private let stackView = UIStackView()
    
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupContainerView()
        setupStackView()
        setupTimerImage()
        setupTimerLabel()
    }
    
    private func setupView() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupContainerView() {
        containerView.layer.cornerRadius = 25
        containerView.backgroundColor = .red5
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalTo: self.heightAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 100),
            containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.spacing = spacing
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: offset),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: offset),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -offset),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -offset)
        ])
    }
    
    private func setupTimerImage() {
        timerImage.image = UIImage(systemName: R.Images.GamePlay.timerSystemImage)
        timerImage.contentMode = .scaleAspectFit
        timerImage.tintColor = .red2
        
        stackView.addArrangedSubview(timerImage)
    }
    
    private func setupTimerLabel() {
        timerLabel.text = "05"
        timerLabel.font = UIFont.boldSystemFont(ofSize: 30)
        timerLabel.textColor = .red2
        timerLabel.textAlignment = .right
        
        stackView.addArrangedSubview(timerLabel)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

