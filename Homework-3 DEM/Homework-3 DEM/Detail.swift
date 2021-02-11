//
//  Detail.swift
//  Homework-3 DEM
//
//  Created by Dilda Ezgi Metincan on 20.01.2021.
//

import UIKit

class Detail: UIViewController {
    
    var item = Models()
    
    
    @IBOutlet weak var dImage: UIImageView!
    
    @IBOutlet weak var dTitle: UILabel!
    
    
    @IBOutlet weak var dPrice: UILabel!
    
    
    @IBOutlet weak var dDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dImage.image = item.image
        dTitle.text = item.title
        dPrice.text = "\(item.price) ₺"
        dDetail.text = item.detail
    }
    

   

}
