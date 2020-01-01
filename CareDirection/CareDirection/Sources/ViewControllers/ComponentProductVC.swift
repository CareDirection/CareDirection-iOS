//
//  ComponentProductVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/26.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ComponentProductVC: UIViewController {
    
    @IBOutlet var infoView: UIView!
    @IBOutlet var infoViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet var infoViewFirstInfo: UILabel!
    @IBOutlet var infoViewFirstCategory: UILabel!
    
    @IBOutlet var infoViewSecondInfo: UILabel!
    @IBOutlet var infoViewSecondCategory: UILabel!
    
    @IBOutlet var infoViewThirdInfo: UILabel!
    @IBOutlet var infoViewThirdCategory: UILabel!
    
    
    @IBOutlet var productTableView: UITableView!
    @IBOutlet var guideView: UIView!
    @IBOutlet var tableViewTopConstraint: NSLayoutConstraint!
    var tableViewInitTopConstraint: CGFloat!
    @IBOutlet var guideLayout: UIView!
    var infoViewDefaultContstraint: CGFloat!
    var resultDataList:[DummyProduct]?
    
    
    var selectedCellIndex: Int?
    
    @IBOutlet var tableViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        tableViewInitTopConstraint = tableViewTopConstraint.constant
        
        setData()
        setLayout()
        self.infoViewDefaultContstraint = self.infoViewTopConstraint.constant
        // Do any additional setup after loading the view.
    }
    
    func setLayout(){
//        self.guideView.layer.cornerRadius = 25
//        self.guideView.clipsToBounds = true
//        self.guideView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.infoView.layer.cornerRadius = 25
        self.infoView.clipsToBounds = true
        self.infoView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.infoView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1),
                                 offSet: CGSize(width: 0, height: 1),
                                 opacity: 0.16,
                                 radius: 4)
        
    }
    
    
    func setData(){
        resultDataList = [
            DummyProduct.init(productImg: "settingIc", companyName: "Vita Naturals Inc", countryName: "해외직구", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800", pricePerOnePill: 750, standardOfPrice: "30정 기준"),
            DummyProduct.init(productImg: "settingIc", companyName: "Vita Naturals Inc", countryName: "해외직구", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800", pricePerOnePill: 750, standardOfPrice: "30정 기준"),
            DummyProduct.init(productImg: "settingIc", companyName: "Vita Naturals Inc", countryName: "해외직구", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800", pricePerOnePill: 750, standardOfPrice: "30정 기준"),
            DummyProduct.init(productImg: "settingIc", companyName: "Vita Naturals Inc", countryName: "해외직구", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800", pricePerOnePill: 750, standardOfPrice: "30정 기준"),
            DummyProduct.init(productImg: "settingIc", companyName: "Vita Naturals Inc", countryName: "해외직구", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800", pricePerOnePill: 750, standardOfPrice: "30정 기준"),
            DummyProduct.init(productImg: "settingIc", companyName: "Vita Naturals Inc", countryName: "해외직구", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800", pricePerOnePill: 750, standardOfPrice: "30정 기준"),
            DummyProduct.init(productImg: "settingIc", companyName: "Vita Naturals Inc", countryName: "해외직구", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800", pricePerOnePill: 750, standardOfPrice: "30정 기준"),
            DummyProduct.init(productImg: "settingIc", companyName: "Vita Naturals Inc", countryName: "해외직구", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800", pricePerOnePill: 750, standardOfPrice: "30정 기준"),
            DummyProduct.init(productImg: "settingIc", companyName: "Vita Naturals Inc", countryName: "해외직구", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800", pricePerOnePill: 750, standardOfPrice: "30정 기준"),
            DummyProduct.init(productImg: "settingIc", companyName: "Vita Naturals Inc", countryName: "해외직구", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800", pricePerOnePill: 750, standardOfPrice: "30정 기준"),
            DummyProduct.init(productImg: "settingIc", companyName: "Vita Naturals Inc", countryName: "해외직구", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800", pricePerOnePill: 750, standardOfPrice: "30정 기준"),
            DummyProduct.init(productImg: "settingIc", companyName: "Vita Naturals Inc", countryName: "해외직구", productName: "더리얼 알티지 오메가 3 맥스 1400", price: "36,800", pricePerOnePill: 750, standardOfPrice: "30정 기준")]
    }
    @IBAction func hide(_ sender: Any) {
        self.guideLayout.isHidden = true
    }
    @IBAction func selectedBackBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func selectedFilterBtn(_ sender: Any) {
        let dvc = self.storyboard?.instantiateViewController(identifier: "FilterPopUpVC")
        dvc?.modalPresentationStyle = .overFullScreen
        dvc?.modalTransitionStyle = .crossDissolve
        self.present(dvc!, animated: true, completion: nil)
    }
    @IBAction func selectedSearchBtn(_ sender: Any) {
        let dvc = self.storyboard?.instantiateViewController(identifier: "ComponentInSearchVC") as! ComponentInSearchVC
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: nil)
    }
    @IBAction func selectedComponentCategoryInfo(_ sender: UIButton){
        let dvc = self.storyboard?.instantiateViewController(identifier: "ComponentCategoryPopUpVC") as! ComponentCategoryPopUpVC
        switch sender.tag {
        case 0:
            dvc.categoryName = self.infoViewFirstCategory.text
        case 1:
            dvc.categoryName = self.infoViewSecondCategory.text
        case 2:
            dvc.categoryName = self.infoViewThirdCategory.text
        default:
            break
        }
        dvc.modalPresentationStyle = .overFullScreen
        dvc.modalTransitionStyle = .crossDissolve
        self.present(dvc, animated: true, completion: nil)
    }
    
}

extension ComponentProductVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "ProductDetail", bundle: nil)
        
        let dvc = storyBoard.instantiateViewController(withIdentifier: "ProductDetail") as! ProductDetailVC
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("Scroll animation end")
        //showInfoView()
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        //showInfoView()
        print("Scroll drag end")
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        showInfoView()
        print("Scroll end decelerating")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yVelocity = scrollView.panGestureRecognizer .velocity(in: scrollView).y
        
        if yVelocity > 0 {
            hideInfoView()
            
        } else if yVelocity < 0 {
            hideInfoView()
        }
    }
    
    func showInfoView(){
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
            self.infoView.transform = .identity
            self.productTableView.transform = .identity
        }){ finished in
            self.tableViewBottomConstraint.constant = 0
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            //self.tableViewTopConstraint.constant = self.tableViewInitTopConstraint
            
        })
        
    }
    func hideInfoView(){
        UIView.animate(withDuration: 0.25, animations: {
            //self.tableViewTopConstraint.constant = self.tableViewInitTopConstraint - 84
            self.tableViewBottomConstraint.constant = -84
        })
        
        UIView.animate(withDuration: 0.25, animations: {
            self.infoView.transform = CGAffineTransform(translationX: 0, y: -84)
            let move = CGAffineTransform(translationX: 0, y: -84)

            self.productTableView.transform = move
        })
    }
    
}

extension ComponentProductVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultDataList?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComponentProductCell") as! ComponentProductCell
        
        
        if let result = resultDataList{
            cell.index = indexPath.row
            cell.delegate = self
            cell.productImg.image = UIImage.init(named: result[indexPath.row].productImg)
            cell.isSelectedLbl.isHidden = true
            cell.selectInfoBtn.setImage(UIImage.init(named: "btnBarometerunFilter"), for: .normal)
            cell.selectInfoBtn.setImage(UIImage.init(named: "btnBarometerFilter"), for: .selected)
            cell.selectInfoBtn.isSelected = false
            
            if let selectedIndex = self.selectedCellIndex{
                if indexPath.row == selectedIndex{
                    cell.isSelectedLbl.isHidden = false
                    cell.selectInfoBtn.isSelected = true
                }
            }
            
            cell.companyNameLbl.text = result[indexPath.row].companyName
            cell.countryNameLbl.text = result[indexPath.row].countryName
            cell.productNameLbl.text = result[indexPath.row].productName
            cell.priceLbl.text =  result[indexPath.row].price
            cell.pricePerOnePillLbl.text = "1일 \(result[indexPath.row].pricePerOnePill ?? 0)원"
            cell.standardOfPrice.text = result[indexPath.row].standardOfPrice

            
        }
        
        return cell
    }
}

extension ComponentProductVC: ComponentProductCellDelegate{
    func selectedInfoBtn(index: Int) {
        print(index)
        self.selectedCellIndex = index
        self.infoViewFirstInfo.text = "\(index)"
        self.productTableView.reloadData()
    }
}

struct DummyProduct{
    var productImg: String!
    var companyName: String!
    var countryName: String!
    var productName: String!
    var price: String!
    var pricePerOnePill: Int!
    var standardOfPrice: String!
}
