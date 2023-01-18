//
//  DishDetailViewController.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 13.01.2023.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var calLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    var dish : DishPopuler!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populatView()
        
    }
    
    // tıklandığında fotoğraf ve açıklamaları göstermesini sağladık
    private func populatView() {
        dishImageView.kf.setImage(with: dish.image?.myUrl)
        titleLabel.text = dish.name
        calLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
        
    }
    
    
    @IBAction func ButtonClicked(_ sender: UIButton) {
        
        ProgressHUD.show("Placing Order...")
        
        NetworkingServices.shared.placeOrder(dishId: dish.id ?? "", name: dish.name ?? "elyaf") { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received. 👨🏼‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
        
    }
}
