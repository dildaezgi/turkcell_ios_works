//
//  ViewController.swift
//  3-Days
//
//  Created by Dilda Ezgi Metincan on 7.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtSurname: UITextField!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBAction func btnCAll(_ sender: UIButton)
    {
        let name = txtName.text!
        let surname = txtSurname.text!
        let util = Util ()
        let st = util.stringConcat(name: name, surname: surname)
        lblName.text = st
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // object -> new
        //Util ut = new Util()
        let util = Util() // Util sınıfı, util nesnesi
        print(util.name)
        
        //noParameter Call
        util.noParameter()
        //parametre almayan fonksiyonlar çok kullanışlı değil içinde yapar bitirir
        
        //parameter Call
        util.parameter(num1: 50, num2: 80)
        util.parameter(num1: 130, num2: 56)
        
        //returnParameter Call
        let sm = util.parameterReturn(num1: 10, num2: 90)
        if (sm > 150)
        {
            print("Sm: ", sm)
        }
        else
        {
            print("Sum 150!")
        }
        
        //parameterReturns
        let fnc = util.parameterReturns(num1: 80, num2: 90)
        print(fnc.0)
        print(fnc.1)
        
        
        // var -> Name
        print("============================")
        print(util.name) // ali
        util.name = "Ahmet" //ahmet
        print(util.name)
        
        let utilx = Util()
        print(utilx.name) //yeniden ali basılıyor. değişiklik yapılmış haliyle değil eski haliyle çıkıyor
        
        let st = Settings(name: "Ali", number: 30) //bunu sınıf içinde kullanabiliriz
        st.call()
        
        
        var dic = [ "name": "dilda", "surname": "metincan" ]
        //dic'te sıralama önemli değil hashcode'a göre sırlaıyor
        //add item
        dic["age"] = "24"
        dic["age"] = "25" //program ilkini pas geçer sonuncuyu alır 25i
        dic["mail"] = "demetincan@gmail.com"
        dic["city"] = "ankara"
        
        //delete item
        dic.removeValue(forKey: "mail")
        
        //all key and data alımı
        for (key, value) in dic
        {
            print(key, value)
        }
        
        print(dic)
        
        
        var dicx = [ EUser.name: "ezgi", EUser.surname: "demir" ]
        dicx[EUser.mail] = "demetincan@gmail.com"
        dicx[EUser.city] = "Wels"
        dicx[EUser.age] = "24"
        
        print(dicx[EUser.name]!) //sadece adı verir
        print(dicx) //tamamını verir
        
    }


}

