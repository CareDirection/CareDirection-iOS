//
//  SurveyFin.swift
//  CareDirection
//
//  Created by 안재은 on 27/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveyFin: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.makeRounded(cornerRadius: 25)
    }
    
    
    @IBAction func nextButtonClick(_ sender: Any) {
        let homeStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
        let dvc = homeStoryboard.instantiateViewController(withIdentifier: "Home")
        present(dvc, animated: true)
    }
}
