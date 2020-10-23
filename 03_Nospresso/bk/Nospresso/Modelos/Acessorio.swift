//
//  Acessorios.swift
//  Nospresso
//
//  Created by Camille Grings on 15/10/20.
//

import Foundation

public struct Acessorio: Decodable {
    let categoria: String
    let itens: [AcessorioItem]
}
