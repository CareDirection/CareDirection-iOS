//
//  SurveyDiseaseVC.swift
//  CareDirection
//
//  Created by 이주혁 on 2019/12/25.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SurveyDiseaseVC: UIViewController {
    
    var name: String = "박진오"
    var selectedIndexList:[Int] = []
    var diseaseList:[String] = ["질병0", "질병1", "질병2", "질병3", "질병4", "질병5"]
    
    @IBOutlet var userNameLbl: UILabel!
    @IBOutlet var surveyDiseaseCollectionView: UICollectionView!
    @IBOutlet var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.makeRounded(cornerRadius: 25)
        surveyDiseaseCollectionView.delegate = self
        surveyDiseaseCollectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func addSelectList(selectIndex: Int){
        if(selectedIndexList.contains(selectIndex)){
            let filteredList = selectedIndexList.filter{$0 != selectIndex}
            selectedIndexList = filteredList
        }else{
            selectedIndexList.append(selectIndex)
        }
        surveyDiseaseCollectionView.reloadData()
    }
}

extension SurveyDiseaseVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        addSelectList(selectIndex: indexPath.row)
        print(selectedIndexList)
        
        if !(selectedIndexList.isEmpty){
            nextBtn.backgroundColor = UIColor.white
            nextBtn.setTitleColor(UIColor.topaz, for: .normal)
        }
        else{
            nextBtn.backgroundColor = UIColor.white40
            nextBtn.setTitleColor(UIColor.white40, for: .normal)
        }
    }
}
extension SurveyDiseaseVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diseaseList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SurveyDiseaseCell", for: indexPath) as! SurveyDiseaseCell
        cell.diseaseLbl.makeRounded(cornerRadius: 8)
        cell.diseaseLbl.setBorder(borderColor: UIColor.white40, borderWidth: 1)
        cell.diseaseLbl.text = diseaseList[indexPath.row]
        
        if selectedIndexList.contains(indexPath.row){
            cell.diseaseLbl.textColor = UIColor.tealBlue
            cell.diseaseLbl.backgroundColor = UIColor.paleCyan
        }
        else{
            cell.diseaseLbl.textColor = UIColor.white40
            cell.diseaseLbl.backgroundColor = UIColor.clear
        }
        //print("\(indexPath.row) :  \(cell.diseaseLbl.text)")
        
        
        return cell
    }
    
    
}
extension SurveyDiseaseVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // default width: 100, height: 42
        let cellHeight = (collectionView.bounds.size.height - 20) / 3
        let cellWidth = (collectionView.bounds.size.width - 16) / 2
        
        return CGSize(width: CGFloat(cellWidth), height: CGFloat(cellHeight))
    }
}


