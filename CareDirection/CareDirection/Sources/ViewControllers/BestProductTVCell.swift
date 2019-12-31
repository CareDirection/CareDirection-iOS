//
//  BestProductTVCell.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/31.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class BestProductTVCell: UITableViewCell {

    @IBOutlet var rankImg: UIImageView!
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var companyNameLbl: UILabel!
    
    @IBOutlet var purchaseCountryLbl: UILabel!
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    
    @IBOutlet var pricePerDayLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
