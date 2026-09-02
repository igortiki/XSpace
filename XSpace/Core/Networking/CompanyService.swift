//
//  CompanyService.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//

protocol CompanyService {
    func fetchCompanyInfo() async throws -> CompanyInfo
}
