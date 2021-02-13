//
//  RegistrationPage.swift
//  Shoppy
//
//  Created by Dilda Ezgi Metincan on 2.02.2021.
//

import UIKit
import Alamofire
import SCLAlertView

class RegistrationPage: UIViewController {
    
    
    
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var txtSurname: UITextField!
    
    
    @IBOutlet weak var txtPhone: UITextField!
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    
    @IBOutlet weak var txtPass: UITextField!
    
    
    @IBAction func fncRegistration(_ sender: UIButton)
    {
        
        let name = txtPhone.text!
        let surname = txtSurname.text!
        let phone = txtPhone.text!
        let email = txtEmail.text!
        let pass = txtPass.text!
            
           
        if name != "" &&  surname != "" && phone != "" && email != "" && pass != ""
            {

            
            let params = [ "ref":"5380f5dbcc3b1021f93ab24c3a1aac24", "userName": name , "userSurname": surname, "userPhone": phone, "userMail": email, "userPass": pass ]
            let url = "https://jsonbulut.com/json/userRegister.php"
            
            
            AF.request(url, method: .get, parameters: params).responseJSON { (res) in
                
                if (res.response?.statusCode == 200)
                {
                    let str = String(decoding: res.data! , as: UTF8.self)
                    print(str)
                    
                    
                    let kullaniciregis = try? JSONDecoder().decode(Registration.self, from: res.data!)
                   
                    let status = kullaniciregis?.user![0].durum
                    
                        if (status == true)
                        {
                         
                            let userID = kullaniciregis!.user![0].kullaniciID
                            UserDefaults.standard.setValue(userID, forKey: "userID")
                            print(userID)
                            
                            
                            self.performSegue(withIdentifier: "goProductTable", sender: nil)
                            print("kayıt başarılı")
                        }
                        else
                        {
                            SCLAlertView().showError("Hata", subTitle: "Bu mail adresi kullanılıyor.")
                        }
                }
            }
        }
        else
        {
            SCLAlertView().showError("Hata", subTitle: "Lütfen gerekli alanları doldurunuz.")
        }
    }
        
            


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
