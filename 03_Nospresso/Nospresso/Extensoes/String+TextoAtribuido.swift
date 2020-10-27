//
//  String+TextoAtribuido.swift
//  Nospresso
//
//  Created by Hedo Junior on 22/10/20.
//

import UIKit

extension String {
    
    @discardableResult
    func estilizadaCom(_ fonte: UIFont, cor: UIColor) -> NSMutableAttributedString {
        let atributos: [NSMutableAttributedString.Key: Any] = [
            .font: fonte,
            .foregroundColor: cor
        ]
        
        return NSMutableAttributedString(string: self, attributes: atributos)
    }
    
}
