//
//  StandardDetailCell.swift
//  CareDirection
//
//  Created by 안재은 on 30/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class StandardDetailCell: UICollectionViewCell {
    @IBOutlet weak var standardTitle: UILabel!
    
    @IBOutlet weak var standard1: UILabel!
    @IBOutlet weak var standard2: UILabel!
    @IBOutlet weak var standard3: UILabel!
    
    @IBOutlet weak var standardChart: UIView!
    
    @IBOutlet weak var chartHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var standardDetail: UILabel!
    
}
