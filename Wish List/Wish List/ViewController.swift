//
//  ViewController.swift
//  Wish List
//
//  Created by Dilda Ezgi Metincan on 24.01.2021.
//

import UIKit
import SCLAlertView

class ViewController: UIViewController {
    
    var stArr:[ListSt] = []
    let datab = DataB()
    
    @IBOutlet weak var txtProduct: UITextField!
    
    
    @IBOutlet weak var txtAmount: UITextField!
    
    @IBAction func btnList(_ sender: UIButton) {
        
        performSegue(withIdentifier: "CreateTable", sender: stArr)
    }
    
    
    
    @IBAction func btnAdd(_ sender: UIButton)
    {
        let product = txtProduct.text!
        let amount = txtAmount.text!
        
        let row = datab.ProductInsert(product: product, amount: amount)
        print(row)
        
        if(txtProduct.text == "" || txtAmount.text == "")
        {
            SCLAlertView().showInfo("Warning!", subTitle: "Please write a product")
        }
        else
        {
            SCLAlertView().showInfo("Product successfully added", subTitle: "You are great")
        }
        
        
       
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        datab.fncConnection()
    }


}

