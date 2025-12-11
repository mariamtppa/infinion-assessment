//
//  AppError.swift
//  infinion-assessment
//
//  Created by USER on 11/12/2025.
//

import Foundation

enum AppError: Error, CustomStringConvertible {
    case decodingError
    case emptyResponse
    case endpointError(message: String)
    
    var description: String {
        switch self {
        case .decodingError:
            "Sorry, something went wrong. Please try again later."
        case .emptyResponse:
            "There is no response for your city."
        case .endpointError(let message):
            message
        }
    }
}
