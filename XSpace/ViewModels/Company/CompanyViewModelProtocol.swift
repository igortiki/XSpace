//
//  CompanyViewModelProtocol.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//
import UIKit

@MainActor
protocol CompanyViewModelProtocol: Observable {
    func fetchCompanyInfo() async
    var state: LoadState<CompanyInfo> { get }
}
