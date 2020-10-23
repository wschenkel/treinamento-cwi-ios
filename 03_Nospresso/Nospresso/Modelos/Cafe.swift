//
//  Cafe.swift
//  Nospresso
//
//  Created by Camille Grings on 13/10/20.
//

import Foundation

public struct Cafe: Decodable {
    let id: Int
    let nome: String
    let precoUnitario: Double
    let descricao: String
    let imagem: String
    let medidas: [Medida]
    let intensidade: Int?
    
    enum Medida: String, Decodable {
        case ristretto,
             lungo,
             espresso
    }
}
