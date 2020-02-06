//
//  FunctionalIngredientCell.swift
//  CareDirection
//
//  Created by 안재은 on 30/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class FunctionalIngredientCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var endCircleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.makeRounded(cornerRadius: 30)
        self.imageView.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.4, radius: 4)
        
        self.endCircleView.makeRounded(cornerRadius: 5)
    }
}
