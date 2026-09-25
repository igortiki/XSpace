//
//  CompanyViewModelProtocol.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//
import Observation

@MainActor
protocol CompanyViewModelProtocol: Observable {
    func fetchCompanyInfo() async
    var state: LoadState<String> { get }
    var topHeaderSection: String { get }
}
