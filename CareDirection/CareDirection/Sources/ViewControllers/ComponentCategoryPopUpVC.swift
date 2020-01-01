//
//  ComponentCategoryPopUpVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2020/01/01.
//  Copyright © 2020 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ComponentCategoryPopUpVC: UIViewController {

    @IBOutlet var popUpBackgroundView: UIView!
    @IBOutlet var firstCategoryNameLbl: UILabel!
    @IBOutlet var firstCategoryInfoLbl: UITextView!
    
    var categoryName: String?
    var categoryInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstCategoryNameLbl.text = categoryName
        popUpBackgroundView.makeRounded(cornerRadius: 21)
    }

    @IBAction func selectedClosedBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
