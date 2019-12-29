//
//  SymptomVC.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SymptomVC: UIViewController {

    
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var goToProductButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // buttom customize
        goToProductButton.makeRounded(cornerRadius: 17)
        goToProductButton.backgroundColor = UIColor.seafoamBlue
        
        goToProductButton.setBorder(borderColor: UIColor.tealBlue, borderWidth: 2)
        
        // navigation bar drop shadow
        navigationBar.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.4, radius: 4)
    }
    
    

}
