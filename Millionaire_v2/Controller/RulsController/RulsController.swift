//
//  RulsController.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 14.02.23.
//

import UIKit

class RulsController: UIViewController {
    
    private let rulsView = RulsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = rulsView
        rulsView.delegate = self
    }
}

extension RulsController: RulsViewDelegate {
    
    func didPressed(_ button: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

