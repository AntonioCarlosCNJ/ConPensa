//
//  CellTableViewCell.swift
//  ConPensa
//
//  Created by Filipe Lopes on 08/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colecao: UICollectionView!
    @IBOutlet weak var titulo: UILabel!
    
}

class CellCollectionViewCell: UICollectionViewCell{

    @IBOutlet weak var Nome: UILabel!
    var tipo = 0
    
}
