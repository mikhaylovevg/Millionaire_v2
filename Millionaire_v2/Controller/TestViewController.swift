//
//  TestViewController.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 13.02.23.
//

import UIKit

class TestViewController: UIViewController {
    
    private var brain = GameBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array = brain.quiz
        
        array.enumerated().forEach { (i, e) in
            print("index: \(i), cost: \(e.cost), level: \(e.levelQuestion)")
        }
    }
    
}
