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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 제품 보러가기 버튼 customize
        goToProductButton.makeRounded(cornerRadius: 17)
        goToProductButton.backgroundColor = UIColor.seafoamBlue
        goToProductButton.setBorder(borderColor: UIColor.tealBlue, borderWidth: 2)
        
        // 셀 사이즈 동적으로 조절해주기
        ingredientTableView.rowHeight = UITableView.automaticDimension
        ingredientTableView.estimatedRowHeight = 300
        
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


extension IngredientDetailVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
