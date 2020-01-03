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
    var diseaseList:[String] = ["고혈압", "골다공증", "당뇨", "불면증", "빈혈", "생리통", "없음"]
    
    @IBOutlet var userNameLbl: UILabel!
    @IBOutlet var surveyDiseaseCollectionView: UICollectionView!
    @IBOutlet var nextBtn: UIButton!
    
    var lifeCylcleBody: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.makeRounded(cornerRadius: 25)
        surveyDiseaseCollectionView.delegate = self
        surveyDiseaseCollectionView.dataSource = self

        setLayout()
        // Do any additional setup after loading the view.
    }
    func setLayout(){
        nextBtn.isEnabled = false
        nextBtn.backgroundColor = UIColor.white40
        nextBtn.setTitle("다음", for: .disabled)
        nextBtn.setTitleColor(UIColor.white40, for: .disabled)
        userNameLbl.text = "\(self.name)님께서"
    }
    
    func addSelectList(selectIndex: Int){
        if(selectedIndexList.contains(selectIndex)){
            let filteredList = selectedIndexList.filter{$0 != selectIndex}
            selectedIndexList = filteredList
        }else if selectIndex == 6{
            selectedIndexList.removeAll()
            selectedIndexList.append(selectIndex)
        }
        else{
            if selectedIndexList.contains(6){
                selectedIndexList.removeAll()
            }
            selectedIndexList.append(selectIndex)
        }
        surveyDiseaseCollectionView.reloadData()
    }
    // 질병 데이터 스트링으로 묶어주는 함수
    func makeDiseaseString() -> String{
        selectedIndexList.sort()
        var value: String = ""
        
        for index in 0..<selectedIndexList.count {
            if index == 0 {
                value += "\(diseaseList[selectedIndexList[index]])"
            }
            else{
                value += ",\(diseaseList[selectedIndexList[index]])"
            }
            
        }
        return value
    }
    
    @IBAction func selectedNextBtn(_ sender: Any) {
        let surveySymptomSB = UIStoryboard.init(name: "SurveySymptom", bundle: nil)
        let dvc = surveySymptomSB.instantiateViewController(withIdentifier: "SurveySymptomVC") as! SurveySymptomVC
        dvc.modalPresentationStyle = .fullScreen
        
        dvc.name = self.name
        
        self.lifeCylcleBody.append(makeDiseaseString())
        dvc.lifeCylcleBody = self.lifeCylcleBody
        self.present(dvc, animated: true)
        
    }
    
    
}

extension SurveyDiseaseVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        addSelectList(selectIndex: indexPath.row)
        print(selectedIndexList)
        
        if !(selectedIndexList.isEmpty){
            nextBtn.isEnabled = true
            nextBtn.backgroundColor = UIColor.white
            nextBtn.setTitleColor(UIColor.topaz, for: .normal)
        }
        else{
            nextBtn.isEnabled = false
            nextBtn.backgroundColor = UIColor.white40
            nextBtn.setTitleColor(UIColor.white40, for: .disabled)
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
        //let cellHeight = (collectionView.bounds.size.height - 20) / 3
        let cellWidth = (collectionView.bounds.size.width - 16) / 2
        
        return CGSize(width: CGFloat(cellWidth), height: CGFloat(42))
    }
}


