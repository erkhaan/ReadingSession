//
//  AddSessionViewController.swift
//  ReadingSession
//
//  Created by Erkhaan  on 10.02.2024.
//

import UIKit
import SnapKit

final class AddSessionViewController: UIViewController {
    
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
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupCellListConfiguration(_ cell: UITableViewCell) {
        var content = cell.defaultContentConfiguration()
        cell.contentConfiguration = content
    }
}

extension AddSessionViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension AddSessionViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        0
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath)
        return cell
    }
}
