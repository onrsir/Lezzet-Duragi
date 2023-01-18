//
//  AllDishes.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 14.01.2023.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [DishPopuler]?
    let specials: [DishPopuler]?
}
