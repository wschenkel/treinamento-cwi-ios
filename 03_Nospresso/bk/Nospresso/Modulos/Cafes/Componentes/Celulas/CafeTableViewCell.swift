//
//  CafeTableViewCell.swift
//  Nospresso
//
//  Created by Camille Grings on 15/10/20.
//

import UIKit

class CafeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cafeImageView: UIImageView!
    @IBOutlet weak var cafeTituloLabel: UILabel!
    @IBOutlet weak var cafeDescricaoLabel: UILabel!
    @IBOutlet weak var cafeIntensidadeLabel: UILabel!
    
    func configurar(com cafe: Cafe) {
        cafeImageView.carregarImagem(usando: cafe.imagem)
        cafeTituloLabel.text = cafe.nome
        cafeDescricaoLabel.text = cafe.descricao
        cafeIntensidadeLabel.text = "5"
    }
}
