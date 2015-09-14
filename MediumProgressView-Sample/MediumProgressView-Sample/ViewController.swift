//
//  ViewController.swift
//  MediumProgressView-Sample
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var progressViewManager: MediumProgressViewManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressViewManager = MediumProgressViewManager.sharedInstance
//        progressViewManager.show()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        progressViewManager.show()
    }
    
    @IBAction func startProgress(sender: AnyObject) {
        progressViewManager.show()
    }

    @IBAction func stopProgress(sender: AnyObject) {
        progressViewManager.hide()
    }
}

