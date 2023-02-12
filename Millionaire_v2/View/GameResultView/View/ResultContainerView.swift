//
//  ResultContainerView.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 12.02.23.
//

import UIKit

enum ColorTableResult {
    case blue
    case green
    case red
    case violet
    case yellow
}

class ResultContainerView: UIView {
    
    private var resultsButtons: [UIButton] = []
    private let stackView = UIStackView()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupStackView()
        setupResultsButtons()
    }
    
    /// задает текст для элемента таблицы результатов
    func configureResultTitle(_ index: Int,_ text: String) {
        if index < resultsButtons.count {
            resultsButtons[index].setTitle(text, for: .normal)
        }
    }
    
    /// задает цвет для таблицы результатов
    func configureResult(index: Int, color: ColorTableResult) {
        if index < resultsButtons.count {
            switch color {
            case .blue:
                setImageFor(button: index, R.Images.AnswerButton.blue)
            case .green:
                setImageFor(button: index, R.Images.AnswerButton.green)
            case .red:
                setImageFor(button: index, R.Images.AnswerButton.red)
            case .violet:
                setImageFor(button: index, R.Images.AnswerButton.violet)
            case .yellow:
                setImageFor(button: index, R.Images.AnswerButton.yellow)
            }
        }
    }
    
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
    
    private func setupResultsButtons() {
        for _ in 0...14 {
            let button = UIButton()
            let image = UIImage(named: R.Images.AnswerButton.blue)
            button.setBackgroundImage(image, for: .normal)
            button.setBackgroundImage(image, for: .highlighted)
            button.setTitleColor(.white, for: .normal)
            button.setTitle("", for: .normal)
            
            resultsButtons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    
    private func setImageFor(button index: Int,_ imageName: String) {
        let image = UIImage(named: imageName)
        resultsButtons[index].setBackgroundImage(image, for: .normal)
        resultsButtons[index].setBackgroundImage(image, for: .highlighted)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
