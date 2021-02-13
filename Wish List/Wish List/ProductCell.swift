//
//  ProductCell.swift
//  Wish List
//
//  Created by Dilda Ezgi Metincan on 25.01.2021.
//

import UIKit

class ProductCell: UITableViewCell {

    
    @IBOutlet weak var pName: UILabel!
    
    
    @IBOutlet weak var pAmount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
