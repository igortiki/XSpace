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

    func company() async throws -> Company {
        return Company(name: "TEST")
    }
}
