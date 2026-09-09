//
//  APIError.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/4/26
//

enum APIError: Error {
    case badStatusCode(Int)
    case decodingFailed(Error)
    case imageDecodingFailed
}
