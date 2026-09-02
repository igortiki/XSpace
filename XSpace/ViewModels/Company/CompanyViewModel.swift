//
//  CompanyViewModel.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//

final class CompanyViewModel: CompanyViewModelProtocol {
    private let service: CompanyService
    
    init(service: CompanyService) {
        self.service = service
    }
    
    func fetchCompanyInfo() async {
        do {
            let companyInfo = try await service.fetchCompanyInfo()
        }
        catch {
            print ("error")
        }
        
    }
}
