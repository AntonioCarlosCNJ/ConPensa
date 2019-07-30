//
//  SectionViewHeader.swift
//  ConPensa
//
//  Created by Joao Paulo Pereira dos Santos on 10/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    static let headerView = "HeaderView"
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var category: PhotoCategory! {
        didSet {
            categoryLabel.text = category.title
            categoryImageView.image = UIImage(named: category.categoryImageName)
        }
    }
    
    
    
}
