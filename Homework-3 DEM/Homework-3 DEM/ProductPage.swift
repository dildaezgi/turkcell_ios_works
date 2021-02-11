//
//  ProductPage.swift
//  Homework-3 DEM
//
//  Created by Dilda Ezgi Metincan on 18.01.2021.
//

import UIKit

class ProductPage: UIViewController,UIDocumentPickerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var stArr:[Models] = []
    let arr = ["iPhone 6", "iPhone 7", "iPhone 8", "iPhone X", "iPhone XR", "iPhone 11", "iPhone 12"]
    var selectModel = String()
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var txtPrice: UITextField!
    
    @IBOutlet weak var txtAbout: UITextView!
    
    
    @IBAction func btnCreate(_ sender: UIButton)
    {
        performSegue(withIdentifier: "CreateTable", sender: stArr)
    }
    
    
    @IBAction func btnAdd(_ sender: UIButton)
    {
        let title = txtTitle.text!
        let price = Int(txtPrice.text!)
        let detail = txtAbout.text!
        
        var mod = Models()
        mod.title = title
        mod.price = price!
        mod.detail = detail
        mod.image = UIImage(imageLiteralResourceName: selectModel)
        
        let alert = UIAlertController(title: "Harikasın", message: "Ürün listeye eklendi!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)

        stArr.append(mod)
        
        print(stArr)
        print(stArr.count)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        arr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return arr[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let item = arr[row]
        selectModel = item
        print(item)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "CreateTable")
        {
            let vc = segue.destination as! ModelsTableView
            vc.arr = sender as! [Models]
        }
    }
    
    
        
}
    
