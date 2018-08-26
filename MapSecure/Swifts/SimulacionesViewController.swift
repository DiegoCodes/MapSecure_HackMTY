//
//  ViewController.swift
//  TermoAppAlpha
//
//  Created by Diego Perez on 3/20/18.
//  Copyright © 2018 DiegoCodes. All rights reserved.
//

import UIKit

class SimulacionesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    let items = [["Simulador de Antoine",""],["Simulador 2",""]]
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ViewControllerTableViewCell
        cell.Title?.text = items[indexPath.row][0]
        cell.SubTitle?.text = items[indexPath.row][1]
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if (indexPath.row == 0){
        performSegue(withIdentifier: "segueAnt", sender: self)
        }
        
    }
    
    @IBAction func MenuBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private var finishedLoadingInitialTableCells = false
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        var lastInitialDisplayableCell = false
        
        if items.count > 0 && !finishedLoadingInitialTableCells {
            if let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows,
                let lastIndexPath = indexPathsForVisibleRows.last, lastIndexPath.row == indexPath.row {
                lastInitialDisplayableCell = true
            }
        }
        
        if !finishedLoadingInitialTableCells {
            
            if lastInitialDisplayableCell {
                finishedLoadingInitialTableCells = true
            }
            
            cell.transform = CGAffineTransform(translationX: cell.frame.width/2, y: 0)
            cell.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0.15*Double(indexPath.row),usingSpringWithDamping: 1.0, initialSpringVelocity: 8, options: [.curveEaseInOut,.transitionCrossDissolve], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.alpha = 1
            }, completion: nil)
        }
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
