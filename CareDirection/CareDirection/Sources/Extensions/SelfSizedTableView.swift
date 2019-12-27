//
//  SelfSizedTableView.swift
//  CareDirection
//
//  Created by 안재은 on 26/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

// table view size 동적으로 조절하도록
class SelfSizedTableView: UITableView {

    var maxHeight: CGFloat = UIScreen.main.bounds.size.height
    
    override func reloadData() {
      super.reloadData()
      self.invalidateIntrinsicContentSize()
      //self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
      let height = max(contentSize.height, maxHeight)
      return CGSize(width: contentSize.width, height: height)
    }
    

}
