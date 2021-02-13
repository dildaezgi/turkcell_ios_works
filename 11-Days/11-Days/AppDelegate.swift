//
//  AppDelegate.swift
//  11-Days
//
//  Created by Dilda Ezgi Metincan on 26.01.2021.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    let notification = UNUserNotificationCenter.current()
    static var notiStatus = false

    //Bu app sana bildirim gönderebilir mi? allow/dont allow kısmı.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        notification.delegate = self
        notification.requestAuthorization(options: [.alert, .badge, .sound]) { (status, error) in
            
            if(status == true)
            {
                print("status", status)
                AppDelegate.notiStatus = true
            }
            else
            {
                print("Notification Permission False")
                //print("status", (error?.localizedDescription)!)
                
            }
        }
        
        return true
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicatinDidBecomeActive Call")
    }
    
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

