//
//  CluesContainerView.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 11.02.23.
//

import UIKit

class CluesContainerView: UIView {
    
    private let height: CGFloat = 81
    private let width: CGFloat = 105
    private let spacing: CGFloat = 10
    
    var clueButtons: [UIButton] = []
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupClueButtons()
        setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            clueButtons[1].topAnchor.constraint(equalTo: topAnchor),
            clueButtons[1].bottomAnchor.constraint(equalTo: bottomAnchor),
            clueButtons[1].centerXAnchor.constraint(equalTo: centerXAnchor),
            clueButtons[1].centerYAnchor.constraint(equalTo: centerYAnchor),
            clueButtons[1].widthAnchor.constraint(equalToConstant: width),
            clueButtons[1].heightAnchor.constraint(equalToConstant: height),
            
            clueButtons[0].topAnchor.constraint(equalTo: topAnchor),
            clueButtons[0].bottomAnchor.constraint(equalTo: bottomAnchor),
            clueButtons[0].trailingAnchor.constraint(equalTo: clueButtons[1].leadingAnchor, constant: -spacing),
            clueButtons[0].widthAnchor.constraint(equalToConstant: width),
            clueButtons[0].heightAnchor.constraint(equalToConstant: height),
            
            clueButtons[2].topAnchor.constraint(equalTo: topAnchor),
            clueButtons[2].bottomAnchor.constraint(equalTo: bottomAnchor),
            clueButtons[2].leadingAnchor.constraint(equalTo: clueButtons[1].trailingAnchor, constant: spacing),
            clueButtons[2].widthAnchor.constraint(equalToConstant: width),
            clueButtons[2].heightAnchor.constraint(equalToConstant: height),
        ])
        
    }
    
    private func setupClueButtons() {
        for index in 0...2 {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setBackgroundImage(getImage(index), for: .normal)
            
            self.addSubview(button)
            clueButtons.append(button)
        }
    }
    
    private func getImage(_ index: Int) -> UIImage? {
        switch index {
        case 0: return UIImage(named: R.Images.ClueButton.fiftyFifty)
        case 1: return UIImage(named: R.Images.ClueButton.helpAudience)
        case 2: return UIImage(named: R.Images.ClueButton.callFriend)
        default: return nil
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

