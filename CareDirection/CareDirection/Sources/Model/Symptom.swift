//
//  Symptom.swift
//  CareDirection
//
//  Created by 안재은 on 31/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

struct Symptom {
    var categoryLabel : String
    var categoryLine : UIView?
    
    var symptomImage : UIImage?
    var symptomDetail : String
    
    init(category : String, image : String, detail : String) {
        self.categoryLabel = category
        //self.categoryLine = line
        self.symptomImage = UIImage(named: image)
        self.symptomDetail = detail
    }
}
