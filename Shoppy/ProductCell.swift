//
//  ProductCell.swift
//  Shoppy
//
//  Created by Dilda Ezgi Metincan on 31.01.2021.
//

import UIKit

class ProductCell: UITableViewCell {
    
    
    @IBOutlet weak var pImage: UIImageView!
    
    
    @IBOutlet weak var pTitle: UILabel!
    
    
    @IBOutlet weak var pPrice: UILabel!
    
    
    @IBOutlet weak var pDetail: UITextView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
