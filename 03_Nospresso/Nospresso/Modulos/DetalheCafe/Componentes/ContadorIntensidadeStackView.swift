//
//  ContadorIntensidadeStackView.swift
//  Nospresso
//
//  Created by Treinamento on 20/10/20.
//

import UIKit

class ContadorIntensidadeStackView: UIStackView {
    let tamanhoBolinha: CGFloat = 7
    let intensidadeMaxima = 13
    
    // func generateLilBall (preenched: Bool)
    func gerarBolinha(preenchida: Bool) -> UIView {
        let bolinha = UIView()
        // assim é mais tri
//        bolinha.heightAnchor.constraint(equalToConstant: tamanhoBolinha).isActive = true
//        bolinha.widthAnchor.constraint(equalToConstant: tamanhoBolinha).isActive = true

        // constraints via código;
        NSLayoutConstraint.activate([
            bolinha.heightAnchor.constraint(equalToConstant: tamanhoBolinha),
            bolinha.widthAnchor.constraint(equalToConstant: tamanhoBolinha)
        ])
        
        // alterações em borda e coisas assim: layer
        bolinha.layer.cornerRadius = tamanhoBolinha / 2
        bolinha.layer.borderWidth = 0.4
        
        // cores
        bolinha.layer.borderColor = (preenchida ? UIColor.black : Paleta.bordaIntensidadeVazia())?.cgColor
        bolinha.backgroundColor = preenchida ? Paleta.intensidadePreenchida() : Paleta.intensidadeVazia()        
        
        return bolinha
    }
    
    func configurar(para intensidade: Int) {
        let quantidadeDeBolinhasVazias = intensidadeMaxima - intensidade
        
        for _ in 0..<intensidade {
            let bolinha = gerarBolinha(preenchida: true)
            addArrangedSubview(bolinha)
        }
        
        for _ in 0..<quantidadeDeBolinhasVazias {
            let bolinha = gerarBolinha(preenchida: false)
            addArrangedSubview(bolinha)
        }
        
        addArrangedSubview(UIView())
    }
}
