//
//  ViewController.swift
//  11-Days
//
//  Created by Dilda Ezgi Metincan on 26.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //animasyonlu açılış
        
        txtTitle.alpha = 0
        txtDetail.alpha = 0
        UIView.animate(withDuration: 0.5)
        {
            self.txtTitle.alpha = 1
            
        }
        //tamamlandığında
        completion:
        { (bool) in
            UIView.animate(withDuration: 0.4) {
                self.txtDetail.alpha = 1
            }
        }

        //resim için animasyon
        UIView.animate(withDuration: 0.6, delay: 0.8, options: .allowAnimatedContent, animations: {
            
            self.img.frame = CGRect(x: 119, y: 462, width: 177, height: 135)
            
        }, completion: nil)
        
        
    }
        
    override func viewDidAppear(_ animated: Bool)     {
        
        print(AppDelegate.notiStatus)
            
        if ( AppDelegate.notiStatus == false)
        {
            let alert = UIAlertController(title: "Warning", message: "Notification permission error", preferredStyle: .alert)
            
            
            //bizi direkt ayarlara gönderen yer
            let gotoSettings = UIAlertAction(title: "Go to settings", style: .default)
            { (action) in
                if let bundleIdentifier = Bundle.main.bundleIdentifier, let appSettings = URL(string: UIApplication.openSettingsURLString + bundleIdentifier) {
                                    if UIApplication.shared.canOpenURL(appSettings) {
                                        UIApplication.shared.open(appSettings)
                                    }
                                }

            }
                
            
            let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            alert.addAction(gotoSettings)
            alert.addAction(cancel)
            
            present(alert, animated: true, completion: nil)
                
            }
        }
    
    
    
    @IBOutlet weak var txtTitle: UITextField!
    
    
    @IBOutlet weak var txtDetail: UITextField!
    
    var timeNow: TimeInterval = 0
    
    @IBAction func fncChange(_ sender: UIDatePicker) {
        
        timeNow = sender.date.timeIntervalSinceNow
        print(sender.date)
        
    }
    
    @IBAction func fncCreate(_ sender: UIButton) {
        
        if (AppDelegate.notiStatus == true)
        {
            let title = txtTitle.text!
            let detail = txtDetail.text!
            
            //content
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = detail
            content.badge = 1
            
            //time
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeNow, repeats: false)
            
            //request
            let req = UNNotificationRequest(identifier: "remember_notification", content: content, trigger: trigger)
            
            //add
            UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
            
            
        }
        
    
        
    }
    
    
}




