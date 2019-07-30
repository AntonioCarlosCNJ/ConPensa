//
//  CriarListaViewController.swift
//  ConPensa
//
//  Created by Aline Gomes on 08/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

enum TipoLista: String{
    case mensal = "Mensal"
    case semanal = "Semanal"
}

class CriarListaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var descricao: UITextView!
    @IBOutlet weak var AdicionarProdutos: UIButton!
    @IBOutlet weak var produtosAdicionados: UIPickerView!
    @IBOutlet weak var tipo: UISegmentedControl!
    
    var lista = Listas()
    var produtos = ["Arroz","Feijão","Fraldinha","Mandioca","Macarrão","Tomate","Alface","Goiaba","Molho tomate","Mixirica"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nome.isHidden = true
        descricao.isHidden = true
        tipo.isHidden = true
        nome.placeholder = "Nome da Lista"
    }
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return produtos.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(produtos[row])"
    }
    
    @IBAction func adicionarProdutos(_ sender: Any) {
        
        nome.isHidden = false
        descricao.isHidden = false
        tipo.isHidden = false
    }
    
    @IBAction func salvar(_ sender: Any) {
        view.endEditing(true)
    
        lista.nome = nome.text!
        lista.descricao = descricao.text
        lista.produtos = produtos
        switch tipo.selectedSegmentIndex{
            case 1:
                lista.tipo = TipoLista.mensal.rawValue
            default:
                lista.tipo = TipoLista.semanal.rawValue
        }
        switch lista.tipo{
            case TipoLista.mensal.rawValue:
                listasMensais.append(lista)
            default:
                listasSemanais.append(lista)
        }
    }
}
