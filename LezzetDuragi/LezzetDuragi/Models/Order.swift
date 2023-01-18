//
//  Order.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 14.01.2023.
//

import Foundation

struct Order:Decodable {
    let id: String?
    let name : String?
    let dish : DishPopuler?
}


