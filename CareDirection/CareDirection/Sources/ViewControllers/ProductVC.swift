//
//  ProductVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/29.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ProductVC: UIViewController {

    @IBOutlet var searchFiterTxtView: UITextField!
    @IBOutlet var searchTxtView: UITextField!
    @IBOutlet var searchFilterView: UIView!
    @IBOutlet var searchView: UIView!
    
    @IBOutlet var defaultTypeView: UIView!

    @IBOutlet var backBtn: UIButton!
    @IBOutlet var moreProductViewBtn: UIButton!
    
    @IBOutlet var topTabCV: UICollectionView!
    
    @IBOutlet var resultCountView: UIView!
    @IBOutlet var resultCountViewTopConstraint: NSLayoutConstraint!
    @IBOutlet var resultViewCountLbl: UILabel!
    
    @IBOutlet var topProductTV: UITableView!
    @IBOutlet var topProductTVTopConstraint: NSLayoutConstraint!
    
    var selectedTapIndex: Int = 0
    var viewType: ViewType = .defaultView
    var resultCountViewHeight: CGFloat?
    var tabList: [String] = ["a", "b", "c", "d"]
    var productList: [String] = ["0", "1"]
    var resultCountViewDefaultConstraint: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        setInitVar()
        setDynamicLayout()
        // Do any additional setup after loading the view.
    }
    
    func setLayout(){
        self.searchFilterView.makeRounded(cornerRadius: 3)
        self.searchFilterView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 3)
        
        self.searchView.makeRounded(cornerRadius: 3)
        self.searchView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 3)
        
        self.moreProductViewBtn.makeRounded(cornerRadius: 25)
        
        
    }
    func setInitVar(){
        topTabCV.delegate = self
        topTabCV.dataSource = self
        
        topProductTV.delegate = self
        topProductTV.dataSource = self
        
        self.resultCountViewDefaultConstraint = self.resultCountViewTopConstraint.constant
        self.resultCountView.isHidden = true
        
        resultCountViewHeight = resultCountView.layer.frame.height
    }
    
    func setDynamicLayout(){
        switch viewType {
        case .defaultView:
            resultCountView.isHidden = true
            resultCountViewTopConstraint.constant = resultCountViewDefaultConstraint!
            moreProductViewBtn.isHidden = false
            self.topProductTVTopConstraint.constant = -(resultCountViewHeight!)
            backBtn.isHidden = true
        case .searchView:
            resultCountView.isHidden = false
            resultCountViewTopConstraint.constant = 0
            moreProductViewBtn.isHidden = true
            self.topProductTVTopConstraint.constant = 0
            backBtn.isHidden = false
        }
        
        resultViewCountLbl.text = "\(productList.count)"
        
        topTabCV.reloadData()
        topProductTV.reloadData()
    }
    
    @IBAction func selectedSearchBtn(_ sender: Any) {
        self.viewType = .searchView
        setDynamicLayout()
        
    }
    
    @IBAction func selectedBackBtn(_ sender: Any) {
        self.viewType = .defaultView
        setDynamicLayout()
    }
    
    @IBAction func selectedMoreProductViewBtn(_ sender: Any) {
        let dvc = self.storyboard?.instantiateViewController(identifier: "ComponentProductVC") as! ComponentProductVC
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true)
    }
    
}

extension ProductVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedTapIndex = indexPath.row
        setDynamicLayout()
    }
    
}
extension ProductVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopTabBarCVCell", for: indexPath) as! TopTabBarCVCell
        cell.tabNameLbl.text = tabList[indexPath.row]
        if indexPath.row == selectedTapIndex{
            cell.tabHighlightLbl.isHidden = false
            cell.tabNameLbl.textColor = UIColor.tealBlue
        }else{
            cell.tabHighlightLbl.isHidden = true
            cell.tabNameLbl.textColor = UIColor.veryLightPink
        }
        
        return cell
    }
}

extension ProductVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.layer.frame.width / 3 - 10
        let cellHeight = collectionView.layer.frame.height - 10
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}


extension ProductVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "ProductDetail", bundle: nil)
        let dvc = storyBoard.instantiateViewController(identifier: "ProductDetail") as! ProductDetailVC
        
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
    }
    
}
extension ProductVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewType {
        case .defaultView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BestProductTVCell") as! BestProductTVCell
            cell.nameLbl.text = productList[indexPath.row]
            if indexPath.row == 0 {
                cell.rankImg.image = UIImage.init(named: "imgNumber1")
            }else{
                cell.rankImg.image = UIImage.init(named: "imgNumber2")
            }
            return cell
        case .searchView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BestProductTVCell") as! BestProductTVCell
            cell.nameLbl.text = productList[indexPath.row]
            cell.rankImg.isHidden = true
            return cell
        }

     }
}

enum ViewType {
    case defaultView
    case searchView
}
