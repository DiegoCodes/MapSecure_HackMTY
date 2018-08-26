//
//  AntoineViewController.swift
//  TermoAppAlpha
//
//  Created by Diego Perez on 2/21/18.
//  Copyright © 2018 DiegoCodes. All rights reserved.
//

import UIKit

class AntoineViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate{
    
    var listarr1 = [String]()
    var listarr2 = [[String]]()
     var txt = ""
    var A = ""
    var B = ""
    var C = ""
    var tMax = 0.0
    var tMin = 0.0
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var testLabel: UILabel!
    
    
    @IBOutlet weak var tempTextField: UITextField!
    @IBOutlet weak var presTextField: UITextField!
    
    @IBOutlet weak var formulaSustLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listarr1.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listarr1[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        testLabel.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.testLabel.alpha = 1
        }
        
        testLabel.text = "\n\n" + String(describing: listarr2[row][0]) + "\n" +
            "A: " + String(describing: listarr2[row][1]) + "\n" +
            "B: " + String(describing: listarr2[row][2]) + "\n" +
            "C: " + String(describing: listarr2[row][3]) + "\n" +
            "tMin: " + String(describing: listarr2[row][4]) + "\n" +
            "tMax: " + String(describing: listarr2[row][5])

        
        tempTextField.placeholder = "Valores entre " +
        String(describing: listarr2[row][4]) + " & "
        + String(describing: listarr2[row][5]) + "°C"
        
        tempTextField.sizeToFit()
        tMax = Double(listarr2[row][5])!
        tMin = Double(listarr2[row][4])!
        A = String(describing: listarr2[row][1])
        B = String(describing: listarr2[row][2])
        C = String(describing: listarr2[row][3])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt = readDataFromFile(file: "AntoineConstants2")
        
    
        self.pickerView.selectRow(5, inComponent: 0, animated: true)
        
        
        let listarr = txt.split(separator: "\n")
        for element in listarr{
            listarr1.append(element.components(separatedBy: ",")[0])
            listarr2.append(element.components(separatedBy: ","))
        }
        print(listarr1)
        print(listarr2)
        
        testLabel.text = "\n\n" + String(describing: listarr2[0][0]) + "\n" +
            "A: " + String(describing: listarr2[0][1]) + "\n" +
            "B: " + String(describing: listarr2[0][2]) + "\n" +
            "C: " + String(describing: listarr2[0][3]) + "\n" +
            "tMin: " + String(describing: listarr2[0][4]) + "\n" +
            "tMax: " + String(describing: listarr2[0][5])
        
        
        tempTextField.placeholder = "Valores entre " +
            String(describing: listarr2[0][4]) + " & "
            + String(describing: listarr2[0][5]) + "°C"
        
        tempTextField.sizeToFit()
        tMax = Double(listarr2[0][5])!
        tMin = Double(listarr2[0][4])!
        A = String(describing: listarr2[0][1])
        B = String(describing: listarr2[0][2])
        C = String(describing: listarr2[0][3])
        
        //'Done" button
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolbar.setItems([flexibleSpace,doneButton], animated: false)
        
       // tempTextField.inputAccessoryView = toolbar
       presTextField.inputAccessoryView = toolbar
        
        tempTextField.delegate = self
        presTextField.delegate = self
        
        
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
        if (presTextField.text != ""){
        let userPres = Double(presTextField.text!)!
        
            formulaSustLabel.alpha  = 0
            
            formulaSustLabel.text = "T[°C] = " + String(format: "%.2f", Double(B)!) + " /(" + String(format: "%.2f", Double(A)!) + " - log₁₀[" + String(format: "%.2f",Double(userPres)) + "])" + "-" + String(format: "%.2f",Double(C)!)
            
    
            //Ecuacion de Temperatura
            tempTextField.text = String(format: "%.3f", Double(Double(B)!/(Double(A)!-log10(Double(userPres)))-Double(C)!))
            
            UIView.animate(withDuration: 1.0, animations: {
                self.formulaSustLabel.alpha = 1
                
            })
            
    }
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.scrollView.contentOffset = CGPoint(x: 0, y: 600)
        }, completion: nil)
     
    }
    //Press enter on temperatura text field
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        if (textField == tempTextField && tempTextField.text != ""){
            textField.resignFirstResponder()
            
            
            let userTemp = Double(tempTextField.text!)!
            
            if (userTemp >= tMin && userTemp <= tMax){
                print("ok")
                
                formulaSustLabel.alpha  = 0
                
                formulaSustLabel.text = "log10(Psat[mmHg]) = " + String(format: "%.2f", Double(A)!) + " - " + String(format: "%.2f", Double(B)!) + " / (" + String(userTemp) + " + " + String(format: "%.2f", Double(C)!) + ")"
        
                
                
               //Ecuacion de presión
                presTextField.text = String(format: "%.3f",Double(pow(10.0,Double(A)!-(Double(B)!)/(Double(userTemp)+Double(C)!))))
                
                
                UIView.animate(withDuration: 1.0, animations: {
                    self.formulaSustLabel.alpha = 1
                })
            }
            if (userTemp < tMin || userTemp > tMax){
                print("error" + String(userTemp) + String(tMin) + String(tMax))
                let alert = UIAlertController(title: "Número no válido", message: "Debe ser mayor que " + String(tMin) + " y menor que " + String(tMax) + ".", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                self.present(alert, animated: true)
                
                tempTextField.text = ""
            }
        }
        
        if textField == presTextField{
            textField.resignFirstResponder()
        }
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Touch Temp text field
    @IBAction func tempTextFieldEdit(_ sender: Any) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut, animations: {
            self.scrollView.contentOffset = CGPoint(x: 0, y: 10)
        }, completion: nil)
        
    }
    //Touch Presion text field
    
    @IBAction func presTextFieldEdit(_ sender: Any) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut, animations: {
            self.scrollView.contentOffset = CGPoint(x: 0, y: 135)
        }, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        testLabel.text = String(describing: listarr2[0][0]) + "\n" +
            "A: " + String(describing: listarr2[0][1]) + "\n" +
            "B: " + String(describing: listarr2[0][2]) + "\n" +
            "C: " + String(describing: listarr2[0][3]) + "\n" +
            "tMin: " + String(describing: listarr2[0][4]) + "\n" +
            "tMax: " + String(describing: listarr2[0][5])
        
        
        tempTextField.placeholder = "Valores entre " +
            String(describing: listarr2[0][4]) + " & "
            + String(describing: listarr2[0][5]) + "°C"
        
        tempTextField.sizeToFit()
        
        tMax = Double(listarr2[0][5])!
        tMin = Double(listarr2[0][4])!
 
    }
    
    
    @IBAction func menuBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func readDataFromFile(file:String)-> String!{
        guard let filepath = Bundle.main.path(forResource: file, ofType: "csv")
            else {
                return nil
        }
        do {
            let contents = try String(contentsOfFile: filepath)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
    



}
