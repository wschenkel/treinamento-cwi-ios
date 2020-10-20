//
//  CafesTableViewController.swift
//  Nospresso
//
//  Created by Camille Grings on 15/10/20.
//

import UIKit

class CafesTableViewController: UITableViewController {
    
    private let api = Api()
    private var categorias: [CategoriaCafe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removerTextoDoBotaoVoltar()
        requisitar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = Paleta.cafes()
        navigationController?.navigationBar.tintColor = .black
    }
    
}

// MARK: Backend
extension CafesTableViewController {
    
    func requisitar() {
        api.requisitar(endpoint: .capsulas) { (categorias: [CategoriaCafe]) in
            self.categorias = categorias
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
                
        } falha: { erro in
            print(erro)
        }
    }
    
}

// MARK: UITableViewDelegate
extension CafesTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categorias[section].cafes.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        categorias.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cabecalho = R.nib.categoriaDeCafeHeaderView.firstView(owner: nil)
        
        cabecalho?.configurar(para: categorias[section])
        
        return cabecalho
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 50 }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 100 }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cafe-cell", for: indexPath) as! CafeTableViewCell
        let cafe = categorias[indexPath.section].cafes[indexPath.row]
        
        celula.configurar(com: cafe)
        
        return celula
    }
}
