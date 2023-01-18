//
//  CardView.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 12.01.2023.
//

import UIKit

class CardView:UIView {
    
    
    // bu sayfada komple cell'lerimizi çervelerini gölgelemek için kod yazıyoruz.
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        cornerRadius = 10
        
        
    }
}
