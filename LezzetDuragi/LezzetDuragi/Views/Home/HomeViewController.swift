//
//  HomeViewController.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 11.01.2023.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var populerCategoryCollectionView: UICollectionView!
    
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
    var categories : [DishCategory] = []
    var populers : [DishPopuler] = []
    var specials : [DishPopuler] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        populerCategoryCollectionView.dataSource = self
        populerCategoryCollectionView.delegate = self
        specialCollectionView.dataSource = self
        specialCollectionView.delegate = self
        
        registerCells()
        
        ProgressHUD.show()
        NetworkingServices.shared.fetchAllCategories { [weak self] (result) in
            switch result{
                
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populers = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.populerCategoryCollectionView.reloadData()
                self?.specialCollectionView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)            }
        }
        
        
            }
    private func registerCells(){
        
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        populerCategoryCollectionView.register(UINib(nibName: DishPopulerCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPopulerCollectionViewCell.identifier)
        
        specialCollectionView.register(UINib(nibName: DishSpecialCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishSpecialCollectionViewCell.identifier)
    }
    
}
extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case populerCategoryCollectionView :
            return populers.count
        case specialCollectionView :
            return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        
            cell.setup(category: categories[indexPath.row])
            return cell
        case populerCategoryCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPopulerCollectionViewCell.identifier, for: indexPath) as! DishPopulerCollectionViewCell
        
            cell.setup(dishPopuler: populers[indexPath.row])
            return cell
        case specialCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishSpecialCollectionViewCell.identifier, for: indexPath) as! DishSpecialCollectionViewCell
        
            cell.setup(DishSpecial: specials[indexPath.row])
            return cell
 
        default: return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            
            // kategori seçiyorsa list dishes yapacağız. yani listeden yemek seçtireceğiz.
            
            let controllers = ListDishesViewController.instantiate()
            
            controllers.category = categories[indexPath.row]
            
            navigationController?.pushViewController(controllers, animated: true)
            
            
            
            
        }else {
            let controllers = DishDetailViewController.instantiate()
            
            controllers.dish = collectionView == populerCategoryCollectionView ? populers[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controllers, animated: true)
        }
    }
    }
    
        
        
    
    



