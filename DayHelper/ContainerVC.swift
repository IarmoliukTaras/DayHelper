//
//  ViewController.swift
//  DayHelper
//
//  Created by 123 on 21.01.2018.
//  Copyright © 2018 TarasSoft. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    var sideMenuOpen = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSideMenu), name: NSNotification.Name(rawValue: "showSideMenu"), object: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func showSideMenu() {
        if sideMenuOpen {
            self.sideMenuConstraint.constant = -240
            self.sideMenuOpen = false
            
            
        } else {
            self.sideMenuConstraint.constant = 0
            self.sideMenuOpen = true
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }


}

