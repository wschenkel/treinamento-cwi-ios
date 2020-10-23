//
//  AcessorioItem.swift
//  Nospresso
//
//  Created by Camille Grings on 15/10/20.
//

import Foundation

public struct AcessorioItem: Decodable {
    let id: Int
    let nome: String
    let preco: Double
    let descricao: String?
    let imagem: String
}
