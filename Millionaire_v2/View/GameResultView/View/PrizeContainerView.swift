//
//  ResultContainerView.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 12.02.23.
//

import UIKit


class PrizeContainerView: UIView {
    
    private var prizeImageView: [PrizeView] = []
    private let stackView = UIStackView()
    
    // MARK: - Init / setup
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupStackView()
        setupPrizeImageView()
    }
    
    // MARK: - Internal methods
    
    /// задает номер вопроса для элемента таблицы результатов по индексу
    func configureNumberQuestion(by index: Int,to number: Int) {
        if index < prizeImageView.count {
            prizeImageView[index].configureNumberQuestion(number)
        }
    }
    
    /// задает стоимость вопроса для элемента таблицы результатов по индексу
    func configureCostQuestion(by index: Int,to cost: Int) {
        if index < prizeImageView.count {
            prizeImageView[index].configureCostQuestion(cost)
        }
    }
    
    /// задает картинку вопроса для элемента таблицы результатов по индексу
    func configureImageQuestion(by index: Int,to colorImage: ColorPrize) {
        if index < prizeImageView.count {
            prizeImageView[index].configureColorImage(colorImage)
        }
    }
    
    // MARK: - Private Methods
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupPrizeImageView() {
        for _ in 0...14 {
            let view = PrizeView()
            stackView.addArrangedSubview(view)
            prizeImageView.insert(view, at: 0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
