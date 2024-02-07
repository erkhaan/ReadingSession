//
//  SessionsViewController.swift
//  ReadingSession
//
//  Created by Erkhaan  on 07.02.2024.
//

import UIKit
import SnapKit

final class SessionsViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var sessionsModel = [Session]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationItem()
        setupLayout()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Sessions"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addSession))
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    @objc private func addSession() {
        sessionsModel.append(
            Session(
                startTime: Date(timeIntervalSinceNow: .zero),
                finishTime: Date(timeIntervalSinceNow: .zero),
                kindlePrediction: Date(timeIntervalSinceNow: .zero)))
        tableView.reloadData()
    }
    
    private func setupCellListConfiguration(_ cell: UITableViewCell) {
        var content = cell.defaultContentConfiguration()
        content.text = "Test"
        content.secondaryText = "Test"
        cell.contentConfiguration = content
    }
}

extension SessionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension SessionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sessionsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath)
        setupCellListConfiguration(cell)
        return cell
    }
}
