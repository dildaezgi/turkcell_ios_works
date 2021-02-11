//
//  ViewController.swift
//  5-Days
//
//  Created by Dilda Ezgi Metincan on 12.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mail: UITextField!
    
    @IBOutlet weak var txtData: UITextField!
    
    
    @IBAction func fncSend(_ sender: UIButton)
    {
        
        let data = txtData.text! //dataya bir şey yazıldığında getiren
        let mail_data = mail.text!
        
        
        if (data == "") //burası boşsa alert çıkar
        {
           print("Data not empty!")
           alertForm(title: "Data Error", message: "Data not empty!")
        }
        else if (mail_data == "")
        {
            print("Mail not empty!")
            alertForm(title: "Mail Error", message: "Mail not empty!")
        }
    }
    
    func alertForm(title: String, message: String)
    {
        //allert init -> title, message, preferredStyle
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)                                             //.alert kapanamayan alertler, .actionsheet tuşa basmadan boşluğa bile basınca kapanan alert
                //handler: butona basınca ne olucağını gösterir. Üstüne çift tıkla
        //button create
        let yesBtn = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            print("OK Button Click")
        }
        //cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        //add button
        alert.addAction(yesBtn)
        alert.addAction(cancel)
        
        //show
        present(alert, animated: true, completion: nil)
                //completion: işlem tamamlandıktan sonra demektir. üstüne çift tıkla. bir şey olsun istemezsen,rapor etme yoksa nil yaz
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

