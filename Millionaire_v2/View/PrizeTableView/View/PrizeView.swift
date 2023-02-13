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
        
        setupNumberLabel()
        setupCostLabel()
    }
    
    
    // MARK: - Internal methods
    
    func configureCostQuestion(_ cost: Int) {
        costlabel.text = "\(cost)"
    }
    
    func configureNumberQuestion(_ numder: Int) {
        numderlabel.text = "Вопрос  \(numder)"
    }
    
    func configureColorImage(_ image: ColorPrize) {
        
        let imageForView: UIImage?
        
        switch image {
        case .blue:
            imageForView = UIImage(named: R.Images.AnswerButton.blue)
        case .green:
            imageForView = UIImage(named: R.Images.AnswerButton.green)
        case .red:
            imageForView = UIImage(named: R.Images.AnswerButton.red)
        case .violet:
            imageForView = UIImage(named: R.Images.AnswerButton.violet)
        case .yellow:
            imageForView = UIImage(named: R.Images.AnswerButton.yellow)
        }
        
        imageView.image = imageForView
    }
    
    // MARK: - Private Methods
    
    private func setupImageView() {
        imageView.image = UIImage(named: R.Images.AnswerButton.violet)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
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
    
    private func setupNumberLabel() {
        numderlabel.text = "Вопрос номер"
        numderlabel.font = UIFont.boldSystemFont(ofSize: 18)
        numderlabel.textColor = .white
        numderlabel.textAlignment = .left
        
        stackView.addArrangedSubview(numderlabel)
    }
    
    private func setupCostLabel() {
        costlabel.text = "100"
        costlabel.font = UIFont.boldSystemFont(ofSize: 18)
        costlabel.textColor = .white
        costlabel.textAlignment = .right
        
        stackView.addArrangedSubview(costlabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
