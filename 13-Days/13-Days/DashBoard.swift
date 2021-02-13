//
//  DashBoard.swift
//  13-Days
//
//  Created by Dilda Ezgi Metincan on 30.01.2021.
//

import UIKit

class DashBoard: UIViewController {
    
    
    
    
    @IBOutlet weak var lblData: UILabel!
    
    @IBOutlet weak var txtData: UITextField!
    
    @IBAction func btnData(_ sender: UIButton)
    {
        
        let dt=txtData.text!
        UserDefaults.standard.setValue(dt, forKey: "UserData")
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0]
        print(path)
        
        //userData denetimi
        
        if let data = UserDefaults.standard.string(forKey: "userData")
        {
            lblData.text = data
        }
        
    }

}
