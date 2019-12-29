//
//  HomeVC.swift
//  CareDirection
//
//  Created by 안재은 on 26/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var showDetailStandard: UIButton!
    
    @IBOutlet weak var showDetailFunction: UIButton!
    
    @IBOutlet weak var showSchedule: UIButton!
    
    @IBOutlet weak var userTableView: SelfSizedTableView!
    
    
    @IBOutlet weak var dropDownButton: UIButton!
    
    
    @IBOutlet weak var blurView: UIView!
    
    
    var userList : [User] = []
    
    var productList : [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 유저 리스트 더미 데이터 생성
        setUserData()
        // 제품 리스트 더미 데이터 생성
        setProductData()
        
        // navigation bar 사용자 추가 isHidden 설정해주기!
        userTableView.isHidden = true
        blurView.isHidden = true
        
        
        // table view customize
        userTableView.clipsToBounds = true
        userTableView.layer.cornerRadius = 20
        userTableView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        userTableView.maxHeight = 300
        userTableView.reloadData()
        
        // collection view delegate, dataSource 설정
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        // scroll view edgeinset 지정해주기
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0)
        
        // button custom 하기
        showDetailStandard.makeRounded(cornerRadius: 13)
        showDetailFunction.makeRounded(cornerRadius: 13)
        showSchedule.makeRounded(cornerRadius: 13)
        showSchedule.setBorder(borderColor: UIColor.brownishGrey, borderWidth: 1)
        
    }
    
    
    // 유저 변경 drop down button
    
    @IBAction func userDropDown(_ sender: Any) {
        if userTableView.isHidden {
            animate(toggle: true)
        } else {
            animate(toggle: false)
        }
    }
    
    
    func animate(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.userTableView.isHidden = false
                //self.blurView.isHidden = false
            }
            self.blurView.isHidden = false
        } else {
            UIView.animate(withDuration: 0.3) {
                self.userTableView.isHidden = true
                self.blurView.isHidden = true
            }
            
        }
    }
    
    // 필수 비타민 & 미네랄 상세보기 button action
    @IBAction func showStandardDetail(_ sender: Any) {
        
        let standardStoryboard = UIStoryboard.init(name: "StandardDetail", bundle: nil)
        guard let dvc = standardStoryboard.instantiateViewController(withIdentifier: "standard") as? StandardDetailVC else {
          return
        }
        present(dvc, animated: true)
        
    }
    
    // 기능성 원료 상세보기 button action
    @IBAction func showFunctionalDetail(_ sender: Any) {
        let functionStoryboard = UIStoryboard.init(name: "FunctionDetail", bundle: nil)
        guard let dvc = functionStoryboard.instantiateViewController(withIdentifier: "functionDetail") as? FunctionDetailVC else {
          return
        }
        present(dvc, animated: true)
    }
    
    // 복용관리 -> 스케쥴표 보기 button action
    @IBAction func showScheduleButtonClick(_ sender: Any) {
        let recordStoryboard = UIStoryboard.init(name: "TakingProductRegist", bundle: nil)
        guard let dvc = recordStoryboard.instantiateViewController(withIdentifier: "takingProduct") as? TakingProductRegistVC else {
          return
        }
        present(dvc, animated: true)
        
    }
    
    
    
}

extension HomeVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = userTableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        
        let user = userList[indexPath.row]
        
        
        if indexPath.row == userList.count - 2 {
            //cell.layer.backgroundColor = UIColor.tealBlue.cgColor
            cell.userName.textColor = UIColor.white
            cell.userName.backgroundColor = UIColor.tealBlue
            cell.deleteButton.isHidden = true
        }
        
        if indexPath.row == userList.count - 1 {
            cell.userName.font = UIFont(name: "Apple SD Gothic Neo", size: 12)
            cell.userName.textColor = UIColor.darkGray
            cell.userName.backgroundColor = UIColor.white
            cell.userName.setBorder(borderColor: UIColor.white, borderWidth: 0)
            cell.deleteButton.isHidden = true
            cell.selectionStyle = .none
        }
        
        cell.userName.text = user.userName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // drop down button 의 타이틀 바꿔주기
        if indexPath.row != userList.count-2 {
            dropDownButton.setTitle(userList[indexPath.row].userName, for: .normal)
            animate(toggle: false)
        }
        
        if indexPath.row != userList.count - 1 {
            dropDownButton.setTitle(userList[indexPath.row].userName, for: .normal)
            animate(toggle: false)
            print("아님!")
        }
        
        if indexPath.row == userList.count - 2 {
            //animate(toggle: false)
            print("뒤에서 두번째 눌림")
            let alert = UIAlertController(title: "추가하시겠습니까?", message: "새로운 데이터 추가를 위해\n설문 조사부터 다시 시작합니다.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
            
            alert.addAction(cancel)
            alert.view.tintColor = UIColor.tealBlue
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
        }
        
        if indexPath.row == userList.count - 1 {
            //animate(toggle: false)
            
            print("뒤에서 첫번째 눌림")
        }
        
    }
}

// collection view datasource
extension HomeVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
        
        let product = productList[indexPath.row]
        
        cell.productName.text = product.productName
        cell.productImage.image = product.productImage
        cell.productCheckImage.image = product.checkImage
        
        return cell
    }
    
    
}

// collection view delegate
extension HomeVC : UICollectionViewDelegate {
    
}

// 제품리스트 더미 데이터 세팅
extension HomeVC {
    
    // 유저 table view 에 넣을 데이터 세팅
    func setUserData() {
        let user1 = User(name: "박진오")
        let user2 = User(name: "엄마")
        let setting = User(name: "+ 사용자 추가하기")
        let info = User(name: "사랑하는 가족의 데이터를 추가하고,\n케어 파트너와 함께 해보세요!")
        
        userList = [user1, user2] + [setting] + [info]
    }
    // 제품 collection view에 넣을 데이터 세팅
    func setProductData() {
        let product1 = Product(productImg: "test1", name: "얼라이브", checkImg: "uncheckCircleIc")
        let product2 = Product(productImg: "test1", name: "얼라이브", checkImg: "uncheckCircleIc")
        let product3 = Product(productImg: "test1", name: "얼라이브", checkImg: "checkCircleIc")
        let product4 = Product(productImg: "test1", name: "얼라이브", checkImg: "uncheckCircleIc")
        let product5 = Product(productImg: "test1", name: "얼라이브", checkImg: "checkCircleIc")
        
        productList = [product1, product2, product3, product4, product5]
    }
    
}
