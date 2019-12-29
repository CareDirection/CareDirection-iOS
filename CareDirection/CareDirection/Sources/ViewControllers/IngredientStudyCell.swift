//
//  IngredientStudyCell.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class IngredientStudyCell: UICollectionViewCell {
    
    @IBOutlet weak var ingredientImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ingredientImage.makeRounded(cornerRadius: 32)
    }
}
