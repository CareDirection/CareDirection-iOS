//
//  TakingProductSearchResultTVCell.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/03.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import UIKit

class TakingProductSearchResultTVCell: UITableViewCell {
  
    @IBOutlet var productImg: UIImageView!
    
    @IBOutlet var companyNameLbl: UILabel!
    @IBOutlet var productNameLbl: UILabel!
    
    @IBOutlet var isImportLbl: UILabel!
    @IBOutlet var productPriceLbl: UILabel!
    @IBOutlet var pricePerUnitLbl: UILabel!
    
    @IBOutlet var productStandardLbl: UILabel!
    @IBOutlet var isManagedLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
