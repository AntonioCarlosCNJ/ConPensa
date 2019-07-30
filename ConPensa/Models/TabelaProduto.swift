//
//  TabelaProduto.swift
//  ConPensa
//
//  Created by Filipe Lopes on 30/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import Foundation

class TabelaProduto{
    var id = Int()
    
    var nome = String()
    var descricao = String()
    var categoria = String()
    
    var desejado = Int()
    var estoque = Int()
    var validade = [Date]()
    
    var imagemPath = String()
    
    init(id: Int, nome: String, descricao: String, categoria: String, desejado: Int, estoque: Int, validade: [Date], imagemPath: String) {
        self.id = id
        self.nome = nome
        self.descricao = descricao
        self.categoria = categoria
        self.desejado = desejado
        self.estoque = estoque
        self.validade = validade
        self.imagemPath = imagemPath
    }
    
    
    
}
