//
//  ModelsTableView.swift
//  Homework-3 DEM
//
//  Created by Dilda Ezgi Metincan on 18.01.2021.
//

import UIKit

class ModelsTableView: UITableViewController {
    
    var arr:[Models] = []

    override func viewDidLoad() {
        super.viewDidLoad()
         
        dataResult()
    }
    
    func dataResult()
    {
   /* {
        for i in 6...12
        {
            var model = Models()
            model.title = "iPhone \(i)"
            model.detail = "Detail- \(i)"
            model.price = i
            model.image = UIImage(named: "\(i)")!
        }
     */
        
    }
    
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell

        let item = arr[indexPath.row]
        cell.pTitle.text = item.title
        cell.pDetail.text = item.detail
        cell.pPrice.text = "\(item.price)₺"
        cell.pImage.image = item.image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Click : \(indexPath.row)")
        let item = arr[indexPath.row]
        performSegue(withIdentifier: "Detail", sender: item)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if ( segue.identifier == "Detail" ) {
            let vc = segue.destination as! Detail
            vc.item = sender as! Models
        }
        
    }

}
