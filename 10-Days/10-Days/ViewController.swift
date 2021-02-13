//
//  ViewController.swift
//  10-Days
//
//  Created by Dilda Ezgi Metincan on 23.01.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    
    @IBOutlet weak var txtPass: UITextField!
    
    
    @IBAction func fncSend(_ sender: UIButton) {
        
        let email = txtEmail.text!
        let pass = txtPass.text!
        
        let params = ["ref":"5380f5dbcc3b1021f93ab24c3a1aac24", "userEmail":email, "userPass":pass, "face":"no"]
        
        let url = "https://jsonbulut.com/json/userLogin.php"
        
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
            
            //standard response for successful http request control.
            if (res.response?.statusCode == 200)
            {
                let userLogin = try? JSONDecoder().decode(UserLogin.self, from: res.data!)
                
                let status = userLogin?.user[0].durum
                let message = userLogin?.user[0].mesaj
                
                if(status == true)
                {
                    //User login success
                    self.performSegue(withIdentifier: "product", sender: nil)
                }
                else
                {
                    print(message!)
                }
            }
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
