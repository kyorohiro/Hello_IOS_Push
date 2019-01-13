//
//  AppDelegate.swift
//  hello-push
//
//  Created by kiyohiro kawamura on 2019/01/13.
//  Copyright © 2019 kiyohiro kawamura. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("##>> call didFinishLaunchingWithOptions")
        // Override point for customization after application launch.
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(
            options: [.badge, .sound, .alert],
            completionHandler: {(granted:Bool, error:Error?)->Void in
                if error != nil {
                    print("##>> \(error!.localizedDescription)")
                    return
                }
                
                if granted {
                    DispatchQueue.main.async(execute: {
                        application.registerForRemoteNotifications()
                    })
                }
            }
        )
        return true
    }
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("##>> call didRegisterForRemoteNotificationsWithDeviceToken")
        
        var token = String(format: "%@", deviceToken as CVarArg) as String
        let characterSet: CharacterSet = CharacterSet.init(charactersIn: "<>")
        token = token.trimmingCharacters(in: characterSet)
        token = token.replacingOccurrences(of: " ", with: "")
        
        //本来は、APIでサーバーへ通知する
        print("deviceToken: \(token)")
    }

    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("##>> call didReceiveRemoteNotification")
    }

    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("##>> call didFailToRegisterForRemoteNotificationsWithError")
        print(error)
    }
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    // フォアグランドでもアラートを表示する
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("# willPresent notification")
        completionHandler([.badge, .sound, .alert])
    }
    
    // Pushをタップした時
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        print("# didReceive response")
        completionHandler()
    }
}


