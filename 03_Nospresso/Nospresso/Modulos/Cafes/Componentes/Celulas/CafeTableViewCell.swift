//
//  CafeTableViewCell.swift
//  Nospresso
//
//  Created by Camille Grings on 15/10/20.
//

import UIKit

class CafeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cafeImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var intensidadeLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    
    func configurar(com cafe: Cafe) {
        cafeImageView.carregarImagem(usando: cafe.imagem)
        nomeLabel.text = cafe.nome
        descricaoLabel.text = cafe.descricao.capitalized
        precoLabel.text = cafe.precoUnitario.comoDinheiro

        if let intensidade = cafe.intensidade {
            intensidadeLabel.text = "Intensidade \(intensidade)"
        }
    }
}
