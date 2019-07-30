//
//  ProductsCollectionViewCell.swift
//  ConPensa
//
//  Created by Joao Paulo Pereira dos Santos on 10/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    static let productCell = "ProductCell"
    
    
    @IBOutlet weak var image: UIImageView!
    
    var imageName: String! {
        didSet {
            image.image = UIImage(named: imageName)
        }
    }
}
