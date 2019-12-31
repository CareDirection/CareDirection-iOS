//
//  TopTapBarVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/31.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TopTapBarVC: ButtonBarPagerTabStripViewController{
    
    var componentList: [String] = ["홈삼", "종합비타민", "홍삼", "로얄젤리"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDesign()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var childList: [TopTabBarResultVC] = []
        
        for i in 0...(componentList.count-1) {
            let child = UIStoryboard.init(name: "Product", bundle: nil).instantiateViewController(identifier: "TopTabBarResultVC") as! TopTabBarResultVC
            child.componentName = componentList[i]
            childList.append(child)
        }
        
        return childList
    }
    
    func loadDesign(){
        self.settings.style.selectedBarHeight = 3
        self.settings.style.selectedBarBackgroundColor = UIColor.white
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = UIColor(white: 1, alpha: 0.6)
            newCell?.label.textColor = UIColor.white
            
            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }

}
