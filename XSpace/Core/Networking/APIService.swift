//
//  APIService.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//


import Foundation

final class APIService: CompanyService {
    
    let configuration: APIConfiguration
    private let session: URLSession
    
    
    init(configuration: APIConfiguration, session: URLSession = .shared) {
        self.configuration = configuration
        self.session = session
    }
    
    func fetchCompanyInfo() async throws -> CompanyInfo {
        try await request()
    }
    
    
    private func request<T:Decodable>() async throws -> T {
        
        return CompanyInfo(name: "String", founder: "String", founded: 0, employees:0, launchSites: 0, valuation: 0) as! T
    }
}
