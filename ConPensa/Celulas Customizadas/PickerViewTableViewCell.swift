//
//  PickerViewTableViewCell.swift
//  ConPensa
//
//  Created by Antonio Carlos on 09/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

protocol PickerTableViewCellDelegate: class {
    func categoryChangedForField(field: ModelFieldType, toString category: String)
}

class PickerViewTableViewCell: UITableViewCell {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var field: ModelFieldType!
    weak var delegate: PickerTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureWithField(field: ModelFieldType) {
        self.field = field
    }
    
    
}
