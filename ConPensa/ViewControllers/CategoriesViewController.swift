//
//  CategoriesViewController.swift
//  ConPensa
//
//  Created by Joao Paulo Pereira dos Santos on 09/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
   
    
 
    var photoCategories = PhotoCategory.fetchPhotos()
    
    @IBOutlet weak var estoqueCollecionView: UICollectionView!
    
    
    struct Storyboard {
        static let showDetailSegue = "ShowDetail"
        
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 3.0
    }
    
    
    let categories = ["Carne", "Vegetais", "Graos", "Legumes", "Frutas", "Massas"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return photoCategories.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoCategories[section].imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.productCell, for: indexPath) as! ProductsCollectionViewCell
        
        let photoCategory = photoCategories[indexPath.section]
        let imageNames = photoCategory.imageNames
        let imageName = imageNames[indexPath.item]
        
        cell.imageName = imageName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = estoqueCollecionView.frame.width
        let itemWidth = (collectionViewWidth - Storyboard.leftAndRightPaddings) / Storyboard.numberOfItemsPerRow
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.headerView, for: indexPath) as! SectionHeaderView

        let category = photoCategories[indexPath.section]

        sectionHeaderView.category = category

        return sectionHeaderView
    }
    
    
    //MARK:- UITableView methods
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
