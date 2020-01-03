//
//  StandardDetailVC.swift
//  CareDirection
//
//  Created by 안재은 on 28/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class StandardDetailVC: UIViewController {

    @IBOutlet weak var navigationBar: UIView!
    
    @IBOutlet weak var standardCollectionView: UICollectionView!
    
    var standardList : [ChartDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        ChartView.playAnimations()
        
        //set single standard data
        setData()
        
        navigationBar.layer.addBorder([.bottom], color: UIColor.brownishGrey30, width: 1)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    

}

extension StandardDetailVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return standardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = standardCollectionView.dequeueReusableCell(withReuseIdentifier: "standardCell", for: indexPath) as! StandardDetailCell
        
        let standard = standardList[indexPath.row]
        
//        cell.standardTitle.text = standard.standardTitle
//        cell.standard1.text = standard.stnadard1
//        cell.standardDetail.text = standard.standardDetail
//        cell.standardChart.frame.size.height = standard.standardChart
    
        cell.standardTitle.text = standard.nutrient_name
        cell.standard1.text = standard.my_change_value_description
        cell.standardDetail.text = standard.description
        cell.chartHeight.constant = CGFloat(standard.my_current_value_percent)
        
        view.setNeedsLayout()
        UIView.animate(withDuration: 1.3, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        })
        
        cell.standardChart.makeRounded(cornerRadius: 4)
        
        if standard.my_current_value_percent < 30 || standard.my_current_value_percent > 100{
        
            cell.standardChart.backgroundColor = UIColor.paleSalmon
            
        } else {
            cell.standardChart.backgroundColor = UIColor.seafoamBlue
        }
        cell.standardChart.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.4, radius: 4)
        
        //print(cell.standardChart.frame.size.height)
        
        return cell
    
    }
    
}

extension StandardDetailVC {
    func setData() {
        ChartService.shared.showDetailChart() {
            [weak self]
            data in
            print("chart detail")
            
            guard let `self` = self else { return }
            
            switch data {
                
            case .success(let res):
                self.standardList = res as! [ChartDetail]
                self.standardCollectionView.reloadData()
            case .requestErr(let message):
                self.simpleAlert(title: "메인 공연 조회 실패", message: "\(message)")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                self.simpleAlert(title: "메인 공연 조회 실패", message: "네트워크 상태를 확인해주세요.")
            case .dbErr:
                print("db error")
            
            }
        }
        
        /*
        let s1 = SingleChart(standardTitle: "비타민A", stnadard1: "상한 섭취량 조정", standard2: "3000", standard3: "3000", standardChart: 100, standardDetail: "비타민 A와 흡연은 상성이 좋지 않아요!\n흡연자가 비타민 A를 지속적으로 복용했을 시 폐암 발생률이 28%까지 증가했다는 연구결과도 있답니다.\n 물론 비타민을 줄이는 것보다는 금연을 하는 것이 우리 몸에는 더 좋겠죠?")
        let s2 = SingleChart(standardTitle: "오메가3", stnadard1: "상한 섭취량 조정", standard2: "3000", standard3: "3000", standardChart: 10, standardDetail: "비타민 A와 흡연은 상성이 좋지 않아요! 흡연자가 비타민 A를 지속적으로 복용했을 시 폐암 발생률이 28%까지 증가했다는 연구결과도 있답니다. 물론 비타민을 줄이는 것보다는 금연을 하는 것이 우리 몸에는 더 좋겠죠?")
        let s3 = SingleChart(standardTitle: "아미노산", stnadard1: "섭취량 최소화\n섭취량", standard2: "3000", standard3: "3000", standardChart: 80, standardDetail: "비타민 A와 흡연은 상성이 좋지 않아요!\n\n흡연자가 비타민 A를 지속적으로 복용했을 시 폐암 발생률이 28%까지 증가했다는 연구결과도 있답니다.\n물론 비타민을 줄이는 것보다는\n금연을 하는 것이 우리 몸에는 더 좋겠죠?")
        
        standardList = [s1, s2, s3]
 */
    }
}
