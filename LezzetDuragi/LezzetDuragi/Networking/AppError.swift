//
//  AppError.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 14.01.2023.
//

import Foundation

// hatalarımız burda yer alır
enum AppError:LocalizedError {
    
case errorDecoding
case unkownError
case invalidUrl
case ServerError(String)
    
    var errorDescription: String? {
        
        switch self {
        case .errorDecoding:
            return "not be decoded"
        case .unkownError:
            return "unkown error"
        case .invalidUrl:
          return "give me valid url"
        case .ServerError(let error):
            return error
        }
    }
    
}
