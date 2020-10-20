//
//  CategoriaCafe.swift
//  Nospresso
//
//  Created by Camille Grings on 13/10/20.
//

import Foundation

public struct CategoriaCafe: Decodable {
    let categoria: String
    let cafes: [Cafe]
}
