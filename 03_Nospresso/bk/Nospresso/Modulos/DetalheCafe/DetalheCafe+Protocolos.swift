//
//  DetalheCafe+Protocolos.swift
//  Nospresso
//
//  Created by Willian schenkel on 20/10/20.
//

import Foundation

protocol DetalheCafeViewType {
    func exibirTitulo(_ titulo: String)
    func exibirDados(do cafe: Cafe)
}

protocol DetalheCafePresenterType {
    func telaCarregou()
}
