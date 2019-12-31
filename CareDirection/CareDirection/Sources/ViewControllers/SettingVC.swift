//
//  SettingVC.swift
//  CareDirection
//
//  Created by 안재은 on 30/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var profileImageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.makeRounded(cornerRadius: 59.5)

    }

    @IBAction func backButtonClick(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    
    
    @IBAction func editButtonClick(_ sender: Any) {
        let standardStoryboard = UIStoryboard.init(name: "Edit", bundle: nil)
        
        guard let dvc = standardStoryboard.instantiateViewController(withIdentifier: "Edit") as? EditVC else {
          return
        }
        present(dvc, animated: true)
    }
    
}
