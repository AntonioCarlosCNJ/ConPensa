//
//  Produto.swift
//  ConPensa
//
//  Created by Antonio Carlos on 09/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

enum ModelFieldType: String{
    case nomeProduto = "Nome do Produto:"
    case descricao = "Descrição:"
    case categoria = "Categoria:"
    case dataValidade = "Data de Validade:"
    case imagem = "Imagem:"
    case quantidade = "Quantidade:"
}

class ProdutoLocal: NSObject {

    var nomeProduto: String!
    var descricao: String!
    var categoria: String!
    var dataValidade: Date!
    var quantidade: String!
    var imagem: UIImage!
    
    init(nomeProduto: String, descricao: String, categoria: String, dataValidade: Date, imagem: UIImage, quantidade: String){
        self.nomeProduto = nomeProduto
        self.descricao = descricao
        self.categoria = categoria
        self.dataValidade = dataValidade
        self.imagem = imagem
        self.quantidade = quantidade
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let otherProduct = object as? ProdutoLocal else {return false}
        return otherProduct == self
    }
    
    static var _dateFormatter: DateFormatter?
    fileprivate static var dateFormatter: DateFormatter{
        if(_dateFormatter == nil){
            _dateFormatter = DateFormatter()
            _dateFormatter!.locale = Locale.current
            _dateFormatter!.dateFormat = "dd/MM/yyyy"
        }
        return _dateFormatter!
    }
    
    static func dateFromString(dateString: String) -> Date?{
        return dateFormatter.date(from: dateString)
    }
    
    static func dateStringFromDate(date: Date) -> String{
        return dateFormatter.string(from: date)
    }
    
    func valueForField(field: ModelFieldType) -> Any{
        switch field {
            case .nomeProduto: return nomeProduto as Any
            case .descricao: return descricao as Any
            case .categoria: return categoria as Any
            case .dataValidade: return dataValidade as Any
            case .imagem: return imagem as Any
            case .quantidade: return quantidade as Any
        }
    }
    
    func stringValueForField(field: ModelFieldType) -> String{
        if field == .dataValidade{
            guard let date = dataValidade else {return "-"}
            return ProdutoLocal.dateStringFromDate(date: date)
        } else {
            return valueForField(field: field) as? String ?? "-"
        }
    }
    
    func setValue(value: Any, forField field: ModelFieldType){
        switch field {
        case .categoria: if let categoria = value as? String {self.categoria = categoria}
        case .descricao: if let descricao = value as? String {self.descricao = descricao}
        case .nomeProduto: if let nomeProduto = value as? String {self.nomeProduto = nomeProduto}
        case .quantidade: if let quantidade = value as? String {self.quantidade = quantidade}
        case .imagem: if let imagem = value as? UIImage {self.imagem = imagem}
        case .dataValidade:
            if let dataValidade = value as? Date {self.dataValidade = dataValidade}
            else if let dvString = value as? String, let dvFromString = ProdutoLocal.dateFromString(dateString: dvString) {self.dataValidade = dvFromString}
        }
    }
    
}
