//
//  ProductSearchVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/30.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ProductSearchVC: UIViewController {

    @IBOutlet var searchBackgroudView: UIView!
    
    @IBOutlet var searchResultView: UIView!
    
    @IBOutlet var searchTxtField: UITextField!
    
    @IBOutlet var searchResultCount: UILabel!
    
    @IBOutlet var searchResultTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitVar()
        setInitLayout()

        // Do any additional setup after loading the view.
    }
    
    func setInitLayout(){
        searchResultView.isHidden = true
        searchBackgroudView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 3)
    }
    func setInitVar(){
        self.searchResultTV.delegate = self
        self.searchTxtField.delegate = self
        //self.searchResultTV.dataSource = self
        
        
    }
    
    @IBAction func selectedCancelBtn(_ sender: Any) {
        searchResultView.isHidden = true
        searchTxtField.text = ""
    }
    @IBAction func selectedBackBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
}

extension ProductSearchVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text ?? "Empty")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn \((textField.text) ?? "Empty")") // Process of closing the Keyboard when the line feed button is pressed.
        textField.resignFirstResponder()
        
        self.searchResultView.isHidden = false
        
        return true
        
    }


}

extension ProductSearchVC: UITableViewDelegate{
    
}
//
//extension ProductSearchVC: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}
//
//struct SearchResultTVData {
//    let img: String?
//    let company: String?
//    let
//}
