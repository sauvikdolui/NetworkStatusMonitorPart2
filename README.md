# NetworkStatusMonitorStarter
Repository for project of Medium Blog [Network reachability status monitoring on iOS (Part 2)](https://medium.com/@sauvik_dolui/network-status-monitoring-on-ios-part-1-9a22276933dc#.r59gm4w8f)

### How to use?
 1. Install ReachibilitySwift with `pod ‘ReachabilitySwift’, ‘~> 3’` with `cocoapods`
 2. Drag and Drop `ReachabilityManager.swift` to your project from `...NetworkStatusMonitorPart1/NetworkStatusMonitor/Networking/Core`

### Start monitoring for reachability 

Override `AppDelegate`'s `func applicationDidBecomeActive(_:)`

```swift
func applicationDidBecomeActive(_ application: UIApplication) {
    // Starts monitoring network reachability status changes
    ReachabilityManager.shared.startMonitoring()
}
```

### Stop monitoring for reachability 

Override `AppDelegate`'s `func applicationWillEnterForeground(_:)`

```swift
func applicationWillEnterForeground(_ application: UIApplication) {
  // Stops monitoring network reachability status changes
  ReachabilityManager.shared.stopMonitoring()
}
```

### Listen from View Controllers


    1. Implement `NetworkStatusListener` in `ViewController` class

```swift
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

        // Take necessary actions here

    }
}
```


    2. Override `viewWillAppear(_:)` and `viewDidDisappear(_:)`


```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    ReachabilityManager.shared.addListener(listener: self)
}

override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    ReachabilityManager.shared.removeListener(listener: self)
}
```


### Result

![Output Video](https://github.com/sauvikatinnofied/NetworkStatusMonitorPart2/blob/master/NetworkStatusMonitoringFromVC.gif?raw=true)
