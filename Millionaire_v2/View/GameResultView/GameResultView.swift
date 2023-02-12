//
//  LeaderBoardView.swift
//  Millionaire_v2
//
//  Created by Магомед Рамазанов on 11.02.2023.
//

import UIKit

class GameResultView: UIView {
    
    let leftAndRightOffset: CGFloat = 30
    let topAndBottomOffset: CGFloat = 16
    
    private let backgroundImageView = UIImageView()
    private let resultContainerView = ResultContainerView()

    init() {
        super.init(frame: .zero)
        
        setupBackgroundImageView()
        setupResultContainerView()
    }
    
    /// задает текст элемента таблицы результатов по индексу от 0 - 14
    func configereResultTable(for index: Int, text: String) {
        resultContainerView.configureResultTitle(index, text)
    }
    
    /// задает цвет элемента таблицы результатов по индексу от 0 - 14
    func configureResultTable(for index: Int,and color: ColorTableResult) {
        resultContainerView.configureResult(index: index, color: color)
    }
    
    
    private func setupResultContainerView() {
        self.addSubview(resultContainerView)
        
        NSLayoutConstraint.activate([
            resultContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: topAndBottomOffset),
            resultContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: leftAndRightOffset),
            resultContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -leftAndRightOffset),
            resultContainerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -topAndBottomOffset)
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
