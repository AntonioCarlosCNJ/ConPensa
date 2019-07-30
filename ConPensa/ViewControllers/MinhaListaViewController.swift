//
//  MinhaListaViewController.swift
//  ConPensa
//
//  Created by Aline Gomes on 08/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

class MinhaListaViewController: UIViewController {
    var listaSelecionada = Listas()
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = listaSelecionada.nome
        // Do any additional setup after loading the view.
    }


}
