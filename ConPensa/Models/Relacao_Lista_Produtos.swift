//
//  Relacao_Lista_Produtos.swift
//  ConPensa
//
//  Created by Joao Paulo Pereira dos Santos on 30/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import Foundation
class ListaProduto {
    var idLista = Int()
    var idProduto = Int()
    
    init(idLista: Int, idProduto: Int) {
        self.idProduto = idProduto
        self.idLista = idLista
    }
}
