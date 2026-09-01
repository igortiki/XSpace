//
//  CompanyService.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//

protocol CompanyService {
    func company() async throws -> Company
}
