//
//  CompanyService.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//

protocol CompanyService: Sendable {
    func fetchCompanyInfo() async throws -> CompanyInfo
}
