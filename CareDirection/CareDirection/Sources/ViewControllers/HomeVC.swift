//
//  HomeVC.swift
//  CareDirection
//
//  Created by 안재은 on 26/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    // 제품 나타내는 collection view
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    
    // 기능성 원료 나타내는 collection view
    @IBOutlet weak var functionalCollectionView: UICollectionView!
    @IBOutlet weak var functionalLabel: UILabel!
    @IBOutlet weak var functionalCollectionView2: UICollectionView!
    @IBOutlet weak var functionalLabel2: UILabel!
    
    
    // 문제의 스크롤뷰..ㅎ
    @IBOutlet weak var scrollView: UIScrollView!
    
    // 상세 뷰로 이어지는 버튼들
    @IBOutlet weak var showDetailStandard: UIButton!
    @IBOutlet weak var showDetailFunction: UIButton!
    @IBOutlet weak var showSchedule: UIButton!
    
    // 유저 선택 전체적인 뷰
    @IBOutlet weak var userTableView: SelfSizedTableView!
    @IBOutlet weak var dropDownButton: UIButton!
    //MARK - 추후 dropDownButton.text에 설문조사에서 받은 이름 지정해줘야함!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var navigationBar: UIView!
    
    // 뷰의 전체적인 세 가지 뷰들.
    @IBOutlet weak var ingredientView: UIView!
    @IBOutlet weak var functionView: UIView!
    @IBOutlet weak var takingView: UIView!
    
    // 차트 나타내는 뷰
    @IBOutlet weak var chartView: ChartView!
    
    // 복용제품 등록하지 않았을 시 나타나는 뷰
    @IBOutlet weak var noRegistView: UIView!
    
    
    // 받아올 데이터 리스트들.
    //1. 유저 리스트
    //2. 등록한 제품들 리스트
    //3. 기능성 원료
    //4. 차트 리스트
    var userList : [User] = []
    var productList : [Product] = []
    var takingProductList: [TakingProductData] = []
    
    var functionalIngredientList : [FunctionalEfficacy] = []
    //var functionalIngredientList2 : [FunctionalIngredient] = []
    var functionalIngredientList2 : [FunctionalEfficacy] = []
    var chartList : [MainChart] = []
    //var functionalIngredient : ResponseNutrient!
    var functionalIngredient : [FunctionalNutrient] = []
    var ingredientImgList : [Ingredient] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 유저 리스트 더미 데이터 생성
        setUserData()
        // 제품 리스트 더미 데이터 생성
        setProductData()
        // 기능 성분 가져오기
        setIngredient()
        
        // navigation bar 사용자 추가 isHidden 설정해주기!
        userTableView.isHidden = true
        blurView.isHidden = true
        
        // 전체적인 뷰 블록 나누기 효과
        ingredientView.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.3, radius: 3)
        functionView.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.3, radius: 3)
        takingView.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.3, radius: 3)
        
        //setGraph()
        print(chartList)
        // 차트 뷰 나타내기
        ChartView.playAnimations()
        
        // table view customize
        userTableView.clipsToBounds = true
        userTableView.layer.cornerRadius = 20
        userTableView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        userTableView.maxHeight = 150
        userTableView.reloadData()
        
        // collection view delegate, dataSource 설정
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        // button custom 하기
        showDetailStandard.makeRounded(cornerRadius: 13)
        showDetailFunction.makeRounded(cornerRadius: 13)
        showSchedule.makeRounded(cornerRadius: 13)
        showSchedule.setBorder(borderColor: UIColor.brownishGrey, borderWidth: 1)
        
        // 복용하는 제품이 없을 시 나타내는 뷰
        noRegistView.makeRounded(cornerRadius: 18)
        noRegistView.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.4, radius: 4)
        
        if productList.count == 0 {
            noRegistView.isHidden = false
            productCollectionView.isHidden = true
        }
        setTakingProductCV()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setIngredient()
        self.functionalCollectionView.reloadData()
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
    
    func setTakingProductCV(){
        //takingProductList
        TakingProductService.shared.getCurrentTakingList(date: "2020-01-03"){ data in
            switch data {
            case .success(let data):
                self.takingProductList = data as! [TakingProductData]
                self.productCollectionView.dataSource = self
                self.productCollectionView.delegate = self
                self.productCollectionView.reloadData()
                
                if self.takingProductList.count != 0{
                    self.noRegistView.isHidden = true
                    self.productCollectionView.isHidden = false
                }

            case .requestErr(let msg):
                print("getCurrentTakingList")
                print(msg)
            case .pathErr:
                print("getCurrentTakingList path err")
            case .serverErr:
                print("getCurrentTakingList server err")
            case .networkFail:
                print("getCurrentTakingList network err")
            case .dbErr:
                print("getCurrentTakingList db err")
            }
        }
    }
    
    @IBAction func settingButtonClick(_ sender: Any) {
        let standardStoryboard = UIStoryboard.init(name: "Setting", bundle: nil)
        
        guard let dvc = standardStoryboard.instantiateViewController(withIdentifier: "Setting") as? SettingVC else {
            return
        }
        present(dvc, animated: true)
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
        dvc.takingProductList = self.takingProductList
        present(dvc, animated: true)
    }
    
    @IBAction func goToRegistButton(_ sender: Any) {
        let addStoryboard = UIStoryboard.init(name: "ProductSearch", bundle: nil)
        
        guard let dvc = addStoryboard.instantiateViewController(withIdentifier: "ProductSearch") as? ProductSearchVC else {
            return
        }
        
        present(dvc, animated: true)
    }
}


