//
//  Banquito.swift
//  ConPensa
//
//  Created by Joao Paulo Pereira dos Santos on 30/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit
import CoreData

class Banquito {
//    let listas : [TabelaLista]
//    let produtos : [TabelaProduto]
//    let listaProdutos : [ListaProdutos]
    
    func fetchListas() -> [TabelaLista]? {
        var listasAux: [NSManagedObject] = []
        var saidaLista: [TabelaLista] = []
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Listas")
        
        do {
            listasAux = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Deu ruim no fetch das listas, \(error)")
        }

        for lista in listasAux {
            if listasAux.count > 0 {
                let listinha = TabelaLista(idLista: 0, nomeLista: "Teste", descricao: "Teste", frequenciaDeCompra: true, dataDaCompra: Date())
                listinha.dataDaCompra = lista.value(forKey: "data") as! Date
                listinha.descricao = lista.value(forKey: "descricao") as! String
                listinha.frequenciaDeCompra = lista.value(forKey: "semanal") as! Bool
                listinha.idLista = lista.value(forKey: "id") as! Int
                listinha.nomeLista = lista.value(forKey: "nome") as! String
                saidaLista.append(listinha)
            }
        }
        
        return saidaLista
    }
    
    func fetchProdutos() -> [TabelaProduto]? {
        var produtosAux: [NSManagedObject] = []
        var saidaProd: [TabelaProduto] = []
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Produto")
        
        do {
            produtosAux = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Deu ruim no fetch dos produtos, \(error)")
        }
        
        for produto in produtosAux {
            if produtosAux.count > 0 {
                let produtinho = TabelaProduto(id: 0, nome: "Teste", descricao: "teste", categoria: "teste", desejado: 0, estoque: 0, validade: Date(), imagemPath: "teste" )
                produtinho.categoria =  produto.value(forKey: "categoria") as! String
                produtinho.descricao =  produto.value(forKey: "descricao") as! String
                produtinho.desejado =  produto.value(forKey: "desejado") as! Int
                produtinho.estoque =  produto.value(forKey: "estoque") as! Int
                produtinho.id =  produto.value(forKey: "id") as! Int
                produtinho.imagemPath =  produto.value(forKey: "imagem") as! String
                produtinho.nome =  produto.value(forKey: "nome") as! String
                saidaProd.append(produtinho)
            }
        }

        return saidaProd
    }
    
    func fetchRelacoes() -> [ListaProduto]? {
        var relacoesAux: [NSManagedObject] = []
        var saidaRelacao: [ListaProduto] = []
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Lista_Produtos")
        
        do {
            relacoesAux = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Deu ruim no fetch das relacoes \(error)")
        }
        
        for relacao in relacoesAux {
            if relacoesAux.count > 0 {
                let caso = ListaProduto(idLista: 0, idProduto: 0)
                caso.idLista = relacao.value(forKey: "id_lista") as! Int
                caso.idProduto = relacao.value(forKey: "id_produto") as! Int
                saidaRelacao.append(caso)
            }
        }
        return saidaRelacao
    }
    
    func saveListas(lista: TabelaLista, produtos: [Int]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Listas",in: managedContext)!
        
        let listaAux = NSManagedObject(entity: entity, insertInto: managedContext)
        listaAux.setValue(lista.dataDaCompra,forKey: "data")
        listaAux.setValue(lista.descricao,forKey: "descricao")
        listaAux.setValue(lista.idLista,forKey: "id")
        listaAux.setValue(lista.nomeLista,forKey: "nome")
        listaAux.setValue(lista.frequenciaDeCompra,forKey: "semanal")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Deu ruim salvando a lista \(error)")
        }
        
        saveRelacoes(idLista:lista.idLista,produtos: produtos)
        
    }
    
    func saveProdutos(produto: TabelaProduto) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Produto",in: managedContext)!
        let produtoAux = NSManagedObject(entity: entity, insertInto: managedContext)
        produtoAux.setValue(produto.categoria,forKey: "categoria")
        produtoAux.setValue(produto.descricao,forKey: "descricao")
        produtoAux.setValue(produto.desejado,forKey: "desejado")
        produtoAux.setValue(produto.estoque,forKey: "estoque")
        produtoAux.setValue(produto.id,forKey: "id")
        produtoAux.setValue(produto.imagemPath,forKey: "imagem")
        produtoAux.setValue(produto.nome,forKey: "nome")
        produtoAux.setValue(produto.validade,forKey: "validade")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Deu ruim salvando o produto \(error)")
        }
        
        print("Produto Salvo com sucesso")
        
    }
    
    func saveRelacoes(idLista: Int, produtos: [Int]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Lista_Produtos",in: managedContext)!
        let relacaoAux = NSManagedObject(entity: entity, insertInto: managedContext)
        for i in produtos {
            relacaoAux.setValue(idLista,forKey: "id_lista")
            relacaoAux.setValue(i ,forKey: "id_produto")
        }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Deu erro salvando as relacoes \(error)")
        }
        
    }
}
