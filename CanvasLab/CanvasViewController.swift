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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            
        }
    }
    

 

}
