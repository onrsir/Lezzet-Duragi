//
//  OnBoardingCollectionViewCell.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 10.01.2023.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideTitle: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    
    
    func setup(_ slide: OnBoardingSlide ){
        
        slideImageView.image = slide.image
        slideTitle.text = slide.title
    }
}


