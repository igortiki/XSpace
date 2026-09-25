//
//  APIError+UserMessage.swift
//  XSpace
//
//  Created by Igor Malasevschi on 9/8/26
//

extension APIError {
    var userMessage: String {
        switch self {
    
        case .badStatusCode(let code):
            "Server returned an error (code: \(code))."

        case .decodingFailed:
            "Failed to decode the server response."

        case .imageDecodingFailed:
            "Failed to decode image data."
        }
    }
}
