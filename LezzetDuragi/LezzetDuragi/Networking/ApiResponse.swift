//
//  ApiResponse.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 14.01.2023.
//

import Foundation

// gelen veriyi çevirdik.
struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}

