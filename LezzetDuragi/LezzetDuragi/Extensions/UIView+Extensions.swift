//
//  UIView+Extensions.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 10.01.2023.
//

import Foundation
import UIKit

extension UIView {
    
  @IBInspectable  var cornerRadius : CGFloat {
      get {return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
        
    }
}
