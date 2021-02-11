//
//  CustomCell.swift
//  Homework-3 DEM
//
//  Created by Dilda Ezgi Metincan on 18.01.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var pImage: UIImageView!
    
    @IBOutlet weak var pTitle: UILabel!
    
    @IBOutlet weak var pPrice: UILabel!
    
    @IBOutlet weak var pDetail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
