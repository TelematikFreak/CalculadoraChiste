//
//  CalculadoraModelo.swift
//  Calculadora
//
//  Created by Alexander Moreno Guillén on 5/11/19.
//  Copyright © 2019 Alexander Moreno Guillén. All rights reserved.
//

import UIKit

class CalculadoraModelo: NSObject {
    var historial: [String] = []
    
    func sumar(_ a: Double, _ b: Double) ->  Double {
        return a + b
    }
    func restar(_ a: Double, _ b: Double) ->  Double {
        return a - b
    }
    func multiplicar(_ a: Double, _ b: Double) ->  Double {
        return a * b
    }
    func dividir(_ a: Double, _ b: Double) ->  Double {
        return a / b
    }
    
    func addHistorial(_ nuevo: String) {
        historial.append(nuevo)
    }
    
    func clearHistorial () {
        historial = []
    }
    
    func getHistorial() -> [String] {
        return historial
    }
    
    func getCount() -> Int {
        return historial.count
    }
}
