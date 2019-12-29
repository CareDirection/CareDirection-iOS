//
//  ProductComponentInfoTVCell.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/28.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ProductComponentInfoTVCell: UITableViewCell {
    @IBOutlet var categoryLbl: UILabel!
    @IBOutlet var infoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
