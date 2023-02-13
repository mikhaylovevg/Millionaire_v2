//
//  LeaderBoardView.swift
//  Millionaire_v2
//
//  Created by Магомед Рамазанов on 11.02.2023.
//

import UIKit

class PrizeTableView: UIView {
    
    private let heightCont: CGFloat = 81
    private let widthButton: CGFloat = 105
    private var spacing: CGFloat {
        return (widthButton / 2) + 10
    }
    
    private let leftAndRightOffset: CGFloat = 30
    private let topAndBottomOffset: CGFloat = 16
    
    private let containerForButton = UIView()
    let takeMoneyButton = UIButton(type: .system)
    let continueGameButton = UIButton(type: .system)
    
    private let backgroundImageView = UIImageView()
    private let prizeContainerView = PrizeContainerView()
    
    
    // MARK: - Init / setup

    init() {
        super.init(frame: .zero)
        
        setupBackgroundImageView()
        setupContainerForButton()
        setupTakeMoneyButton()
        setupContinueGame()
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
            prizeContainerView.bottomAnchor.constraint(equalTo: containerForButton.topAnchor, constant: -topAndBottomOffset)
        ])
    }
    
    private func setupContainerForButton() {
        containerForButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerForButton)
        
        NSLayoutConstraint.activate([
            containerForButton.heightAnchor.constraint(equalToConstant: heightCont),
            containerForButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            containerForButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            containerForButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -topAndBottomOffset)
        ])
    }
    
    private func setupContinueGame() {
        continueGameButton.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: R.Images.ClueButton.continueGame)
        continueGameButton.setBackgroundImage(image, for: .normal)
        
        containerForButton.addSubview(continueGameButton)
        
        NSLayoutConstraint.activate([
            continueGameButton.heightAnchor.constraint(equalTo: containerForButton.heightAnchor),
            continueGameButton.widthAnchor.constraint(equalToConstant: widthButton),
            continueGameButton.centerXAnchor.constraint(equalTo: containerForButton.centerXAnchor, constant: spacing),
            continueGameButton.centerYAnchor.constraint(equalTo: containerForButton.centerYAnchor)
        ])
    }
    
    private func setupTakeMoneyButton() {
        takeMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: R.Images.ClueButton.takeMoney)
        takeMoneyButton.setBackgroundImage(image, for: .normal)
        
        containerForButton.addSubview(takeMoneyButton)
        
        NSLayoutConstraint.activate([
            takeMoneyButton.heightAnchor.constraint(equalTo: containerForButton.heightAnchor),
            takeMoneyButton.widthAnchor.constraint(equalToConstant: widthButton),
            takeMoneyButton.centerXAnchor.constraint(equalTo: containerForButton.centerXAnchor, constant: -spacing),
            takeMoneyButton.centerYAnchor.constraint(equalTo: containerForButton.centerYAnchor)
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
