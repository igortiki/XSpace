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
    
    func fetchCompany() async {
        do {
            let company = try await service.company()
        }
        catch {
            print ("error")
        }
        
    }
}
