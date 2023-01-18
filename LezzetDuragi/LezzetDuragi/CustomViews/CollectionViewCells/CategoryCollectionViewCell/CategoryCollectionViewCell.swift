//
//  CategoryCollectionViewCell.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 12.01.2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    // storyboard kullanmadan identifier oluşturma
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    func setup(category : DishCategory){
        categoryLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.myUrl)
    }
}
