//
//  CanvasViewController.swift
//  CanvasLab
//
//  Created by Jacob Frick on 11/18/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    var trayOriginalCenter: CGPoint!

    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(trayView.center.y)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didPanTray(_ sender: Any) {
        let translation = (sender as AnyObject).translation(in: view)
        if (sender as AnyObject).state == .began {
            trayOriginalCenter = trayView.center
        } else if (sender as AnyObject).state == .changed {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        } else if (sender as AnyObject).state == .ended {
            let velocity = (sender as AnyObject).velocity(in: view)
            let trayDownOffset: CGFloat!
            //print(translation.y)
            trayDownOffset = 80
            trayUp = trayView.center
            trayDown = CGPoint(x: trayView.center.x, y: trayView.center.y + trayDownOffset)
            if(velocity.y > 0) {
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
                    self.trayView.center = CGPoint(x: self.trayView.center.x, y: self.mainView.frame.maxY+trayDownOffset)
                    print(self.mainView.frame.maxY)
                }, completion: nil)
                //self.trayView.center.y = 0
            } else {
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
                    self.trayView.center = CGPoint(x: self.trayView.center.x, y: self.mainView.frame.maxY-self.trayView.frame.height/2)
                    print(self.mainView.frame.maxY)
                }, completion: nil)
            }
        }
    }
    

 

}
