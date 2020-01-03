//
//  SurveySymptomCell.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/25.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveySymptomCell: UICollectionViewCell {
    @IBOutlet var symptomLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.symptomLbl.makeRounded(cornerRadius: 8)
    }
}
