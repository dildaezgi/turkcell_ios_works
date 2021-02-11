//
//  ViewController.swift
//  9-Days
//
//  Created by Dilda Ezgi Metincan on 21.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let db = DB()
    
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBAction func btnAdd(_ sender: UIButton) {
        let name = txtName.text!
        let email = txtEmail.text!
        
        //insert
        let row = db.userInsert(name: name, email: email)
        print(row)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db.fncConnection()
      
    }


}

