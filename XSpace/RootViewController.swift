//
//  ViewController.swift
//  XSpace
//
//  Created by Igor Malasevschi on 8/26/26
//

import UIKit

class RootViewController: UIViewController {
    
    private var companyViewController: CompanyViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureRootViewController()
        // Do any additional setup after loading the view.
    }

    private func configureRootViewController() {
        let apiService = APIService(configuration: .local)
        let companyViewModel = CompanyViewModel(service: apiService)
        let companyViewController = CompanyViewController(viewModel: companyViewModel)
        self.companyViewController = companyViewController
        addChild(companyViewController)
        
        companyViewController.view.frame = self.view.bounds
        companyViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(companyViewController.view)
        companyViewController.didMove(toParent: self)
    }
}

