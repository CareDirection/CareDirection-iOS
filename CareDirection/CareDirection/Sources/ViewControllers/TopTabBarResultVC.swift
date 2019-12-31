//
//  TopTabBarResultVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/31.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TopTabBarResultVC: UIViewController {
    
    var componentName: String?
    var data: [TopTabBarResultVCData] = []

    @IBOutlet var bestProductTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setInitVar()
        // Do any additional setup after loading the view.
    }
    
    func setInitVar(){
        data = [TopTabBarResultVCData(companyName: "Vita Naturals Inc", purchaseCountry: "해외직구", price: 10000, pricePerDay: 700),
        TopTabBarResultVCData(companyName: "Vita Naturals Inc", purchaseCountry: "해외직구", price: 10000, pricePerDay: 700)]
        
        bestProductTV.delegate = self
        bestProductTV.dataSource = self
    }
    
}


extension TopTabBarResultVC: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: componentName)
    }
}

extension TopTabBarResultVC: UITableViewDelegate{
    
}
extension TopTabBarResultVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BestProductTVCell") as! BestProductTVCell
        
        cell.companyNameLbl.text = data[indexPath.row].companyName
        cell.purchaseCountryLbl.text = data[indexPath.row].purchaseCountry
        cell.nameLbl.text = "\(data[indexPath.row].price)"
        cell.priceLbl.text = "\(data[indexPath.row].pricePerDay)"
        
        return cell
    }
}

struct TopTabBarResultVCData{
    var img: String?
    var companyName: String
    var purchaseCountry: String
    var price: Int
    var pricePerDay: Int
    
}
