//
//  CalculadoraControlador.swift
//  Calculadora
//
//  Created by Alexander Moreno Guillén on 5/11/19.
//  Copyright © 2019 Alexander Moreno Guillén. All rights reserved.
//

import UIKit

class CalculadoraControlador: NSObject {
    let modelo: CalculadoraModelo
    let vista: CalculadoraVista
    
    init(modelo: CalculadoraModelo, vista: CalculadoraVista) {
        self.modelo = modelo
        self.vista = vista
    }
    
    enum NumberError: Error {
        case notValidNum(String)
    }
    
    func clearHistorial() {
        modelo.clearHistorial()
    }
    
    func getHistorial() -> [String] {
        return modelo.getHistorial()
    }
    
    func addHistorial(_ nuevo: String) {
        modelo.addHistorial(nuevo)
    }
    
    func getHistorialCount() -> Int {
        return modelo.getCount()
    }
    
    func realizarOperacion(_ operando: String, _ num1: String, _ num2: String) throws -> String {
        guard let numero1 = Double(num1) else {
            throw NumberError.notValidNum("Num1 not a Number")
        }
        guard let numero2 = Double(num2) else {
            throw NumberError.notValidNum("Num2 not a Number")
        }
        switch (operando) {
        case "suma":
            //caso de la suma
            return String(modelo.sumar(numero1, numero2))
        case "resta":
            return String(modelo.restar(numero1, numero2))
            //caso de la resta
        case "multiplica":
            return String(modelo.multiplicar(numero1, numero2))
            //caso de la multiplicacion
        case "divide":
            return String(modelo.dividir(numero1, numero2))
            //caso de la division
        default:
            //default
            return "eres tan tonto como..."
        }
    }
    
}
