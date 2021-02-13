//
//  Detail.swift
//  Shoppy
//
//  Created by Dilda Ezgi Metincan on 1.02.2021.
//

import UIKit
import SCLAlertView
import Alamofire

class Detail: UIViewController {
  
    
    var item: BilgilerProduct!
    
    var order: [OrderElement] = []
    
    
        
    @IBOutlet weak var dImage: UIImageView!
    
    
    @IBOutlet weak var dTitle: UILabel!
    
    
    @IBOutlet weak var dPrice: UILabel!
    
    
    
    @IBOutlet weak var dDEtail: UITextView!
    
    
    
    @IBAction func btnSiparis(_ sender: UIButton)
    {
        let userID = UserDefaults.standard.string(forKey: "userID")
        
        
//        let productID = UserDefaults.standard.string(forKey: "productID")
        
            
        let params = ["ref": "5380f5dbcc3b1021f93ab24c3a1aac24", "customerId": userID, "productId": item.productID, "html": item.productID ]
            
        print("servis başladı", userID)
            
        let url = "https://jsonbulut.com/json/orderForm.php"
            
       
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
                
            print(res.response?.statusCode)
            
            if (res.response?.statusCode == 200)
            {
                let str = String(decoding: res.data! , as: UTF8.self)
                print(str)
                
                
                let userorder = try? JSONDecoder().decode(Order.self, from: res.data!)
                

                let status = userorder?.order[0].durum
                print(status)
                
                if(status == true)
                {
                
                    print("status", status as Any)
                    
                    SCLAlertView().showTitle(
                        "Tebrikler!", // Title of view
                        subTitle: "Siparişiniz başarıyla oluşturuldu.", timeout: nil, // String ofview
                        completeText: "Tamam", // Optional button value, default: ""
                        style: .success, // Styles - see below.
                        colorStyle: 0xFF8E8A,
                        colorTextButton: 0xFFFFFF
                    )
                }
            }
            
                
            
        }
    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: item.images[0].normal)
        let data = try! Data(contentsOf: url!)
        dImage.image = UIImage(data: data)

        
        dTitle.text = item.productName
        dPrice.text = "\(item.price) ₺"
        dDEtail.text = item.bilgilerProductDescription
        
        print("girdi")
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowat indexPath: IndexPath)
//    {
//        let item = order[indexPath.row]
//        performSegue(withIdentifier: "goOrderTable", sender: item)
//    }
//
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "goOrderTable")
//        {
//            let vc = segue.destination as! OrderTable
//            vc.orderList = (sender as! OrderListElement)
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
