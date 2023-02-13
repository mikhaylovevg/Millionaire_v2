//
//  LeaderBoardView.swift
//  Millionaire_v2
//
//  Created by Магомед Рамазанов on 11.02.2023.
//

import UIKit

class PrizeTableView: UIView {
    
    private let leftAndRightOffset: CGFloat = 30
    private let topAndBottomOffset: CGFloat = 16
    
    // TODO: Сделать кнопку забрать деньги
    
    private let backgroundImageView = UIImageView()
    private let prizeContainerView = PrizeContainerView()
    
    // MARK: - Init / setup

    init() {
        super.init(frame: .zero)
        
        setupBackgroundImageView()
        setupPrizeContainerView()
    }
    
    // MARK: - Internal methods
    
    /// задает номер вопроса для элемента таблицы результатов по индексу
    func configureNumberQuestion(by index: Int,to number: Int) {
        prizeContainerView.configureNumberQuestion(by: index, to: number)
    }
    
    /// задает стоимость вопроса для элемента таблицы результатов по индексу
    func configureCostQuestion(by index: Int,to cost: Int) {
        prizeContainerView.configureCostQuestion(by: index, to: cost)
    }
    
    /// задает картинку вопроса для элемента таблицы результатов по индексу
    func configureImageQuestion(by index: Int,to colorImage: ColorPrize) {
        prizeContainerView.configureImageQuestion(by: index, to: colorImage)
    }
    
    // MARK: - Private Methods
    
    private func setupPrizeContainerView() {
        self.addSubview(prizeContainerView)
        
        NSLayoutConstraint.activate([
            prizeContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: topAndBottomOffset),
            prizeContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: leftAndRightOffset),
            prizeContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -leftAndRightOffset),
            prizeContainerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -topAndBottomOffset)
        ])
    }
    
    private func setupBackgroundImageView() {
        backgroundImageView.image = UIImage(named: R.Images.background)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
