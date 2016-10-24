//
//  ViewController.swift
//  NetworkStatusMonitor
//
//  Created by Sauvik Dolui on 17/10/16.
//  Copyright © 2016 Innofied Solution Pvt. Ltd. All rights reserved.
//

import UIKit
import ReachabilitySwift


class ViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet var loginButton: UIButton!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ReachabilityManager.shared.addDelegate(delegate: self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        ReachabilityManager.shared.removeDelegate(delegate: self)
    }

}

extension ViewController: NetworkStatusListener {
    
    func networkStatusDidChange(status: Reachability.NetworkStatus) {
        
        switch status {
        case .notReachable:
            debugPrint("ViewController: Network became unreachable")
        case .reachableViaWiFi:
            debugPrint("ViewController: Network reachable through WiFi")
        case .reachableViaWWAN:
            debugPrint("ViewController: Network reachable through Cellular Data")
        }
        
        // Update login button Enable/Disable status
        loginButton.isEnabled = !(status == .notReachable)
    }
}

