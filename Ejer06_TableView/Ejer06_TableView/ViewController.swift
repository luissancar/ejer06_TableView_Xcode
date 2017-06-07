//
//  ViewController.swift
//  Ejer06_TableView
//
//  Created by Luis José Sánchez Carrasco on 6/6/17.
//  Copyright © 2017 Luis José Sánchez Carrasco. All rights reserved.
//



//https://www.youtube.com/watch?v=c6O2q5i70Ak

import UIKit


class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate{
    
    @IBOutlet weak var editUno: UITextField!
    @IBOutlet weak var editDos: UITextField!
    @IBOutlet weak var label: UILabel!
    var operaacion=[String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        operaacion.append("Suma")
        operaacion.append("Resta")
        operaacion.append("Multiplica")
        operaacion.append("Dividir")
        
           }

    @IBAction func pulsado(_ sender: Any) {
    
        
    
    }
    
    
    

    @IBAction func cam(_ sender: UITextField) {
        
    }
    
    
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = operaacion[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("section: \(indexPath.section)")
        opera(op:indexPath.row)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
    func opera(op: Int){
        if (editUno.text?.isEmpty)! {
            editUno.text="0"}
        if (editDos.text?.isEmpty)! {
            editDos.text="0"}
        
        let a=Int(editUno.text!)
        let b=Int(editDos.text!)
        
        switch op {
        case 0:
            label.text=String(describing: a!+b!)
        case 1:
            label.text=String(describing: a!-b!)
        case 2:
            label.text=String(describing: a!*b!)
        case 3:
            if !(editDos.text=="0"){
                label.text=String(describing: a!/b!)}
            else {
                self.view.makeToast(message: "Error, división por 0")
                
                
            }
        default:
            print ("error")
        }
        
        
    }

}

