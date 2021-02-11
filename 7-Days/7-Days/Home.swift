//
//  Home.swift
//  7-Days
//
//  Created by Dilda Ezgi Metincan on 16.01.2021.
//

import UIKit
import SCLAlertView //UNUTMA

class Home: UIViewController {
    
    
    
    @IBAction func fncBtnAllertView(_ sender: UIButton) {
        
        SCLAlertView().showInfo("Önemli Uyarı!", subTitle: "Lütfen adınızı giriniz!")
        // closeButtonTitle: "Tamam")
        
       // SCLAlertView().showWait("Important info", subTitle: "loading")
/*
        SCLAlertView().showTitle(
            "Congratulations", // Title of view
            subTitle: "Operation successfully completed.", timeout: nil, // String of view
            completeText: "Done", // Optional button value, default: ""
            style: .success, // Styles - see below.
            colorStyle: 0xA429FF,
            colorTextButton: 0xFFFFFF
        )
*/
 
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Home viewDidLoad Call")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("Home viewDidAppear Call")
        
    }

}
