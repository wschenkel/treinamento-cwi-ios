//
//  MenuProdutosViewController.swift
//  Nospresso
//
//  Created by Treinamento on 17/10/20.
//

import UIKit

class MenuProdutosViewController: UIViewController {
    
    @IBOutlet private weak var maquinasView: UIView!
    
    @objc
    private func tocouEmMaquinas(_ remetente: Any) {
//        let vc = MaquinasViewController(nibName: "MaquinasViewController", bundle: .main)
        let vc = MaquinasViewController(nib: R.nib.maquinasViewController)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removerTextoDoBotaoVoltar()
        
        //outra forma de adicionar UITapGestureRecognizer além de pelo storyboard ou xib
        let reconhecedor = UITapGestureRecognizer(target: self, action: #selector(self.tocouEmMaquinas))
        maquinasView.addGestureRecognizer(reconhecedor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}
