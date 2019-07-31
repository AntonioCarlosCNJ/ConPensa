//
//  ViewController.swift
//  ConPensa
//
//  Created by Filipe Lopes on 08/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    
    let labelsController = LabelsController()
    var indexAux = 0
    var cellAux = CellTableViewCell()
    var terminado = false
    
    var produtoTeste = TabelaProduto()
    var produtosTeste: [TabelaProduto] = []
    let banquito = Banquito()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        produtoTeste.categoria = "fruta"
        produtoTeste.descricao = "comprei porque gosto"
        produtoTeste.desejado = 4
        produtoTeste.estoque = 10
        produtoTeste.id = 100
        produtoTeste.imagemPath = "˜/joaoPaulo"
        produtoTeste.nome = "Laranja"

        banquito.saveProdutos(produto: produtoTeste)
        
        produtosTeste = banquito.fetchProdutos()!

        for prod in produtosTeste {
            print(prod.id)
            print(prod.nome)
            print(prod.descricao)
            print("...........;):")
        }
        
        print("\n\n\n")

        banquito.updateProdutos(idAntigo: produtoTeste.id, novoProduto: produtoTeste)
        banquito.delete(id: 100, tipo: .Produto)


        produtosTeste = banquito.fetchProdutos()!

        for prod in produtosTeste {
            print(prod.id)
            print(prod.nome)
            print(prod.descricao)
            print("...........;):")
        }
        
        
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelsController.arrayLabels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellTableViewCell
        
        cell.titulo.text = labelsController.categorias[indexPath.row]
        
        indexAux = indexPath.row
        
        self.cellAux = cell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 241
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labelsController.arrayLabels[indexAux].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if terminado == true {
            let cellAux = collectionView.cellForItem(at: IndexPath(item: indexPath.item-1, section: indexPath.section)) as! CellCollectionViewCell
            indexAux = cellAux.tipo
        }
        
        let cellC = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CellCollectionViewCell
        
        switch indexAux {
        case 0:
            cellC.tipo = 0
        case 1:
            cellC.tipo = 1
        case 2:
            cellC.tipo = 2
        case 3:
            cellC.tipo = 3
        case 4:
            cellC.tipo = 4
        case 5:
            cellC.tipo = 5
        case 6:
            cellC.tipo = 6
        case 7:
            cellC.tipo = 7
        case 8:
            cellC.tipo = 8
        default:
            cellC.tipo = 0
        }
        
        if cellC.backgroundColor == .white {
            cellC.backgroundColor = labelsController.colors[Int.random(in: 0...4)]
        }
        cellC.Nome.text = labelsController.arrayLabels[indexAux][indexPath.item]
        if ((indexAux == 8) && (indexPath.item == 3)){
            terminado = true
        }
        return cellC
    }
}
