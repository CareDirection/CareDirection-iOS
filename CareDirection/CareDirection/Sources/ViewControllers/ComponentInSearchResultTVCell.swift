//
//  ComponentInSearchResultTVCell.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/31.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ComponentInSearchResultTVCell: UITableViewCell {
    @IBOutlet var img: UIImageView!
    @IBOutlet var companName: UILabel!
    @IBOutlet var country: UILabel!
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var price: UILabel!
    
    @IBOutlet var pricePerDay: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
