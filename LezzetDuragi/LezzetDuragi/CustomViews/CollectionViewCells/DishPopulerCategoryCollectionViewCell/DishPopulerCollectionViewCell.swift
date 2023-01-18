//
//  DishPopulerCollectionViewCell.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 12.01.2023.
//

import UIKit
import Kingfisher

class DishPopulerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var descriptonLabel: UILabel!
    
    static let identifier = String(describing: DishPopulerCollectionViewCell.self)

    func setup (dishPopuler : DishPopuler){
        titleLabel.text = dishPopuler.name  
        dishImageView.kf.setImage(with: dishPopuler.image?.myUrl)
        
        caloriesLabel.text = dishPopuler.formattedCalories
        descriptonLabel.text = dishPopuler.description
        
        }

    }

