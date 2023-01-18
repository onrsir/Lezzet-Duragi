//
//  String + Extension.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 12.01.2023.
//

import Foundation

extension String {
    
    var myUrl : URL? {
        return URL(string: self)
    }
}
