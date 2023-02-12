//
//  LeaderBoardController.swift
//  Millionaire_v2
//
//  Created by Магомед Рамазанов on 12.02.2023.
//

import UIKit

class GameResultViewConroller: UIViewController {
    let tableView = UITableView()
    var scores = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getScores()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func getScores() {
        // Load scores from database or API
        scores = Array(repeating: 0, count: 16)
        tableView.reloadData()
    }
}

extension GameResultViewConroller: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Question \(indexPath.row + 1): $\(scores[indexPath.row])"
        return cell
    }
}
