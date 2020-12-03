//
//  ThirdTableViewCell.swift
//  FinalProject-AdventurerTextSim
//
//  Created by Student on 12/3/20.
//  Copyright © 2020 Northwest. All rights reserved.
//

import UIKit

class ThirdTableViewCell: UITableViewCell{

    
    
    
    @IBOutlet weak var Input: UILabel!
    
    @IBOutlet weak var output: UILabel!
    
    
    @IBOutlet weak var xy: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
