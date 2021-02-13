//
//  AppDelegate.swift
//  Shoppy
//
//  Created by Dilda Ezgi Metincan on 31.01.2021.
//

import UIKit
import Firebase
import GoogleSignIn
import SCLAlertView


@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance()?.clientID = "38098314715-kvsdpa3d57sht7vmml5r5vtcbkq6gad1.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
        
        
        return true
    }

    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
      if let error = error
      {
        print(error)
        return
      }
        
        print("user successfully signin into google")

      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (user, error) in
                if let error = error {
                    print("failed to create firebase user using google account")
                    print("\(error.localizedDescription)")
                    return
                }


                // TODO: - Save user data to Firebase database

                print("successfully loggin user to firebase")
                

            }
    }


    }
    
//    func login()
//    {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        let mainPage = storyboard.instantiateViewController(identifier: "goProductTable")
//
//        window?.rootViewController = mainPage
//
//    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ((GIDSignIn.sharedInstance()?.handle(url)) != nil)
//        return GIDSignIn.sharedInstance()?.handle(url)
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




