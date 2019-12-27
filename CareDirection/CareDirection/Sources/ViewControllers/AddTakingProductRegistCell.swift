//
//  AddTakingProductRegistCell.swift
//  CareDirection
//
//  Created by 안재은 on 27/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

class AddTakingProductRegistCell: UICollectionViewCell {
    
    @IBOutlet weak var plusImage: UIImageView!
    
    @IBOutlet weak var plusLabel: UILabel!
    
    @IBOutlet weak var shapeView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.shapeView.makeRounded(cornerRadius: 18)
        self.shapeView.dropShadow(color: UIColor.darkGray, offSet: CGSize(width: 0, height: 1), opacity: 0.2, radius: 4)
        
    }
}
