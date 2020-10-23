//
//  MenuProdutosViewController.swift
//  Nospresso
//
//  Created by Treinamento on 17/10/20.
//

import UIKit

class MenuProdutosViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removerTextoDoBotaoVoltar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}
