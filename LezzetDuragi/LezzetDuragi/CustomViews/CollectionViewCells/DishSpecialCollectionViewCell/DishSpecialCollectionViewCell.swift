//
//  DishSpecialCollectionViewCell.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 13.01.2023.
//

import UIKit
import Kingfisher

class DishSpecialCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var specialImage: UIImageView!
    @IBOutlet weak var dishSpecialLabel: UILabel!
    @IBOutlet weak var specialDescLbl: UILabel!
    @IBOutlet weak var specialCaloriesLbl: UILabel!
   
    static let identifier = String(describing: DishSpecialCollectionViewCell.self)

    func setup(DishSpecial : DishPopuler) {
        // popüler modelinden aldık çünkü cell'lerin içerikleri aynı olacak
        specialImage.kf.setImage(with: DishSpecial.image?.myUrl)
        dishSpecialLabel.text = DishSpecial.name
        specialDescLbl.text = DishSpecial.description
        specialCaloriesLbl.text = DishSpecial.formattedCalories

        
        
    }

}
