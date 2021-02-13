//
//  UserLoginPage.swift
//  Shoppy
//
//  Created by Dilda Ezgi Metincan on 31.01.2021.
//

import UIKit
import Alamofire
import SCLAlertView
import GoogleSignIn
import FirebaseAuth

class UserLoginPage: UIViewController {

    
    @IBOutlet weak var txtEmail: UITextField!

    @IBOutlet weak var txtPass: UITextField!
    
    var googleSingIn = GIDSignIn.sharedInstance()
    
    @IBAction func signInButton(_ sender: Any)
    {
        
        self.googleAuthLogin()
        
    }
        
    func googleAuthLogin()
    {
        self.googleSingIn?.presentingViewController = self
        self.googleSingIn?.clientID = "38098314715-kvsdpa3d57sht7vmml5r5vtcbkq6gad1.apps.googleusercontent.com"
        self.googleSingIn?.signIn()
        
        Auth.auth()
        Auth.auth().addStateDidChangeListener{ Auth,Error in
            if Error != nil
            {
                self.performSegue(withIdentifier: "product", sender: nil)
            }
        }
    }
    
//        if(GIDSignIn.sharedInstance()?.presentingViewController == nil)
//        {
//
//            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
//
//        }
//        GIDSignIn.sharedInstance()?.signIn()
//
//        GIDSignIn.sharedInstance()?.presentingViewController = self
//
//
//        func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
//            if let err = error {
//                print(error)
//            }
//            else
//            {
//                performSegue(withIdentifier: "product", sender: self)
//            }
//        }
        
    
    
    
    @IBAction func fncGiris(_ sender: UIButton) {
        if txtEmail.text! != "" && txtPass.text! != ""
        {
        
            let url = "https://jsonbulut.com/json/userLogin.php"
            
            let params = [ "ref":"5380f5dbcc3b1021f93ab24c3a1aac24", "userEmail": txtEmail.text!, "userPass": txtPass.text! , "face":"no" ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
            
            if ( res.response?.statusCode == 200 ) {
                
                let userLogin = try? JSONDecoder().decode(UserLogin.self, from: res.data!)
                
                if (userLogin != nil)
                {
                    let userID = userLogin?.user[0].bilgiler?.userID
                    UserDefaults.standard.setValue(userID, forKey: "userID")
                }
                
                let status = userLogin?.user[0].durum
//                let message = userLogin?.user[0].mesaj
            
                if ( status == true )
                {
                    self.performSegue(withIdentifier: "product", sender: nil)
                }
                else
                {
                    SCLAlertView().showError("Hata", subTitle: "Bilgilerinizi doğru girdiğinize emin olun.")
                }
            
            }
        }
            
    }
        else
        {
            SCLAlertView().showError("Hata", subTitle: "Lütfen mail adresini ve şifreyi boş bırakmayınız.")
        }
        
}
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }
    
 
}
