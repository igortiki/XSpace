//
//  LaunchesViewController.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//

import UIKit
import Observation

final class LaunchesViewController: UIViewController {

    // MARK: - Dependencies

    private let companyViewModel: CompanyViewModelProtocol

    // MARK: - UI
    private let companyDescriptionLabel = UILabel()

    // MARK: - Initialization

    init(viewModel: CompanyViewModelProtocol) {
        self.companyViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        observeState()
        fetchCompanyInfo()
    }

    // MARK: - Setup

    private func setupLayout() {
        let titleContainer = makeTitleContainer()
        let descriptionContainer = makeDescriptionContainer()

        let headerContainer = makeHeaderContainer(titleContainer: titleContainer, descriptionContainer: descriptionContainer)

        view.addSubview(headerContainer)

        NSLayoutConstraint.activate([
            headerContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8),
            headerContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            headerContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8),
            headerContainer.heightAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
    }

    private func makeTitleContainer() -> UIView {
        let companySectionLabel = UILabel()

        companySectionLabel.text = companyViewModel.topHeaderSection
        companySectionLabel.font = .boldSystemFont(ofSize: 20)
        companySectionLabel.textAlignment = .left
        companySectionLabel.textColor = UIColor(white: 0.95, alpha: 1)
        companySectionLabel.translatesAutoresizingMaskIntoConstraints = false

        let container = UIView()
        container.backgroundColor = UIColor(red: 28 / 255, green: 36 / 255, blue: 58 / 255, alpha: 1)
        container.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(companySectionLabel)

        NSLayoutConstraint.activate([
            companySectionLabel.topAnchor.constraint(equalTo: container.topAnchor),
            companySectionLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8),
            companySectionLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8),
            companySectionLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.heightAnchor.constraint(equalToConstant: 40)
        ])

        return container
    }

    private func makeDescriptionContainer() -> UIView {
        companyDescriptionLabel.numberOfLines = 0
        companyDescriptionLabel.font = .systemFont(ofSize: 15)
        companyDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        let container = UIView()
        container.backgroundColor = .systemBackground
        container.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(companyDescriptionLabel)

        NSLayoutConstraint.activate([
            companyDescriptionLabel.topAnchor.constraint(equalTo: container.topAnchor,constant: 8),
            companyDescriptionLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 8),
            companyDescriptionLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -8),
            companyDescriptionLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor,constant: -8)
        ])

        return container
    }

    private func makeHeaderContainer(titleContainer: UIView, descriptionContainer: UIView) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [titleContainer, descriptionContainer])

        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.layer.cornerRadius = 8
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.separator.cgColor
        stackView.layer.masksToBounds = true

        return stackView
    }

    // MARK: - Observation

    private func observeState() {
        withObservationTracking {
            render(companyViewModel.state)
        } onChange: { [weak self] in
            Task { @MainActor in
                self?.observeState()
            }
        }
    }

    // MARK: - Data

    private func fetchCompanyInfo() {
        Task {
            await companyViewModel.fetchCompanyInfo()
        }
    }

    // MARK: - Rendering

    private func render(_ state: LoadState<String>) {
        switch state {
        case .idle:
            break

        case .loading:
            break

        case .loaded(let description):
            companyDescriptionLabel.text =  description
        case .failed(let error):
            print(error)
        }
    }
}
