//
//  PrizeView.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 13.02.23.
//

import UIKit

enum ColorPrize {
    case blue
    case green
    case red
    case violet
    case yellow
}

class PrizeView: UIView {
    
    private let leftAndRightOffset: CGFloat = 16
    
    private let imageView = UIImageView()
    private let numderlabel = UILabel()
    private let costlabel = UILabel()
    
    private let stackView = UIStackView()
    
    // MARK: - Init / setup
    
    init() {
        super.init(frame: .zero)
        
        setupImageView()
        setupStackView()
        setupFor(label: numderlabel, with: "Вопрос номер 1", and: .left)
        setupFor(label: costlabel, with: "100", and: .right)
    }
    
    
    // MARK: - Internal methods
    
    func configureColorImage(_ image: ColorPrize) {
        
    }
    
    // MARK: - Private Methods
    
    func configureCostQuestion(_ cost: Int) {
        costlabel.text = "\(cost)"
    }
    
    func configureNumberQuestion(_ numder: Int) {
        numderlabel.text = "Вопрос \(numder)"
    }
    
    func configureImage(color: ColorPrize) {
        
        let image: UIImage?
        
        switch color {
        case .blue:
            image = UIImage(named: R.Images.AnswerButton.blue)
        case .green:
            image = UIImage(named: R.Images.AnswerButton.green)
        case .red:
            image = UIImage(named: R.Images.AnswerButton.red)
        case .violet:
            image = UIImage(named: R.Images.AnswerButton.violet)
        case .yellow:
            image = UIImage(named: R.Images.AnswerButton.yellow)
        }
        
        imageView.image = image
    }
    
    private func setupImageView() {
        imageView.image = UIImage(named: R.Images.AnswerButton.violet)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  leftAndRightOffset),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -leftAndRightOffset),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupFor(label: UILabel, with text: String,and textAlignment: NSTextAlignment) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = textAlignment
        
        stackView.addArrangedSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
