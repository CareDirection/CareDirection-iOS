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
    
    init(image : String, title: String) {
        self.articleImage = UIImage(named: image)
        self.articleTitle = title
    }
}
