//
//  HomeController.swift
//  6-Days
//
//  Created by HAKAN ÖZER on 14.01.2021.
//

import UIKit

class HomeController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    var stArr:[Cities] = []
    let arr = ["Adana", "Bursa", "Van", "Gaziantep", "Hayat"]
    var selectCity = ""

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBAction func btnAdd(_ sender: UIButton) {
        
        let title = txtTitle.text!
        var cit = Cities()
        cit.city = selectCity
        cit.title = title
        
        stArr.append(cit)
        
        print(stArr)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        arr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = arr[row]
        selectCity = item
        print(item)
    }


}
