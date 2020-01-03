//
//  SettingVC.swift
//  CareDirection
//
//  Created by 안재은 on 30/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var navigationBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationBar.layer.addBorder([.bottom], color: UIColor.brownishGrey30, width: 1)
        
        let user = UserDefaults.standard
        
        self.nameLbl.text = user.string(forKey: "user_name")

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
    
    
    
    @IBAction func logoutButton(_ sender: Any) {
        
        
        let alert = UIAlertController(title:"로그아웃 하시겠습니까?",message: "",preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "예", style: .default, handler: { action in
                        
                        let urlString: String = APIConstants.LoginURL
                        guard let requestURL = URL(string: urlString) else { return }
                        var request = URLRequest(url: requestURL)
                        request.httpMethod = "POST"
                        let session = URLSession.shared
                        let task = session.dataTask(with: request) { (responseData, response, responseError) in
                            guard responseError == nil else { return }
                        }
                        task.resume()
                        
                        let storyboard = UIStoryboard(name: "Login", bundle: nil)
                        let loginView = storyboard.instantiateViewController(withIdentifier: "login")
                        self.present(loginView, animated: true, completion: nil)
                    }))
                    alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
                    
                    UserDefaults.standard.set(nil, forKey: "token")
                    let token = UserDefaults.standard
    }
}
