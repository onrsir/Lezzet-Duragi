//
//  DishPopuler.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 12.01.2023.
//

import Foundation


struct DishPopuler : Decodable {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
