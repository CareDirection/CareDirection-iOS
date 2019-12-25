//
//  SurveySymptomVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/25.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveySymptomVC: UIViewController {
    var name: String = "박진오"
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var surveySymptomCollectionView: UICollectionView!
    @IBOutlet var nextBtn: UIButton!
    
    var selectedIndexList: [Int] = []
    var symptomList:[String] = ["증상A", "증상A", "증상A", "증상A", "증상A", "증상A", "증상A", "증상A", "증상A", "없음"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        surveySymptomCollectionView.delegate = self
        surveySymptomCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func setLayout(){
        nextBtn.isEnabled = false
        nextBtn.backgroundColor = UIColor.white40
        nextBtn.setTitle("다음", for: .disabled)
        nextBtn.setTitleColor(UIColor.white40, for: .disabled)
        
        nameLbl.text = name + "님께서는"
        nextBtn.makeRounded(cornerRadius: 25)
        
    }
}

extension SurveySymptomVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        addSelectList(selectIndex: indexPath.row)
        
        if !(selectedIndexList.isEmpty){
            nextBtn.isEnabled = true
            nextBtn.backgroundColor = UIColor.white
            nextBtn.setTitleColor(UIColor.topaz, for: .normal)
        }
        else{
            nextBtn.isEnabled = false
            nextBtn.backgroundColor = UIColor.white40
            nextBtn.setTitle("다음", for: .disabled)
            nextBtn.setTitleColor(UIColor.white40, for: .disabled)
        }
    }
    
    func addSelectList(selectIndex: Int){
        if(selectedIndexList.contains(selectIndex)){
            let filteredList = selectedIndexList.filter{$0 != selectIndex}
            selectedIndexList = filteredList
        }else if selectIndex == 9{
            selectedIndexList.removeAll()
            selectedIndexList.append(selectIndex)
        }
        else{
            if selectedIndexList.contains(9) {
                selectedIndexList.removeAll()
            }
            selectedIndexList.append(selectIndex)
        }
        surveySymptomCollectionView.reloadData()
    }
}

extension SurveySymptomVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return symptomList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SurveySymptomCell", for: indexPath) as! SurveySymptomCell
        
        cell.symptomLbl.makeRounded(cornerRadius: 8)
        cell.setBorder(borderColor: UIColor.white40, borderWidth: 1)
        cell.symptomLbl.text = symptomList[indexPath.row]
        
        if selectedIndexList.contains(indexPath.row){
            cell.symptomLbl.textColor = UIColor.tealBlue
            cell.symptomLbl.backgroundColor = UIColor.paleCyan
        }
        else{
            cell.symptomLbl.textColor = UIColor.white40
            cell.symptomLbl.backgroundColor = UIColor.clear
        }
        
        return cell
    }
}

extension SurveySymptomVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellHeight = (collectionView.bounds.size.height - 20) / 5
        let cellWidth = (collectionView.bounds.size.width - 16) / 2
        
        return CGSize(width: CGFloat(cellWidth), height: CGFloat(42))
    }
}

