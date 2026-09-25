//
//  RootViewController.swift
//  XSpace-tvOS
//

import UIKit

final class RootViewController: UIViewController {

    private let placeholderLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        placeholderLabel.text = "XSpace tvOS"
        placeholderLabel.font = .boldSystemFont(ofSize: 64)
        placeholderLabel.textColor = .white
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(placeholderLabel)

        NSLayoutConstraint.activate([
            placeholderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeholderLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
