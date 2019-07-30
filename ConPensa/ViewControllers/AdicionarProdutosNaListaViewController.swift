//
//  AdicionarProdutosNaListaViewController.swift
//  ConPensa
//
//  Created by Aline Gomes on 10/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

let categories = ["Carne","Vegetais","Grãos","Legumes","Frutas","Massas"]

var categoriaCarne = [ProdutoLocal]()
var categoriaVegetais = [ProdutoLocal]()
var categoriaGraos = [ProdutoLocal]()
var categoriaLegumes = [ProdutoLocal]()
var categoriaFrutas = [ProdutoLocal]()
var categoriaMassas = [ProdutoLocal]()

class AdicionarProdutosNaListaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {    
    
    @IBOutlet weak var tableview: UITableView!
    var produtos = [[ProdutoLocal]]()
    var prod1 = ProdutoLocal(nomeProduto: "banana", descricao: "pra vitamina", categoria: "Frutas", dataValidade: Date(), imagem: UIImage(), quantidade: "")
    var prod2 = ProdutoLocal(nomeProduto: "Granola", descricao: "pra vitamina", categoria: "Graos", dataValidade: Date(), imagem: UIImage(), quantidade: "")
    var prod3 = ProdutoLocal(nomeProduto: "Bife", descricao: "pra vitamina", categoria: "Carne", dataValidade: Date(timeIntervalSince1970: 1), imagem: UIImage(named: "info")!, quantidade: "")
    var prod4 = ProdutoLocal(nomeProduto: "Cenoura", descricao: "pra vitamina", categoria: "Legumes", dataValidade: Date(), imagem: UIImage(), quantidade: "")
    var prod5 = ProdutoLocal(nomeProduto: "Macarrao espaguete", descricao: "pra estrogonoff", categoria: "Massas", dataValidade: Date(), imagem: UIImage(), quantidade: "")
    
    var produtosSelecionados =  [[ProdutoLocal]]()
    
    var listaCriada = ListasLocal()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        produtosSelecionados = [categoriaCarne,categoriaVegetais,categoriaGraos,categoriaLegumes,categoriaFrutas,categoriaMassas]
        
        categoriaCarne.append(prod3)
        categoriaMassas.append(prod5)
        categoriaFrutas.append(prod1)
        categoriaLegumes.append(prod4)
        categoriaGraos.append(prod2)
        produtos = [categoriaCarne,categoriaVegetais,categoriaGraos,categoriaLegumes,categoriaFrutas,categoriaMassas]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return produtos[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAdicionarProdutos", for: indexPath) as! CelulaAdicionarProdutosTableViewCell
        cell.nome.text = produtos[indexPath.section][indexPath.row].nomeProduto
        cell.descricao.text = produtos[indexPath.section][indexPath.row].descricao
        cell.img.image = produtos[indexPath.section][indexPath.row].imagem
        if cell.switcher.isOn{
            produtosSelecionados[indexPath.section].append(produtos[indexPath.section][indexPath.row])
            print(produtosSelecionados[indexPath.section][indexPath.row].nomeProduto)
        }
        
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? MinhasListasViewController{
////            listaCriada.produtos = produtosSelecionados
////            switch listaCriada.tipo{
////                case TipoLista.mensal.rawValue:
////                    listasMensais.append(listaCriada)
////                default:
////                    listasSemanais.append(listaCriada)
////            }
//        }
//    }
    
    @IBAction func salvar(_ sender: Any) {
        listaCriada.produtos = produtosSelecionados
        
        switch listaCriada.tipo{
        case TipoLista.mensal.rawValue:
            listasMensais.append(listaCriada)
        default:
            listasSemanais.append(listaCriada)
        }
        
        
//        self.navigationController?.popViewController(animated: true)
        
        self.navigationController?.popToRootViewController(animated: true)
                
//        dismiss(animated: true) {
//            print("teste")
//        }
    }
    
}
