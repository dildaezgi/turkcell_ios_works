//
//  OrderCell.swift
//  Shoppy
//
//  Created by Dilda Ezgi Metincan on 4.02.2021.
//

import UIKit

class OrderCell: UITableViewCell {
    
    
    @IBOutlet weak var oImage: UIImageView!
    
    
    @IBOutlet weak var oTitle: UILabel!
    
    
    
    @IBOutlet weak var oPrice: UILabel!
    
    
    
    @IBOutlet weak var oDetail: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
