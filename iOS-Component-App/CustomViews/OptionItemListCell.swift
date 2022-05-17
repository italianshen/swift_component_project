//
//  OptionItemListCell.swift
//  pengxiang_travel
//
//  Created by danny on 2021/5/8.
//  Copyright © 2021 udianbus. All rights reserved.
//

import UIKit

class OptionItemListCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var optionNameLB: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
