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

class CriarListaViewController: UIViewController{

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var descricao: UITextView!
    @IBOutlet weak var tipo: UISegmentedControl!
    var lista = Listas()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
      @IBAction func proximo(_ sender: Any) {
        view.endEditing(true)
        performSegue(withIdentifier: "adicionaProdutos", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AdicionarProdutosNaListaViewController
        destination.listaCriada.nome = nome.text!
        destination.listaCriada.descricao = descricao.text!
        switch tipo.selectedSegmentIndex{
        case 1:
            destination.listaCriada.tipo = TipoLista.mensal.rawValue
        default:
            destination.listaCriada.tipo = TipoLista.semanal.rawValue
        }
    }
}
