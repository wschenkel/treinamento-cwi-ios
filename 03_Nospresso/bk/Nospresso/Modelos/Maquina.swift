//
//  Maquina.swift
//  Nospresso
//
//  Created by Camille Grings on 13/10/20.
//

import Foundation

public struct Maquina: Decodable, CustomStringConvertible {
    public var description: String {nome}
    
    let id: Int
    let nome: String
    let preco: Double
    let descricao: String
    let imagem: String
}

public typealias ListaDeMaquinas = [Maquina]
