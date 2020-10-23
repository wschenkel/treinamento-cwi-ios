//
//  Double+Dinheiros.swift
//  Nospresso
//
//  Created by Elias Medeiros on 17/10/20.
//

import Foundation

public extension Double {
    var comoDinheiro: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(identifier: "pt-BR")
        formatter.numberStyle = .currency

        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
