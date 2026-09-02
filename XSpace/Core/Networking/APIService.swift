//
//  APIService.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//

final class APIService: CompanyService {

    let configuration: APIConfiguration

    init(configuration: APIConfiguration) {
        self.configuration = configuration
    }

    func fetchCompanyInfo() async throws -> CompanyInfo {
        return CompanyInfo(name: "String", founder: "String", founded: 0, employees:0, launchSites: 0, valuation: 0)
    }
}
