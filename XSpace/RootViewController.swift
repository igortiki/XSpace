//
//  ViewController.swift
//  XSpace
//
//  Created by Igor Malasevschi on 8/26/26
//

import UIKit

class RootViewController: UIViewController {
    
    private var launchesViewController: LaunchesViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureRootViewController()
        // Do any additional setup after loading the view.
    }

    private func configureRootViewController() {
        let apiService = APIService(configuration: .local)
        let companyViewModel = CompanyViewModel(service: apiService)
        let launchesViewController = LaunchesViewController(viewModel: companyViewModel)
        self.launchesViewController = launchesViewController
        addChild(launchesViewController)
        
        launchesViewController.view.frame = self.view.bounds
        launchesViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(launchesViewController.view)
        launchesViewController.didMove(toParent: self)
    }
}

