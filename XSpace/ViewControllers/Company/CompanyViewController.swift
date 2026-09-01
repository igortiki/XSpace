//
//  CompanyViewController.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//

import UIKit

final class CompanyViewController: UIViewController {
    let viewModel: CompanyViewModelProtocol
    
    init(viewModel: CompanyViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
