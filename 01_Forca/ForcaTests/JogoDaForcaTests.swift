//
//  JogoDaForcaTests.swift
//  ForcaTests
//
//  Created by Juliano Nardon on 10/10/20.
//

import XCTest
import Quick
import Nimble

@testable import Forca

class JogoDaForcaTests: QuickSpec {
    override
    func spec() {
        var forca: JogoDaForca!
        beforeEach {
            forca = JogoDaForca(palavra: "Jacaré", dica: "Animal")
        }
        
        describe("ao jogar normalmente") {
            context("ao escrever uma letra correta") {
                it("que não tenha nenhum erro") {
                    forca.tentativa(letra: "é")
                    expect(forca.erros).to(equal(.zero))
                    expect(forca.palavraMascarada).to(equal("_____E"))
                }
            }
            
            context("ao escrever uma letra errada") {
                it("deverá ter apenas um erro") {
                    forca.tentativa(letra: "G")
                    expect(forca.erros).to(equal(1))
                }
            }
        
            context("ao repetir um erro") {
                it("deverá ter apenas um erro") {
                    forca.tentativa(letra: "G")
                    forca.tentativa(letra: "G")
                    expect(forca.erros).to(equal(1))
                }
            }
            
            context("errando tudo") {
                it("deve perder o jogo") {
                    let tentativas = ["I", "B", "P", "Z", "K"]
                    for tentativa in tentativas {
                        forca.tentativa(letra: tentativa)
                    }
                    expect(forca.derrota).to(beFalse())
                    forca.tentativa(letra: "W")
                    expect(forca.derrota).to(beTrue())
                }
            }
            
            context("com uma letra correta repetida na palavra") {
                it("deve atualizar dois espaços") {
                    forca.tentativa(letra: "A")
                    expect(forca.palavraMascarada).to(equal("_A_A__"))
                }
            }
            
            context("ao digitar uma letra correta repetida") {
                it("nao deve gerar um erro") {
                    forca.tentativa(letra: "A")
                    forca.tentativa(letra: "A")
                    expect(forca.erros).to(equal(.zero))
                    expect(forca.palavraMascarada).to(equal("_A_A__"))
                }
            }
            
            context("com todas as letras corretas") {
                it("deve vencer o jogo") {
                    ["J", "A", "E", "R"].forEach(forca.tentativa)
                    expect(forca.derrota).to(beFalse())
                    expect(forca.vitoria).to(beFalse())
                    
                    ["W", "K", "Y", "O", "L", "Ç"].forEach(forca.tentativa)
                    expect(forca.derrota).to(beFalse())
                    expect(forca.vitoria).to(beTrue())
                }
            }
        }
    }
}

