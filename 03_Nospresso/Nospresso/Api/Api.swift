//
//  Api.swift
//  Nospresso
//
//  Created by Camille Grings on 13/10/20.
//

import Foundation

class Api {
    
    typealias ResultadoSucesso<T: Decodable> = (T) -> Void
    typealias ResultadoFalha = (String) -> Void
    
    let urlBase: String = "http://localhost:3000"
    
    func requisitar<T: Decodable>(endpoint: Endpoint, sucesso: @escaping ResultadoSucesso<T>, falha: @escaping ResultadoFalha) {
        let urlCompleta = "\(urlBase)/\(endpoint.url)"
        
        guard let url = URL(string: urlCompleta) else { return }
        

        URLSession.shared.dataTask(with: url) { (dados, resposta, erro) in
            guard erro == nil else {
                // TODO: validar erro
                return
            }
            
            guard let dados = dados else {
                // TODO: validar dados inválidos
                return
            }
            
            let decodificador = JSONDecoder()
            
            do {
                let dadosConvertidos = try decodificador.decode(T.self, from: dados)
                sucesso(dadosConvertidos)
            } catch {
                // TODO: tratar erro
                print(error)
            }
        }.resume()
    }
}
