//
//  TakingProductRegistVC.swift
//  CareDirection
//
//  Created by 안재은 on 27/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class TakingProductRegistVC: UIViewController {
    
    
    @IBOutlet weak var datePickButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickButton.makeRounded(cornerRadius: 8)
        //datePickButton.dropShadow(color: UIColor.darkGray, offSet: CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>), opacity: <#T##Float#>, radius: <#T##CGFloat#>)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
