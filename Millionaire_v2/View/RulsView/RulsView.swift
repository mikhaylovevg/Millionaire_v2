//
//  RulsView.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 14.02.23.
//

import UIKit

protocol RulsViewDelegate {
    func didPressed(_ button: UIButton)
}

class RulsView: UIView {
    
    private let backgroundImageView = UIImageView()
    private let comeBackButton = UIButton(type: .system)
    var delegate: RulsViewDelegate?
    
    init() {
        super.init(frame: .zero)

        backgroundColor = .white
        
        setupBackgroundImageView()
        setupComeBackButton()
    }
    
    private func setupComeBackButton() {
        comeBackButton.setTitle("Главная", for: .normal)
        comeBackButton.tintColor = .white
        comeBackButton.setBackgroundImage(UIImage(named: R.Images.AnswerButton.blue), for: .normal)
        comeBackButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        comeBackButton.layer.cornerRadius = 20
        comeBackButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(comeBackButton)
        
        NSLayoutConstraint.activate([
            comeBackButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            comeBackButton.widthAnchor.constraint(equalToConstant: 300),
            comeBackButton.heightAnchor.constraint(equalToConstant: 40),
            comeBackButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        comeBackButton.addTarget(self, action: #selector(didPressed), for: .touchUpInside)
    }
    
    private func setupBackgroundImageView() {
        backgroundImageView.image = UIImage(named: R.Images.background)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc func didPressed(_ sender: UIButton) {
        delegate?.didPressed(sender)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