// 유저 등록 table view datasource & delegate
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
        if indexPath.row == userList.count - 2 {
            dropDownButton.setTitle(dropDownButton.titleLabel?.text, for: .normal)
            animate(toggle: false)
            let alert = UIAlertController(title: "추가하시겠습니까?", message: "새로운 데이터 추가를 위해\n설문 조사부터 다시 시작합니다.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
            
            //
            let secondAlert = UIAlertController(title : "케디의 출시일을 기다려주세요! :)", message : "출시 후 제공될 서비스입니다.\n감사합니다.", preferredStyle: UIAlertController.Style.alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler : nil)

            secondAlert.addAction(defaultAction)
            secondAlert.view.tintColor = UIColor.tealBlue
            
            
            alert.addAction(cancel)
            alert.view.tintColor = UIColor.tealBlue
            alert.addAction(okAction)
            present(secondAlert, animated: true, completion: nil)
            
        } else {
            dropDownButton.setTitle(userList[indexPath.row].userName, for: .normal)
            animate(toggle: false)
            
            
            let alert = UIAlertController(title: "사용자를\n 변환하시겠습니까?", message: "", preferredStyle: UIAlertController.Style.alert)
            
            let secondAlert = UIAlertController(title : "케디의 출시일을 기다려주세요! :)", message : "출시 후 제공될 서비스입니다.\n감사합니다.", preferredStyle: UIAlertController.Style.alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .destructive, handler : nil)

            secondAlert.addAction(defaultAction)
            secondAlert.view.tintColor = UIColor.tealBlue
            
            
            let okAction = UIAlertAction(title: "확인", style: .default)
            
            let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
            
            alert.addAction(cancel)
            alert.view.tintColor = UIColor.tealBlue
            alert.addAction(okAction)
            
            present(secondAlert, animated: true)
               
            
        }
    }
}

// 복용하고 있는 제품들 collection view datasource
extension HomeVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.productCollectionView {
            
            return takingProductList.count
            
        } else if collectionView == self.functionalCollectionView{
            
            return functionalIngredientList.count
            
        } else {
            
            return functionalIngredientList2.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.productCollectionView {
            let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
            
            let product = takingProductList[indexPath.row]
            
            cell.productName.text = product.productName
            cell.productImage.imageFromUrl(product.imageLocation, defaultImgPath: "imgLogo")
            if product.productIsDosed{
                cell.productCheckImage.image = UIImage.init(named: "checkCircleIc")
            }
            else{
                 cell.productCheckImage.image = UIImage.init(named: "uncheckCircleIc")
            }
            cell.productImgBackgroudView.makeRounded(cornerRadius: 15)
            //cell.productImgBackgroudView.dropShadow(color: UIColor.veryLightPink, offSet: CGSize(width: 0, height: 1), opacity: 1, radius: 5)

            
            return cell
        } else if collectionView ==  self.functionalCollectionView {
            let cell = functionalCollectionView.dequeueReusableCell(withReuseIdentifier: "ingredientCell", for: indexPath) as! FunctionalIngredientCell
            
            let ingredient = functionalIngredientList[indexPath.row]
            
            cell.label.text = ingredient.efficacy_name
            
            print(ingredient.efficacy_name)
            
            var imgName = ""
            
            if ingredient.efficacy_name == "면역력ㆍ항산화" {
                imgName = "levelOfImmunity60"
            } else if ingredient.efficacy_name == "간건강" {
                imgName = "liver60"
            } else if ingredient.efficacy_name == "피로회복" {
                imgName = "fatigueRecovery60"
            } else if ingredient.efficacy_name == "눈건강" {
                imgName = "eye60"
            } else if ingredient.efficacy_name == "혈행개선" {
                imgName = "improvement60"
            } else if ingredient.efficacy_name == "소화기능" {
                imgName = "digest60"
            } else if ingredient.efficacy_name == "두뇌활동" {
                imgName = "brain60"
            } else if ingredient.efficacy_name == "운동보조" {
                imgName = "health60"
            } else if ingredient.efficacy_name == "뼈" {
                imgName = "bone60"
            }
            
            cell.imageView.image = UIImage(named: imgName)
            
            if indexPath.row == functionalIngredientList.count - 1 {
                cell.endCircleView.isHidden = false
            }
            return cell
        
        } else {
            let cell = functionalCollectionView2.dequeueReusableCell(withReuseIdentifier: "ingredientCell2", for: indexPath) as! FunctionalIngeredientCell2
            
            let ingredient = functionalIngredientList2[indexPath.row]
            
            var imgName = ""
            
            cell.label.text = ingredient.efficacy_name
            
            if ingredient.efficacy_name == "면역력ㆍ항산화" {
                imgName = "levelOfImmunity60"
            } else if ingredient.efficacy_name == "간건강" {
                imgName = "liver60"
            } else if ingredient.efficacy_name == "피로회복" {
                imgName = "fatigueRecovery60"
            } else if ingredient.efficacy_name == "눈건강" {
                imgName = "eye60"
            } else if ingredient.efficacy_name == "혈행개선" {
                imgName = "improvement60"
            } else if ingredient.efficacy_name == "소화기능" {
                imgName = "digest60"
            } else if ingredient.efficacy_name == "두뇌활동" {
                imgName = "brain60"
            } else if ingredient.efficacy_name == "운동보조" {
                imgName = "health60"
            } else if ingredient.efficacy_name == "뼈" {
                imgName = "bone60"
            }
            
            cell.imageView.image = UIImage(named: imgName)
            
            if indexPath.row == functionalIngredientList2.count - 1 {
                cell.endCircleView.isHidden = false
            }
            
            return cell
        }
        
    }
}

