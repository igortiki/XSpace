//
//  LaunchesViewController.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//

import UIKit
import Observation

final class LaunchesViewController: UIViewController {
    let viewModel: CompanyViewModelProtocol
    
    init(viewModel: CompanyViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeState()
        
        Task {
            await viewModel.fetchCompanyInfo()
        }
    }
        
    private func observeState() {
        withObservationTracking {
            print (viewModel.state)
        }
        onChange: { [weak self] in
            Task { @MainActor in
                self?.observeState()
            }
        }
    }
}
