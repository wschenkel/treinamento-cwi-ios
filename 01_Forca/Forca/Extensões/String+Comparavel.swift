//
//  String+Comparavel.swift
//  Forca
//
//  Created by Juliano Nardon on 10/10/20.
//

import Foundation

extension String {
    var comparavel: String {
        self.uppercased().folding(options: .diacriticInsensitive, locale: .current)
    }
}