// collection view delegate
extension HomeVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let recordStoryboard = UIStoryboard.init(name: "TakingProductPopUp", bundle: nil)
        
        guard let dvc = recordStoryboard.instantiateViewController(withIdentifier: "TakingProductPopUp") as? TakingProductPopUpVC else {
            return
        }
        present(dvc, animated: true)
    }
}

// 제품리스트 더미 데이터 세팅
extension HomeVC {
    
    // 유저 table view 에 넣을 데이터 세팅
    func setUserData() {
        //let user1 = User(name: "박진오")
        //let user2 = User(name: "엄마")
        //let user3 = User(name: "안재은")
        let setting = User(name: "+ 사용자 추가하기")
        let info = User(name: "사랑하는 가족의 데이터를 추가하고,\n케어 파트너와 함께 해보세요!")
        
        userList = [setting] + [info]
    }
    // 제품 collection view에 넣을 데이터 세팅
    func setProductData() {
        productList = []
    }
    
    func setIngredient() {
        
        NutrientService.shared.showNutrient() {
            [weak self]
            data in
            guard let `self` = self else { return }
            
            switch data {
            case .success(let res) :
                
                self.functionalIngredient = res as! [FunctionalNutrient]
                
                if self.functionalIngredient.count == 0 {
                    
                    
                    
                } else if self.functionalIngredient.count == 1 {
                    self.functionalLabel.text = self.functionalIngredient[0].nutrient
                    self.functionalIngredientList = self.functionalIngredient[0].efficacy!
                    
                    self.functionalLabel2.isHidden = true
                    
                } else {
                    self.functionalLabel.text = self.functionalIngredient[0].nutrient
                    self.functionalIngredientList = self.functionalIngredient[0].efficacy!
                    self.functionalLabel2.text = self.functionalIngredient[1].nutrient
                    self.functionalIngredientList2 = self.functionalIngredient[1].efficacy!
                }
                
                self.functionalCollectionView.dataSource = self
                self.functionalCollectionView.reloadData()
                
                self.functionalCollectionView2.dataSource = self
                self.functionalCollectionView2.reloadData()
                
                
            case .requestErr(let msg):
                print("nutrient : request err")
            case .pathErr:
                print("nutrient : path err")
            case .serverErr:
                print("nutrient : server err")
            case .networkFail:
                print("nutrient : network fail")
            case .dbErr:
                print("nutrient : db err")
            }
        }
    }
    
    
    func setGraph() {
        ChartService.shared.showMainChart() {
            [weak self]
            data in
            
            guard let `self` = self else { return }
            
            print(data)
            switch data {
                
            case .success(let res):
                //self.ChartList = res as! [MainChart]
                self.chartList = res as! [MainChart]
                print("success")
            case .requestErr(let message):
                print("\(message)")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print("네트워크 오류")
            case .dbErr:
                print("db 오류")
            }
            
            
        }
    }
}
