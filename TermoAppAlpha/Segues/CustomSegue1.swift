//
//  CustomSegue1.swift
//  TermoAppAlpha
//
//  Created by Diego Perez on 12/12/17.
//  Copyright © 2017 DiegoCodes. All rights reserved.
//

import UIKit

class CustomSegue1: UIStoryboardSegue {
    
    override func perform() {
        scale()
    }
    func scale(){
        let toViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
        let originalCenter = fromViewController.view.center
        
        toViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toViewController.view.center = originalCenter
        
        containerView?.addSubview(toViewController.view)
        UIView.animate(withDuration: 0.5,delay: 0 ,usingSpringWithDamping: 1.0, initialSpringVelocity: 8,options: .curveEaseIn, animations: {
            
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: {success in
            fromViewController.present(toViewController, animated: false, completion: nil)
        })
    }

}
class ReverseSegue1: UIStoryboardSegue {
    
    override func perform() {
        scale1()
    }
    func scale1(){
        
        let fromViewController = self.source

        fromViewController.dismiss(animated: true, completion: nil)

    
}
}
