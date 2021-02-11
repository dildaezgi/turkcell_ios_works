//
//  ViewController.swift
//  2-Days
//
//  Created by Dilda Ezgi Metincan on 5.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var names:[Any] = [ "ali", "veli", "hasan", "ayşe", 10, true, 10.1 ] //bir dizi oluşturmak

    @IBOutlet weak var txtData: UITextField!
    
    
    @IBAction func fncDataAdd(_ sender: UIButton) {
        
        let txt = txtData.text
        names.append(txt!)
        
        forLoop()
        
    }
    
    func forLoop( )
    {
        for item in names {
           print(item)
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad Call")
        
        
        //let - var
        let number1 = 10
        let write = "Number1 :  \(number1)"
        print (write)
        
        
        var number2 = 20
        print(number2)
        
        let number3:Int = 30
        //bu şekilde number3 her zaman int alır demeye çalıştık
        print(number3)
        
        let status = true
        
        let name = "Efe"
        
        let number4:Float = 10.5
        
        let stNumber1 = Int("ali") ?? 0
        let stNumber2 = Int("80") ?? 0
        let sum = stNumber1 + stNumber2
        print("Sum: \(sum)")
        
        if let stNumber3 = Int("veli") , let stNumber4 = Int("90") {
            let sumx = stNumber3 + stNumber4
            print("Sumx : \(sumx)")
        }
        else {
            print("Number Format Fail")
        }
        
        let dNumber = 10.9
        let cDNumber = Int(dNumber)  //veri kaybına yol açtık, double inte döndü
        print("cDNumber : \(cDNumber) ")
        
        //Array Using
        print(names[0])
      
       
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        //viewDidLoad()
        print("ViewDidAppear Call")
        
    }
    

    
}

