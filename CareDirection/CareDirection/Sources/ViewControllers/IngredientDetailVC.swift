//
//  IngredientDetailVC.swift
//  CareDirection
//
//  Created by 안재은 on 28/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class IngredientDetailVC: UIViewController {

    @IBOutlet weak var navigationBar: UIView!
    
    @IBOutlet weak var goToProductButton: UIButton!
    
    @IBOutlet weak var ingredientTableView: UITableView!
    
    var detailList : Ingredient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 제품 보러가기 버튼 customize
        goToProductButton.makeRounded(cornerRadius: 17)
        goToProductButton.backgroundColor = UIColor.seafoamBlue
        goToProductButton.setBorder(borderColor: UIColor.tealBlue, borderWidth: 2)
        
        // 셀 사이즈 동적으로 조절해주기
        ingredientTableView.rowHeight = UITableView.automaticDimension
        ingredientTableView.estimatedRowHeight = 600
        
        // navigation bar customize
        navigationBar.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.2, radius: 4)

    }
   
    // 제품 보러가기 버튼 클릭시 최저가 있는 뷰로 이동하는 버튼 액션
    @IBAction func goToProductClick(_ sender: Any) {
        
    }
    
    // back button action
    
    @IBAction func backButtonClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}

extension IngredientDetailVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let nameCell = ingredientTableView.dequeueReusableCell(withIdentifier: "nameCell") as! IngredientNameCell
            
            nameCell.nameLabel.text = detailList?.ingredientName
            
            return nameCell
            
        } else if indexPath.row == 1 {
            
            let imageCell = ingredientTableView.dequeueReusableCell(withIdentifier: "imageCell") as! IngredientImageCell
            
            imageCell.ingredientImage.image = detailList?.ingredientDetailImage
            
            return imageCell
            
        } else {
            let explainCell = ingredientTableView.dequeueReusableCell(withIdentifier: "explainCell") as! IngredientExplainCell
            
            explainCell.explainLabel.text = detailList?.ingredientDetail
            
            return explainCell
            
        }
    }
}

extension IngredientDetailVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
