//
//  IngredientDetailVC.swift
//  CareDirection
//
//  Created by 안재은 on 28/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class IngredientDetailVC: UIViewController {

    @IBOutlet weak var goToProductButton: UIButton!
    
    @IBOutlet weak var ingredientTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 제품 보러각기 버튼 customize
        goToProductButton.makeRounded(cornerRadius: 21)
        
        // 셀 사이즈 동적으로 조절해주기
        ingredientTableView.rowHeight = UITableView.automaticDimension
        ingredientTableView.estimatedRowHeight = 300

    }
   
    // 제품 보러가기 버튼 클릭시 최저가 있는 뷰로 이동하는 버튼 액션
    @IBAction func goToProductClick(_ sender: Any) {
        
    }
    

}

/*
extension IngredientDetailVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell
    }
    
}
 */

extension IngredientDetailVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
