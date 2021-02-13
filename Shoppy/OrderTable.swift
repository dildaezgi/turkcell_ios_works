//
//  OrderTable.swift
//  Shoppy
//
//  Created by Dilda Ezgi Metincan on 4.02.2021.
//

import UIKit
import Alamofire

class OrderTable: UITableViewController
{
   
    var orderList: [OrderListElement]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let uid = UserDefaults.standard.string(forKey: "userID")
        {
            
            let params = ["ref": "5380f5dbcc3b1021f93ab24c3a1aac24", "musterilerID": uid ]
            
            print("servis başladı", uid)
            
            let url = "https://jsonbulut.com/json/orderList.php"
            
            AF.request(url, method: .get, parameters: params).responseJSON { (res) in
                if (res.response?.statusCode == 200)
                {
                    
                    let userOrderList = try? JSONDecoder().decode(OrderList.self, from: res.data!)

                    print(userOrderList as Any)
                    
                    if let list = userOrderList?.orderList[0]
                    {
                        self.orderList = list
                        self.tableView.reloadData()
                        print("data geldi", list.count)
                    
                    }
                    
                    
                    
                }
            }
        }
        
    }

        
        
        
       
        
       
  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orderList!.count
    }

   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderCell

        let item = orderList![indexPath.row]
        
        cell.oTitle.text = item.urunAdi
        cell.oPrice.text = "\(item.fiyat) ₺"
        cell.oDetail.text = item.aciklama
        
        let url = URL(string: item.normal)
        let data = try! Data(contentsOf: url!)
        cell.oImage.image = UIImage(data: data)

        return cell
    }
    
}

