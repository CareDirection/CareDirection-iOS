//
//  CustomImageView.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

// 기능 상세뷰에서 같은 이미지 뷰 반복되는 것에 대한 custom view.
class CustomImageView : UIView {
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        //makeRounded(cornerRadius: 33)
        self.dropShadow(color: UIColor.black, offSet: CGSize(width: 0, height: 1), opacity: 0.2, radius: 4)
    }
    
}
