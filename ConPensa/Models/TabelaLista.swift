//
//  Lista.swift
//  ConPensa
//
//  Created by Joao Paulo Pereira dos Santos on 30/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import Foundation
import CoreData

class TabelaLista {
    var idLista = Int()
    var nomeLista = String()
    var descricao = String()
    var frequenciaDeCompra = true
    var dataDaCompra = Date()
    
    init(idLista: Int, nomeLista: String, descricao: String, frequenciaDeCompra: Bool, dataDaCompra: Date) {
        self.idLista = idLista
        self.nomeLista = nomeLista
        self.descricao = descricao
        self.frequenciaDeCompra = frequenciaDeCompra
        self.dataDaCompra = dataDaCompra
    }
}
