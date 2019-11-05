//
//  ViewController.swift
//  Calculadora
//
//  Created by Alexander Moreno Guillén on 5/11/19.
//  Copyright © 2019 Alexander Moreno Guillén. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    let modelo: CalculadoraModelo = CalculadoraModelo()
    let vista: CalculadoraVista = CalculadoraVista()
    var controlador: CalculadoraControlador!
    let operadores: [String] = ["suma","resta","multiplica","divide"]
    var operatorSelected: String = "suma"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return operadores.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controlador.getHistorialCount()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return operadores[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        operatorSelected = operadores[row]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        let array = controlador.getHistorial()
        cell.textLabel?.text = array[indexPath.row]
        cell.detailTextLabel?.text = array[indexPath.row]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        controlador = CalculadoraControlador(modelo: modelo,vista: vista)
        // Do any additional setup after loading the view, typically from a nib.
        tabla.delegate = self
        tabla.dataSource = self
        tabla.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        operando.delegate = self
        operando.dataSource = self
    }

    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var num2: UITextField!
    @IBOutlet weak var resultado: UITextField!
    
    @IBOutlet weak var operando: UIPickerView!
    @IBOutlet weak var tabla: UITableView!
    
    @IBAction func clear(_ sender: UIButton) {
        controlador.clearHistorial()
        tabla.reloadData()
    }
    
    @IBAction func calcula(_ sender: UIButton) {
        if operatorSelected == "" || num1.text == "" || num2.text == "" {
            resultado.text = "de qué coño vas colega?"
            view.backgroundColor = UIColor.black
        } else {
            do{
                try resultado.text = controlador.realizarOperacion(operatorSelected, num1.text!, num2.text!)
                if resultado.text == "inf" || resultado.text == "-inf" {
                    view.backgroundColor = UIColor.red
                    resultado.text = "te has hecho 💩"
                } else {
                    view.backgroundColor = UIColor.green
                }
            } catch let error {
                resultado.text = "\(error)"
                view.backgroundColor = UIColor.red
            }
        }
        controlador.addHistorial(resultado.text!)
        tabla.beginUpdates()
        tabla.insertRows(at: [IndexPath(row: controlador.getHistorialCount()-1, section:0)], with: .automatic)
        tabla.endUpdates()
    }
}

