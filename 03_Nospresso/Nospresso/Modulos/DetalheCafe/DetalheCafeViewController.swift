//
//  DetalheCafeViewController.swift
//  Nospresso
//
//  Created by Treinamento on 20/10/20.
//

import UIKit

class DetalheCafeViewController: UIViewController {
    var presenter: DetalheCafePresenterType?
    
    @IBOutlet private weak var cafeImageView: UIImageView!
    @IBOutlet private weak var intensidadeStackView: ContadorIntensidadeStackView!
    @IBOutlet private weak var intensidadeLabel: UILabel!
    @IBOutlet private weak var precoPorSleeveLabel: UILabel!
    @IBOutlet private weak var descricaoLabel: UILabel!
    @IBOutlet private weak var origemLabel: UILabel!
    @IBOutlet private weak var torrefacaoLabel: UILabel!
    @IBOutlet private weak var perfilAromaticoLabel: UILabel!
    @IBOutlet private weak var medidasStackView: UIStackView!
    
    @IBOutlet private weak var ensacolarButton: UIButton! {
        didSet {
            ensacolarButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
            ensacolarButton.layer.shadowOffset = CGSize(width: 2, height: 2)
            ensacolarButton.layer.shadowRadius = 2
            ensacolarButton.layer.shadowOpacity = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.telaCarregou()
    }
}

extension DetalheCafeViewController: DetalheCafeViewType {
    func exibirTitulo(_ titulo: String) {
        title = titulo
    }
    
    func exibirDados(do cafe: Cafe) {
        DispatchQueue.main.async {
            self.intensidadeStackView.configurar(para: cafe.intensidade ?? 0)
            self.cafeImageView.carregarImagem(usando: cafe.imagem)
            self.intensidadeLabel.isHidden = cafe.intensidade == nil
            
            if let intensidade = cafe.intensidade {
                self.intensidadeLabel.text = "intensidade: \(intensidade)"
            }
            
            self.precoPorSleeveLabel.attributedText = self.construirDescricaoDePreco(cafe.precoSleeve)
            
            self.descricaoLabel.text = cafe.descricao
            self.origemLabel.text = cafe.origem
            self.torrefacaoLabel.text = cafe.torrefacao
            self.perfilAromaticoLabel.text = cafe.perfilAromatico
            
            for medida in cafe.medidas {
                let view = MedidaView.doNib()
                view.configurar(com: medida)
                
                self.medidasStackView.addArrangedSubview(view)
            }
            
            self.medidasStackView.addArrangedSubview(UIView())
        }
    }
}

private extension DetalheCafeViewController {
    
    func construirDescricaoDePreco(_ precoSleeve: Double) -> NSMutableAttributedString {
        let primeiraParte = "10 cápsulas, ".estilizadaCom(Fontes.openSansLight(size: 12)!, cor: Paleta.textoDiscreto()!)
        let segundaParte = precoSleeve.comoDinheiro.estilizadaCom(Fontes.openSansLight(size: 24)!, cor: .black)
        
        primeiraParte.append(segundaParte)
        
        return primeiraParte
    }
    
}
