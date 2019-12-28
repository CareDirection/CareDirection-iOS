//
//  ProductVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/29.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ProductVC: UIViewController {
    
    @IBOutlet var backBtn: UIButton!

    @IBOutlet var searchFiterTxtView: UITextField!
    @IBOutlet var searchTxtView: UITextField!
    @IBOutlet var searchFilterView: UIView!
    @IBOutlet var searchView: UIView!
    
    @IBOutlet var defaultTypeView: UIView!
    @IBOutlet var searchTypeView: UIView!
    @IBOutlet var searchResultCountLbl: UILabel!
    
    
    @IBOutlet var productTV: UITableView!
    @IBOutlet var productTvTopConstraint: NSLayoutConstraint!
    
    @IBOutlet var productMainInfoViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet var moreProductViewBtn: UIButton!
    
    var viewType:ViewType = .defaultView
    var defaultConstraint: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.defaultConstraint = defaultTypeView.layer.frame.height
        setLayout()
        setDynamicLayout()
        // Do any additional setup after loading the view.
    }
    
    func setLayout(){
        self.searchFilterView.makeRounded(cornerRadius: 3)
        self.searchFilterView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 3)
        
        self.searchView.makeRounded(cornerRadius: 3)
        self.searchView.dropShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), offSet: CGSize(width: 0, height: 1), opacity: 0.16, radius: 3)
        
        self.moreProductViewBtn.makeRounded(cornerRadius: 25)
        self.productMainInfoViewTopConstraint.constant = defaultConstraint
    }
    
    func setDynamicLayout(){
        switch self.viewType {
        case .defaultView:
            self.backBtn.isHidden = true
            self.searchTypeView.isHidden = true
            self.defaultTypeView.isHidden = false
            self.moreProductViewBtn.isHidden = false
            self.productMainInfoViewTopConstraint.constant = defaultConstraint
            
        case .searchView:
            self.backBtn.isHidden = false
            self.searchTypeView.isHidden = false
            self.defaultTypeView.isHidden = true
            self.moreProductViewBtn.isHidden = true
            
            self.productMainInfoViewTopConstraint.constant = 0

        }
        
    }
    
    @IBAction func selectedSearchBtn(_ sender: Any) {
        self.viewType = .searchView
        setDynamicLayout()
    }
    
    @IBAction func selectedBackBtn(_ sender: Any) {
        self.viewType = .defaultView
        setDynamicLayout()
    }
}

extension ProductVC: UITableViewDelegate {
    
}
extension ProductVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

enum ViewType{
    case defaultView
    case searchView
}
