//
//  ViewController.swift
//  MapSecure
//
//  Copyright © 2018 DiegoCodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var buttonCont: UIButton!
    @IBOutlet weak var buttonSkip: UIButton!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    
    @IBOutlet weak var ImageBG: UIImageView!
    @IBOutlet weak var ImageBG2: UIImageView!
    @IBOutlet weak var ImageBG3: UIImageView!
    
    var label1Y:CGFloat!
    var label2Y:CGFloat!
    var label3Y:CGFloat!
    
    var timer1 = Timer()
    var counter = 0
    var introSreenNum = 0
    
    
    @IBAction func buttonSkip(_ sender: Any) {
        performSegue(withIdentifier: "segueMenu", sender: self)
    }
    
    @IBAction func buttonCont(_ sender: Any) {
        introSreenNum+=1
        buttonCont.isEnabled = false
        buttonCont.alpha = 0
        updateText(num:CGFloat(introSreenNum))
        
        label1.center.y = -self.label1.frame.height*8
        label2.center.y = -self.label2.frame.height*8
        label3.center.y = -self.label3.frame.height*8
        
        
        animateText()
    }
    func getInitPositionY(label:UILabel)->CGFloat{
        return label.center.y
    }
    func updateText(num: CGFloat){
        if num == 1{
            label1.text = "MapSecure es una aplicación"
            label1.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.regular)
            label2.text = "que te permite ubicar y reportar lugares"
            label2.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.semibold)
            label3.text = "de riesgo en tu localidad."
            label3.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
    
        }
        if num == 2 {
            label1.text = "Podrás evitar lugares peligrosos,"
            label2.text = "reportar siniestros y estar seguro con"
            label3.text = "MapSecure."
            label3.textColor = UIColor.black
            label3.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.bold)
            
            buttonCont.setTitle("Iniciar", for: .normal)
        }
        if num > 2{
            performSegue(withIdentifier: "segueMenu", sender: self)
        }
    }
    func animateText(){
        //Label 1 Animation
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, animations: {
            self.label1.center.y = CGFloat(self.label1Y)
        }, completion: nil)
        //Label 2 Animation
        
        UIView.animate(withDuration: 0.5, delay: 1.5, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, animations: {
            self.label2.center.y = CGFloat(self.label2Y)
        }, completion: nil)
        //Label 3 Animation
        UIView.animate(withDuration: 0.5, delay: 1.75, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, animations: {
            self.label3.center.y = CGFloat(self.label3Y)
            self.label3.alpha = 1
        }, completion: nil)
        
        //Button Animation
        UIView.animate(withDuration: 1.0, delay: 2.75, animations: {
            self.buttonCont.alpha = 1
        }, completion: { (finished: Bool) in
            self.buttonCont.isEnabled = true
        })
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label1Y = getInitPositionY(label: label1)
        label2Y = getInitPositionY(label: label2)
        label3Y = getInitPositionY(label: label3)
        
        label1.center.y = -label1.frame.height
        label2.center.y = -label2.frame.height
        label3.center.y = -label3.frame.height
        
        buttonCont.isEnabled = false
        buttonCont.layer.zPosition = 1
        buttonCont.alpha = 0
        buttonSkip.layer.zPosition = 1
        
       
        animateText()
        animateBG()
        //TwoColorAnimateBackground()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func animateBG(){
        UIView.animate(withDuration: 30, delay: 0, options: [.curveLinear,.autoreverse,.repeat], animations: {
            let x = -(self.ImageBG.frame.width-self.view.frame.width)
            self.ImageBG.transform = CGAffineTransform(translationX: x, y: 0)
        })
        UIView.animate(withDuration: 40, delay: 0, options: [.curveLinear,.autoreverse,.repeat], animations: {
            let x2 = -(self.ImageBG2.frame.width-self.view.frame.width)
            self.ImageBG2.transform = CGAffineTransform(translationX: x2, y: 0)
        })
        UIView.animate(withDuration: 60, delay: 0, options: [.curveLinear,.autoreverse,.repeat], animations: {
            let x2 = -(self.ImageBG3.frame.width-self.view.frame.width)
            self.ImageBG3.transform = CGAffineTransform(translationX: x2, y: 0)
        })
    
    }
    func TwoColorAnimateBackground() {
        UIView.animate(withDuration: 6, delay: 0, options: .allowUserInteraction, animations: {
            self.view.backgroundColor = UIColor.init(red: 255/255, green: 147/255, blue: 0/255, alpha: 1.0)
        }, completion: {
            (completed : Bool) -> Void in
            UIView.animate(withDuration: 6, delay: 0, options: [.allowUserInteraction,.transitionFlipFromBottom], animations: {
                self.view.backgroundColor = UIColor.init(red: 255/255, green: 147/255, blue: 146/255, alpha: 1.0)
            }, completion: {
                    (completed : Bool) -> Void in
                    UIView.animate(withDuration: 6, delay: 0, options: [.allowUserInteraction,.transitionFlipFromBottom], animations: {
                        self.view.backgroundColor = UIColor.init(red: 204/255, green: 55/255, blue: 255/255, alpha: 1.0)
                    }, completion: {
                            (completed : Bool) -> Void in
                            UIView.animate(withDuration: 6, delay: 0, options: [.allowUserInteraction,.curveLinear], animations: {
                                self.view.backgroundColor = UIColor.init(red: 255/255, green: 147/255, blue: 146/255, alpha: 1.0)
                            }, completion: {
                                (completed : Bool) -> Void in
                                self.TwoColorAnimateBackground()
                            })
                    })
            })
        })
    }

}

