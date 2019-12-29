//
//  CustomImageView.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

// 기능 상세뷰에서 같은 이미지 뷰 반복되는 것에 대한 custom view.
class CustomImageView : UIImageView {
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 33
        self.clipsToBounds = true
        self.layer.shadowPath =
            UIBezierPath(roundedRect: self.bounds,
                         cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
    }
    
}
