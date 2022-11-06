//
//  Contador.swift
//  LearningTask-5.3
//
//  Created by jeovane.barbosa on 06/11/22.
//

import UIKit


    
    
struct Contador {
    
    private(set) var valorAtual: Int = 0
    private(set) var incrementoDeValor: Int = 1
    
    
    mutating func incrementa(){
        self.valorAtual += self.incrementoDeValor
    }
    
    mutating func decrementa(){
        self.valorAtual -= self.incrementoDeValor
    }
    
    mutating func reset(){
        self = Contador()
    }
    
}
