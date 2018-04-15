//
//  mMenuViewController.swift
//  TermoAppAlpha
//
//  Created by Diego Perez on 11/23/17.
//  Copyright © 2017 DiegoCodes. All rights reserved.
//

import UIKit

class mMenuViewController: UIViewController {

    


    @IBOutlet weak var conceptosView: UIView!
    @IBOutlet weak var simView: UIView!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var TermoSuiteBar: UINavigationBar!
    
    
    @IBOutlet weak var conceptsBtn: UIButton!
    @IBOutlet weak var conceptosLabel: UILabel!
    
    @IBOutlet weak var SimBtn: UIButton!
    
    var cellSelected = ""
    
//------Global Button Animation------//
    
    func animateBtns(view1: UIView, alpha: CGFloat, size: CGFloat){
        UIView.animate(withDuration: 1, delay: 0,usingSpringWithDamping: 1.0, initialSpringVelocity: 30, options: [.allowUserInteraction,.curveEaseOut], animations: {
            view1.transform = CGAffineTransform(scaleX: size, y: size)
            view1.alpha = alpha
        }, completion: nil)
        
    }
    
//------Conceptos-----//
    
    @IBAction func ConceptosBtn(_ sender: Any) {
        animateBtns(view1: conceptosView, alpha: 1, size: 1)
         performSegue(withIdentifier: "segueConcepts", sender: self)
    }
    @IBAction func ConceptosBtnExit(_ sender: Any) {
        animateBtns(view1: conceptosView, alpha: 1, size: 1)
    }
    
    @IBAction func ConceptosBtnFocus(_ sender: Any) {
        animateBtns(view1: conceptosView, alpha: 0.75, size: 0.95)
    }

    @IBAction func ConceptosBtnDragEnter(_ sender: Any) {
        animateBtns(view1: conceptosView, alpha: 0.75, size: 0.95)
    }
    
//------Simulaciones-----//
    
    @IBAction func SimulacionesBtn(_ sender: Any) {
        animateBtns(view1: simView, alpha: 1, size: 1)
        performSegue(withIdentifier: "segueSim", sender: self)
    }
    
    @IBAction func SimulacionesBtnExit(_ sender: Any) {
        animateBtns(view1: simView, alpha: 1, size: 1)
    }
    
    @IBAction func SimulacionesBtnFocus(_ sender: Any) {
        animateBtns(view1: simView, alpha: 0.75, size: 0.95)
    }
    
    @IBAction func SimulacionesBtnDragEnter(_ sender: Any) {
        animateBtns(view1: simView, alpha: 0.75, size: 0.95)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //UI Navigation Bar Design
        TermoSuiteBar.layer.zPosition = 1
        TermoSuiteBar.layer.backgroundColor = UIColor.white.cgColor
        TermoSuiteBar.layer.shadowColor = UIColor.black.cgColor
        TermoSuiteBar.layer.shadowOffset = CGSize(width: 0, height: 7)
        TermoSuiteBar.layer.shadowRadius = 4.0
        TermoSuiteBar.layer.shadowOpacity = 0.15
        
        conceptosLabel.alpha = 1
        print(self.conceptsBtn.isFocused)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        
        conceptosView.alpha = 0.5
        simView.alpha = 0.5
        contactView.alpha = 0.5
        
        conceptosView.center.x = -200
        simView.center.x = -200
        contactView.center.x = -200
        
        animateViews()

       
    }
    
//------Initial Animate Views------//
    
    func animateViews(){
        
        let StartX = UIScreen.main.bounds.width*0.45
        
        UIView.animate(withDuration: 1, delay: 0.5,usingSpringWithDamping: 1.0, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
            self.conceptosView.center.x = StartX
            self.conceptosView.alpha = 1
        }, completion: nil)
        
        
        UIView.animate(withDuration: 1, delay: 0.75,usingSpringWithDamping: 1.0, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
            self.simView.center.x = StartX
            self.simView.alpha = 1
        }, completion: nil)
        
        
        
        UIView.animate(withDuration: 1, delay: 1,usingSpringWithDamping: 1.0, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
            self.contactView.center.x = StartX
            self.contactView.alpha = 1
        }, completion: nil)
        
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
