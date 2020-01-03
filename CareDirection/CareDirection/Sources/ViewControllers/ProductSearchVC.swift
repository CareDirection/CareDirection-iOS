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
    
    var searchResult: [TakingProductSearch] = []
    
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
        self.searchResultTV.dataSource = self
        
        
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
        TakingProductService.shared.searchProductToRegist(keyword: textField.text ?? " "){ data in
            switch data{
            case .success(let data):
                self.searchResult = data as! [TakingProductSearch]
                self.searchResultCount.text = "\(self.searchResult.count)"
                self.searchResultTV.reloadData()
                self.searchResultView.isHidden = false
            case .requestErr(_):
                print("searchProductToRegist request err")
            case .pathErr:
                print("searchProductToRegist path err")
            case .serverErr:
                print("searchProductToRegist server err")
            case .networkFail:
                print("searchProductToRegist network err")
            case .dbErr:
                print("searchProductToRegist db err")
            }
            
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        
        textField.resignFirstResponder()
        
        self.searchResultView.isHidden = false
        
        return true
        
    }


}

extension ProductSearchVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchResult[indexPath.row].productIsAlreadyManaged{
            
        }else{
            let storyBoard = UIStoryboard.init(name: "TakingProductInfo", bundle: nil)
            let dvc = storyBoard.instantiateViewController(identifier: "TakingProductInfoVC") as! TakingProductInfoVC
            
            dvc.productIdx = searchResult[indexPath.row].productIdx
            dvc.modalPresentationStyle = .fullScreen
            self.present(dvc, animated: true, completion: nil)
        }
    }
}

extension ProductSearchVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResult.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TakingProductSearchResultTVCell") as! TakingProductSearchResultTVCell
        cell.productImg.imageFromUrl(searchResult[indexPath.row].imageLocation, defaultImgPath: "imgLogo")
        cell.companyNameLbl.text = searchResult[indexPath.row].productCompanyName
        cell.productNameLbl.text = searchResult[indexPath.row].productName
        cell.productPriceLbl.text = searchResult[indexPath.row].productPrice
        cell.pricePerUnitLbl.text = searchResult[indexPath.row].productPricePerUnit
        cell.productStandardLbl.text = searchResult[indexPath.row].productQuantity
        
        if !searchResult[indexPath.row].productIsImport{
            cell.isImportLbl.isHidden = true
        }
        
        if !searchResult[indexPath.row].productIsAlreadyManaged{
            cell.isManagedLbl.isHidden = true
        }
        else{
            cell.isManagedLbl.isHidden = false
        }
        
        return cell
        
    }
}
