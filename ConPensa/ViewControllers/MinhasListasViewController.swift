//
//  MinhasListasViewController.swift
//  ConPensa
//
//  Created by Aline Gomes on 08/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

var listasSemanais = [ListasLocal]()
var listasMensais = [ListasLocal]()

class MinhasListasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var lists = [[ListasLocal]]()
    
    @IBOutlet weak var tableview: UITableView!
    
    var listSelect = ListasLocal()
    
//    var list1Sem = Listas()
//    var list2Sem = Listas()
//    var list3Sem = Listas()
//    var list4Men = Listas()
//    var list5Sem = Listas()
    override func viewDidLoad() {
        super.viewDidLoad()
        //inicializando umas listas de exemplos
//        list1Sem.nome = "Churras"
//        list1Sem.descricao = "Casa do caio no condominio que tem piscina que nao pode usar"
//        list1Sem.tipo = "Semanal"
////        list1Sem.produtos = ["Frango","Costela","Peixe"]
//
//        list2Sem.nome = "Crianca chorona"
//        list2Sem.descricao = "Que nao é minha, mas to cuidando"
//        list2Sem.tipo = "Semanal"
////        list2Sem.produtos = ["Farinha lactea","Nan","Leite","Pó pra dormir"]
//
//        list3Sem.nome = "Fim do mes"
//        list3Sem.descricao = "Grana curta"
//        list3Sem.tipo = "Semanal"
////        list3Sem.produtos = ["Carne barata","Miojo","Mais miojo","BAnana"]
//
//        list4Men.nome = "Começo de mês"
//        list4Men.descricao = "só alegria"
//        list4Men.tipo = "Mensal"
////        list4Men.produtos = ["Carne boa","Arroz","Feijao","Macarrão"]
//
//        list5Sem.nome = "Mistura p cuzcuz"
//        list5Sem.descricao = "Lanche p visita"
//        list5Sem.tipo = "Semanal"
////        list5Sem.produtos = ["Ovo","Calabresa","Flocao"]
//        // Do any additional setup after loading the view.
//        listasMensais.append(list4Men)
//        listasSemanais.append(list1Sem)
//        listasSemanais.append(list2Sem)
//        listasSemanais.append(list3Sem)
//        listasSemanais.append(list5Sem)
        lists = [listasMensais,listasSemanais]
//        listasMensais.append(Listas())
//        print(listasSemanais.count)
//        print("vem pro minhas listas")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        lists = [listasMensais,listasSemanais]
        tableview.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMinhasListas", for: indexPath) as! MinhasListasTableViewCell
        cell.nomeLista.text = lists[indexPath.section][indexPath.row].nome
        cell.descricao.text = lists[indexPath.section][indexPath.row].descricao
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listSelect = lists[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "minhaLista", sender: nil)
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var names = ["Mensal","Semanal"]
        return names[section]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MinhaListaViewController{
            destination.listaSelecionada = listSelect
        }
    }
 
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            lists[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }

}
