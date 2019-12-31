//
//  Article.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

struct Article {
    let articleImage : UIImage?
    let articleTitle : String
    
    let articleDetailImage : UIImage?
    let articleDetailContent : String
    
    let articleDetailContentTitle : String
    let articleDetailContentImage : UIImage?
    let articleDetailContentPara : String
    
    init(image : String, title: String, detailImage : String, detailContent: String, detailContentTitle : String, detailContentImage : String, detailContentPara: String) {
        self.articleImage = UIImage(named: image)
        self.articleTitle = title
        
        self.articleDetailImage = UIImage(named: detailImage)
        self.articleDetailContent = detailContent
        self.articleDetailContentTitle = detailContentTitle
        self.articleDetailContentImage = UIImage(named: detailContentImage)
        self.articleDetailContentPara = detailContentPara
    }
}
