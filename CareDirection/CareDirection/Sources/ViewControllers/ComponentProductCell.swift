//
//  ComponentProductCell.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/26.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ComponentProductCell: UITableViewCell {
    
    @IBOutlet var isSelectedLbl: UILabel!
    @IBOutlet var productImg: UIImageView!
    
    @IBOutlet var companyNameLbl: UILabel!
    @IBOutlet var countryNameLbl: UILabel!
    @IBOutlet var productNameLbl: UILabel!
    
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var pricePerOnePillLbl: UILabel!
    @IBOutlet var standardOfPrice: UILabel!
    
    @IBOutlet var selectInfoBtn: UIButton!
    
    var index: Int = 0
    var delegate: ComponentProductCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func selectedInfoBtn(_ sender: Any) {
        self.delegate?.selectedInfoBtn(index: index)
    }
    
}

protocol ComponentProductCellDelegate {
    func selectedInfoBtn(index: Int)
}
