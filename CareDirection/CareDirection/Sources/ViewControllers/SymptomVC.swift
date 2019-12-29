//
//  SymptomVC.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SymptomVC: UIViewController {

    @IBOutlet weak var goToProductButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goToProductButton.makeRounded(cornerRadius: 17)
        goToProductButton.backgroundColor = UIColor.seafoamBlue
        
        goToProductButton.setBorder(borderColor: UIColor.tealBlue, borderWidth: 2)
    }

}
