//
//  ViewController.swift
//  ReadingSession
//
//  Created by Erkhaan  on 28.01.2024.
//

import UIKit

final class BooksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addBook))
    }
    
    @objc private func addBook() {
        
    }
}

