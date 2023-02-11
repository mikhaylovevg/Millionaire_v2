//
//  TimerView.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 10.02.23.
//

import UIKit

class TimerView: UIView {
    
    let spacing: CGFloat = 8
    
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
    
    func configureTimerLabel(_ time: Int) {
        timerLabel.text = "\(time)"
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
            containerView.heightAnchor.constraint(equalToConstant: 50),
            containerView.widthAnchor.constraint(equalToConstant: 120),
            containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.spacing = spacing
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 13),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -13),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    private func setupTimerImage() {
        timerImage.image = UIImage(systemName: R.Images.GamePlay.timerSystemImage)
        timerImage.contentMode = .scaleAspectFit
        timerImage.tintColor = .red2
        
        stackView.addArrangedSubview(timerImage)
        
//        NSLayoutConstraint.activate([
//            timerImage.topAnchor.constraint(equalTo: stackView.topAnchor),
//            timerImage.leftAnchor.constraint(equalTo: stackView.leftAnchor),
//            timerImage.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
//        ])
    }
    
    private func setupTimerLabel() {
        timerLabel.text = "05"
        timerLabel.font = UIFont.boldSystemFont(ofSize: 30)
        timerLabel.textColor = .red2
        timerLabel.textAlignment = .center
        
        stackView.addArrangedSubview(timerLabel)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

