//
//  ProductTable.swift
//  Wish List
//
//  Created by Dilda Ezgi Metincan on 25.01.2021.
//

import UIKit
import SCLAlertView

class ProductTable: UITableViewController
{
    
    let datab = DataB()
    var arr:[ListSt] = []
    
  
    override func viewDidLoad()
    {
        super.viewDidLoad()

        datab.fncConnection()
        arr = datab.ProductList()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductCell
        
        let item = arr[indexPath.row]
        
        //cell.textLabel?.text = item.product
        
        cell.pName.text = item.product
        cell.pAmount.text = item.amount

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
            {
            let item = arr[indexPath.row]
            let deleteRow = datab.userDelete(uid: item.number)
            if (deleteRow > 0)
            {
                arr.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let item = arr[indexPath.row]
        
        SCLAlertView().showInfo(" Product: \(item.product)", subTitle: "Amount: \(item.amount)")
        
        print(item.product)
    }

}

