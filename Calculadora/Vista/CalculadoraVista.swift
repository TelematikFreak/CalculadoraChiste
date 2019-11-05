//
//  CalculadoraVista.swift
//  Calculadora
//
//  Created by Alexander Moreno Guillén on 5/11/19.
//  Copyright © 2019 Alexander Moreno Guillén. All rights reserved.
//

import UIKit

class CalculadoraVista: NSObject {
    func escribirMensajeError(msg: String) {
        print(msg)
    }
    func leerOperador() -> String {
        if let opt1 = readLine() {
            return opt1
        } else {
            return ""
        }
    }
    func leerNumero() -> Double {
        if let opt1 = readLine() {
            return Double(opt1)!
        }
        return 0
    }
    
    func escribirNumero(_ num: Double) {
        print(num)
    }
}
