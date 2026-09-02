//
//  Company.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//

struct CompanyInfo: Decodable {
    let name: String
    let founder: String
    let founded: Int
    let employees: Int
    let launchSites: Int
    let valuation: Int64
}
