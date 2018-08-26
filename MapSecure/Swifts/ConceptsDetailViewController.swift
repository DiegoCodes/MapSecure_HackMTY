//
//  ConceptsDetailViewController.swift
//  TermoAppAlpha
//
//  Created by Diego Perez on 1/9/18.
//  Copyright © 2018 DiegoCodes. All rights reserved.
//

import UIKit

class ConceptsDetailViewController: UIViewController {

    @IBOutlet weak var TermoSuiteBar: UINavigationBar!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desc1Label: UILabel!
    
    var initY:CGFloat!
    var desc1initX: CGFloat!
    
    let items = [["Thermodynamics is a branch of physics which deals with the energy and work of a system. It was born in the 19th century as scientists were first discovering how to build and operate steam engines. Thermodynamics deals only with the large scale response of a system which we can observe and measure in experiments. Small scale gas interactions are described by the kinetic theory of gases. The methods complement each other; some principles are more easily understood in terms of thermodynamics and some principles are more easily explained by kinetic theory.","Introducción, Concepto de Termodinámica"],
                 ["Definiciones Fundamentales","Sistema Termodinamico, alrededores..."],
                 ["Sistema Termodinámico","Cantidad de materia, radiación en un espacio..."],
                 ["Energía","capacidad de realizar trabajo, de producir movimiento..."],
                 ["Trabajo, Calor y Energía","Definiciones y su relación"],
                 ["Leyes de la Termodinámica","Las 3 leyes fundamentales de la Termodinámica..."],
                 ["Propiedades de la Termodinámica","Temperatura, presión, volumen, masa..."],
                 ["Procesos de la Termodinámica","Proceso adiabático, Isocórico, Isobárico..."],
                 ["Unidades SI","Unidades del Sistema Internacional"],
                 ]

    @IBAction func BackBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var UIBar: UINavigationItem!
    var cellSelected = ""
    var numCellSelected = 0
    @IBOutlet weak var ConceptosDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI Navigation Bar Design
        TermoSuiteBar.layer.zPosition = 1
        TermoSuiteBar.layer.backgroundColor = UIColor.white.cgColor
        TermoSuiteBar.layer.shadowColor = UIColor.black.cgColor
        TermoSuiteBar.layer.shadowOffset = CGSize(width: 0, height: 7)
        TermoSuiteBar.layer.shadowRadius = 4.0
        TermoSuiteBar.layer.shadowOpacity = 0.15
        
        initY = titleLabel.center.y
        titleLabel.alpha = 0
        titleLabel.center.y = initY+300
        
        
        
        UIBar.title = "Conceptos"
        ConceptosDetailLabel.text = cellSelected
        ConceptosDetailLabel.adjustsFontSizeToFitWidth = true
        desc1Label.text = items[numCellSelected][0]
        
    
        desc1initX = desc1Label.center.x
        desc1Label.alpha = 0
        desc1Label.center.x  = desc1initX + 300
    
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        UIView.animate(withDuration: 1.0,delay: 0,usingSpringWithDamping: 1.0, initialSpringVelocity: 20, animations: {
            self.titleLabel.center.y = self.initY
            self.titleLabel.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 3.0,delay: 0,usingSpringWithDamping: 1.0, initialSpringVelocity: 15, animations: {
            self.desc1Label.center.x = self.desc1initX
            self.desc1Label.alpha = 1
        }, completion: nil)
        
        print(numCellSelected)
        print("CENTER"+String(describing: desc1Label.center.x))
        print("DESC"+String(describing: desc1initX))
        
        print("CENTERy"+String(describing: titleLabel.center.y))
        print("DESCy"+String(describing: initY))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
