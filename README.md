# NetworkStatusMonitorStarter
Repository for project of Medium Blog [Network reachability status monitoring on iOS (Part 1)](https://medium.com/@sauvik_dolui/network-status-monitoring-on-ios-part-1-9a22276933dc#.r59gm4w8f)

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

### Result

![Output Video](https://raw.githubusercontent.com/sauvikatinnofied/NetworkStatusMonitorPart1/master/NetworkStatusMonitorResultBlog1.gif)
