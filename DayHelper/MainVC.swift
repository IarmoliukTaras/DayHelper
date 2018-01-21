//
//  MainVCViewController.swift
//  DayHelper
//
//  Created by 123 on 21.01.2018.
//  Copyright © 2018 TarasSoft. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(showProfile), name: NSNotification.Name(rawValue: "showProfileView"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showSettings), name: NSNotification.Name(rawValue: "showSettingsView"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showLogOut), name: NSNotification.Name(rawValue: "showLogOutView"), object: nil)
    }
    
    @objc func showProfile() {
        performSegue(withIdentifier: "ShowProfile", sender: nil)
    }
    
    @objc func showSettings() {
        performSegue(withIdentifier: "ShowSettings", sender: nil)
    }
    
    @objc func showLogOut() {
        performSegue(withIdentifier: "ShowLogOut", sender: nil)
    }
    
    @IBAction func moreTapped(_ sender: Any) {
        
        print("more tapped")
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "showSideMenu")))
    }
    
}
