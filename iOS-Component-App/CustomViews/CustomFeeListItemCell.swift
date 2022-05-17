//
//  CustomFeeListItemCell.swift
//  pengxiang_travel
//
//  Created by danny on 2022/4/20.
//  Copyright © 2022 udianbus. All rights reserved.
//

import UIKit

class CustomFeeListItemCell: UITableViewCell {

    @IBOutlet weak var leftTitleLB: UILabel!
    
    @IBOutlet weak var rightTitleLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
