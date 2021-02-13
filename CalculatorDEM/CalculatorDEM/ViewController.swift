//
//  ViewController.swift
//  CalculatorDEM
//
//  Created by Dilda Ezgi Metincan on 5.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var result: UITextField!
    
    @IBOutlet weak var txtData: UITextField!
    
    @IBOutlet weak var txtDataa: UITextField!
    
    
    @IBAction func funcSummation(_ sender: UIButton) {
       
        result.text = String(Float(txtData.text!)! + Float(txtDataa.text!)!)
        
        
        //toplama işlemi
    }
    
    
    @IBAction func funcSubtraction(_ sender: UIButton) {
        result.text = String(Float(txtData.text!)! - Float(txtDataa.text!)!)
        //çıkartma işlemi
    }
    
    
    @IBAction func funcMultiplication(_ sender: UIButton) {
        result.text = String(Float(txtData.text!)! * Float(txtDataa.text!)!)
        
        //çarpma işlemi
    }
    
    
    
    @IBAction func funcDivision(_ sender: UIButton) {
        result.text = String(Float(txtData.text!)! / Float(txtDataa.text!)!)
        if txtDataa.text != "0" {
            result.text = String(Float(txtData.text!)! / Float(txtDataa.text!)!)
        }
        else
        {
            result.text = "Number Format Fail"
        }
        
        //bölme işlemi
    }
    
    
 
    
   
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

