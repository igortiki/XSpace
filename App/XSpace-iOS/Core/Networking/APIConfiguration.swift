//
//  APIConfiguration.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/1/26
//

import Foundation

struct APIConfiguration {
    let baseURL: URL
    
    init(baseStringURL: String) {
        guard let baseURL = URL(string: baseStringURL) else {
            preconditionFailure("Invalid BaseURL \(baseStringURL)")
        }
        self.baseURL = baseURL
    }
}


extension APIConfiguration {
    static let local = APIConfiguration(baseStringURL: "http://localhost:8080")
}
