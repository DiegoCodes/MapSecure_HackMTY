//
//  mMenuViewController.swift
//  MapSecure
//
//
//  Copyright © 2018 DiegoCodes. All rights reserved.
//

import UIKit

class mMenuViewController: UIViewController {

    


    @IBOutlet weak var MapView: UIView!
    @IBOutlet weak var simView: UIView!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var Bar: UINavigationBar!
    @IBOutlet weak var conceptsBtn: UIButton!
    @IBOutlet weak var MapLabel: UILabel!
    
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
        animateBtns(view1: MapView, alpha: 1, size: 1)
         performSegue(withIdentifier: "segueConcepts", sender: self)
    }
    @IBAction func ConceptosBtnExit(_ sender: Any) {
        animateBtns(view1: MapView, alpha: 1, size: 1)
    }
    
    @IBAction func ConceptosBtnFocus(_ sender: Any) {
        animateBtns(view1: MapView, alpha: 0.75, size: 0.95)
    }

    @IBAction func ConceptosBtnDragEnter(_ sender: Any) {
        animateBtns(view1: MapView, alpha: 0.75, size: 0.95)
    }
    
//------Simulaciones-----//
    
    @IBAction func ContactBtn(_ sender: Any) {
        
        animateBtns(view1: MapView, alpha: 1, size: 1)
        performSegue(withIdentifier: "segueSim", sender: self)
    }
    
    @IBAction func ContactBtnExit(_ sender: Any) {
        animateBtns(view1: simView, alpha: 1, size: 1)
    }
    
    @IBAction func ContactBtnFocus(_ sender: Any) {
        animateBtns(view1: simView, alpha: 0.75, size: 0.95)
    }
    
    @IBAction func ContactBtnDragEnter(_ sender: Any) {
        animateBtns(view1: simView, alpha: 0.75, size: 0.95)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //UI Navigation Bar Design
        Bar.layer.zPosition = 1
        Bar.layer.backgroundColor = UIColor.white.cgColor
        Bar.layer.shadowColor = UIColor.black.cgColor
        Bar.layer.shadowOffset = CGSize(width: 0, height: 7)
        Bar.layer.shadowRadius = 4.0
        Bar.layer.shadowOpacity = 0.15
        
        MapLabel.alpha = 1
        print(self.conceptsBtn.isFocused)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        
        MapView.alpha = 0.5
        simView.alpha = 0.5
        contactView.alpha = 0.5
        
        MapView.center.x = -200
        simView.center.x = -200
        contactView.center.x = -200
        
        animateViews()

       
    }
    
//------Initial Animate Views------//
    
    func animateViews(){
        
        let StartX = UIScreen.main.bounds.width*0.45
        
        UIView.animate(withDuration: 1, delay: 0.5,usingSpringWithDamping: 1.0, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
            self.MapView.center.x = StartX
            self.MapView.alpha = 1
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
