//
//  ViewController.swift
//  ReadingSession
//
//  Created by Erkhaan  on 28.01.2024.
//

import UIKit
import SnapKit

final class BooksViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var booksModel = [Book]()

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
    
    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Books"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addBook))
    }
    
    @objc private func addBook() {
        booksModel.append(
            Book(title: "Title", author: "Author"))
        tableView.reloadData()
    }
    
    private func setupCellListConfiguration(_ cell: UITableViewCell) {
        var content = cell.defaultContentConfiguration()
        content.text = "Test Book"
        content.secondaryText = "Test Author"
        cell.contentConfiguration = content
    }
}

extension BooksViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let vc = SessionsViewController()
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension BooksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        booksModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath)
        setupCellListConfiguration(cell)
        return cell
    }
}
