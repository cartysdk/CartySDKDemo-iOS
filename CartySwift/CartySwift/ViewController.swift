//
//  ViewController.swift
//  CartySwift
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

import UIKit
import AppTrackingTransparency

class ViewController: UITableViewController
{
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization(completionHandler: {status in
                
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "template")
        {
            let nativeViewController:NativeViewController = segue.destination as! NativeViewController;
            nativeViewController.isTemplate = true;
        }
    }
}

