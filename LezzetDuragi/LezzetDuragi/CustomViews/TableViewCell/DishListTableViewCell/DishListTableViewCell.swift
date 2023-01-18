//
//  DishListTableViewCell.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 13.01.2023.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    static let identifier = "DishListTableViewCell"
    
    func setup(dish : DishPopuler) {
        dishImageView.kf.setImage(with: dish.image?.myUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        
    }
    func setup(order : Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.myUrl)
        titleLabel.text = order.dish?.name
        descriptionLabel.text = order.name
        
    }
    
    
}
