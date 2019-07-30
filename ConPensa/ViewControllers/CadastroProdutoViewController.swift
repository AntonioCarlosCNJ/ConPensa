//
//  CadastroProdutoViewController.swift
//  ConPensa
//
//  Created by Antonio Carlos on 08/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

struct cadastro {
    var nome: String?
    var descricao: String?
    var quantidade: Int?
    var image: UIImage?
    
}

class CadastroProdutoViewController: UIViewController{
    
    @IBOutlet weak var productNameTextField: UITextField!
    
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desingTextView()
        
        productDescriptionTextView.delegate = self
    }

    @IBAction func buttonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func desingTextView(){
        productDescriptionTextView.text = "Descrição do produto..."
        productDescriptionTextView.textColor = .lightGray
        productDescriptionTextView.font = UIFont(name: "SF Text Pro", size: 13.0)
        productDescriptionTextView.returnKeyType = .done
        
        productDescriptionTextView.layer.borderColor = UIColor.gray.cgColor
        productDescriptionTextView.layer.borderWidth = 2.3
        productDescriptionTextView.layer.cornerRadius = 5
    }
    
}

extension CadastroProdutoViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Descrição do produto..." {
            textView.text = ""
            textView.textColor = .black
            textView.font = UIFont(name: "SF Text Pro", size: 18.0)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Descrição do produto..."
            textView.textColor = .lightGray
            textView.font = UIFont(name: "verdana", size: 13.0)
        }
    }
}
