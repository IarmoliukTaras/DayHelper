//
//  MainVCViewController.swift
//  DayHelper
//
//  Created by 123 on 21.01.2018.
//  Copyright © 2018 TarasSoft. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(showNodes), name: NSNotification.Name(rawValue: "showNodesView"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showSettings), name: NSNotification.Name(rawValue: "showSettingsView"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showLogOut), name: NSNotification.Name(rawValue: "showLogOutView"), object: nil)
    }
    
    @objc func showNodes() {
        performSegue(withIdentifier: "ShowNodes", sender: nil)
    }
    
    @objc func showSettings() {
        performSegue(withIdentifier: "ShowSettings", sender: nil)
    }
    
    @objc func showLogOut() {
        performSegue(withIdentifier: "ShowLogOut", sender: nil)
    }
    
    @IBAction func moreTapped(_ sender: Any) {
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "showSideMenu")))
    }
    
}
