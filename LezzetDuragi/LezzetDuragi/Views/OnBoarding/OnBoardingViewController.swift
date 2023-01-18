//
//  OnBoardingViewController.swift
//  LezzetDuragi
//
//  Created by Onur Sir on 10.01.2023.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var slides : [OnBoardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Hadi Başlayalım!", for: .normal)
                
            } else {
                nextButton.setTitle("İleri", for: .normal)
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        slides = [
            OnBoardingSlide(title: "En hızlı", image: UIImage(named: "slide3")!),
            OnBoardingSlide(title: "En iyi", image: UIImage(named: "slide1")!),
            OnBoardingSlide(title: "En lezzetli", image: UIImage(named: "slide2")!)
            ]
        pageControl.numberOfPages = slides.count // kaç slaytım varsa o kadar gözükecek
    }
    

  
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        
        // son sayfada değilsek butona tıklandığında sayfanın altındaki kutucuğu ilerlet
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "homeNC") as! UINavigationController
            
            // home page'e geçiş
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .partialCurl
            present(controller, animated: true)
            
     
        }else {
            currentPage = currentPage + 1
            
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

        }
        
    }
    
}

extension OnBoardingViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCollectionViewCell", for: indexPath) as! OnBoardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
    }
    
    // kaydırma işlemini hangi sayfada olduğumuzu ufak kutuda gösterme
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / witdh)
    }
    }
    
    
    

