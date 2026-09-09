//
//  CompanyViewModel.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//

import Foundation

@Observable
@MainActor
final class CompanyViewModel: CompanyViewModelProtocol {
    private let service: CompanyService
    private(set) var state: LoadState<CompanyInfo> = .idle
    
    
    init(service: CompanyService) {
        self.service = service
    }
    
    func fetchCompanyInfo() async {
        state = .loading
        do {
            let info = try await service.fetchCompanyInfo()
            state = .loaded(info)
        }
        catch {
            state = .failed(error)
        }
    }
    
    func makeDisplayText(from info: CompanyInfo) -> String {
        "\(info.name) was founded by \(info.founder) in \(info.founded). " +
        "It now has \(info.employees) employees, \(info.launchSites) launch sites, " +
        "and is valued at USD \(Formatter.valuation(info.valuation))."
    }
}
