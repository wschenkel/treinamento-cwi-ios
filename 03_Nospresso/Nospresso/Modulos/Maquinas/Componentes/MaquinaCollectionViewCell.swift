//
//  MaquinaCollectionViewCell.swift
//  Nospresso
//
//  Created by Treinamento on 22/10/20.
//

import UIKit

class MaquinaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var tituloLabel: UILabel!
    @IBOutlet private weak var fotoImageView: UIImageView!
    @IBOutlet private weak var precoLabel: UILabel!
    @IBOutlet private weak var favoritarButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    func configurar(com maquina: Maquina) {
        tituloLabel.text = maquina.nome
        fotoImageView.carregarImagem(usando: maquina.imagem)
        precoLabel.text = maquina.preco.comoDinheiro
    }
}
