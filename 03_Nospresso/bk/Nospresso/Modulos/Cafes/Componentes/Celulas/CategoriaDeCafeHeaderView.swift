//
//  CategoriaDeCafeHeaderView.swift
//  Nospresso
//
//  Created by Treinamento on 17/10/20.
//

import UIKit

class CategoriaDeCafeHeaderView: UIView {

    @IBOutlet weak var tituloLabel: UILabel!
    
    func configurar(para categoria: CategoriaCafe) {
        tituloLabel.text = categoria.categoria
    }
    
    
}
