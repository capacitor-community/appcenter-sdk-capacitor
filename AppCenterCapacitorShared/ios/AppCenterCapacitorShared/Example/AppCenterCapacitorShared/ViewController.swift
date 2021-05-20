//
//  ViewController.swift
//  AppCenterCapacitorShared
//
//  Created by johnborges on 05/09/2021.
//  Copyright (c) 2021 johnborges. All rights reserved.
//

import UIKit
import AppCenter
import AppCenterCapacitorShared

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AppCenterCapacitorShared.configureWithSettings()
        AppCenter.logLevel = .verbose
        AppCenter.enabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

