//
//  IngredientStudyVC.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class IngredientStudyVC: UIViewController {
    
    // 전체적인 view block 들
    @IBOutlet weak var navigationBar: UIView!
    
    @IBOutlet weak var ingredientDetailView: UIView!
    
    @IBOutlet weak var symptomView: UIView!
    
    @IBOutlet weak var articleView: UIView!
    
    
    // 성분 collection view
    @IBOutlet weak var ingredientCollectionView: UICollectionView!
    // 아티클 collection view
    @IBOutlet weak var articleCollectionView: UICollectionView!
    
    // 성분 리스트
    var ingredientList : [Ingredient] = []
    
    // 아티클 리스트
    var articleList : [Article] = []
    
    // 증상 리스트
    var symptomList : [Efficacy] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 전체적인 view block들 customize
        navigationBar.layer.addBorder([.bottom], color: UIColor.brownishGrey30, width: 1)
        
        ingredientDetailView.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.3, radius: 1)
        symptomView.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.3, radius: 1)
        articleView.dropShadow(color: UIColor.brownishGrey30, offSet: CGSize(width: 0, height: 1), opacity: 0.3, radius: 1)
        
        // collection view 에 세팅될 더미 데이터들
        //1. ingredient
        setIngredient()
        //2. article
        setArticle()
        //3. 증상 : 이거 리스트 안에 리스트로 처리해줘야함!!
        setSymptom()
        
    }
    
    @IBAction func liverButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.tabIndex = symptomList[0].efficacy_idx
        
        present(dvc, animated: true)
    }
    
    @IBAction func fatigueButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        
        dvc.tabIndex = symptomList[1].efficacy_idx
        
       present(dvc, animated: true)
        
    }
    
    @IBAction func eyeButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        dvc.tabIndex = symptomList[2].efficacy_idx
        present(dvc, animated: true)
        
    }
    
    @IBAction func bloodButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        dvc.tabIndex = symptomList[3].efficacy_idx
        //dvc.titleLabel.text = symptomList[3].efficacy_name
        present(dvc, animated: true)
        
    }
    
    @IBAction func immunityButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        dvc.tabIndex = symptomList[4].efficacy_idx
        //dvc.titleLabel.text = symptomList[4].efficacy_name
        present(dvc, animated: true)
        
    }
    
    @IBAction func digestButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        dvc.tabIndex = symptomList[5].efficacy_idx
        //dvc.titleLabel.text = symptomList[5].efficacy_name
        present(dvc, animated: true)
    }
    
    @IBAction func brainButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        dvc.tabIndex = symptomList[6].efficacy_idx
        //dvc.titleLabel.text = symptomList[6].efficacy_name
        present(dvc, animated: true)
        
    }
    
    @IBAction func muscleButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        dvc.tabIndex = symptomList[7].efficacy_idx
        //dvc.titleLabel.text = symptomList[7].efficacy_name
        present(dvc, animated: true)
       
    }
    
    @IBAction func boneButton(_ sender: Any) {
        let symptomStoryboard = UIStoryboard.init(name: "Symptom", bundle: nil)
        
        guard let dvc = symptomStoryboard.instantiateViewController(withIdentifier: "Symptom") as? SymptomVC else {
          return
        }
        //dvc.titleLabel.text = symptomList[8].efficacy_name
        
        print(symptomList[8].efficacy_name)
        dvc.tabIndex = symptomList[8].efficacy_idx
        dvc.titleLabel?.text = symptomList[8].efficacy_name
        present(dvc, animated: true)
    }
}

// 성분 collection view datasource
extension IngredientStudyVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.articleCollectionView {
            return articleList.count
        }
        return ingredientList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.articleCollectionView {
            let cell = articleCollectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as! ArticleCell
            
            let article = articleList[indexPath.row]
            
            //cell.articleImage.image = article.articleImage
            //cell.articleTitleLabel.text = article.articleTitle
            
            cell.articleImage.imageFromUrl(article.image_key, defaultImgPath: "https://care-direction.s3.ap-northeast-2.amazonaws.com/product/resize/resized-bvSVoq6HZ.1577643187140.JPG")
            cell.articleTitleLabel.text = article.article_title
            cell.articleIdx = article.article_idx
            
            return cell
            
        } else {
            let cell = ingredientCollectionView.dequeueReusableCell(withReuseIdentifier: "ingredientCell", for: indexPath) as! IngredientStudyCell
            
            let ingredient = ingredientList[indexPath.row]
            
            cell.ingredientImage.image = ingredient.ingredientImage
            
            return cell
        }
    }
}

// collection view delegate
extension IngredientStudyVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.ingredientCollectionView {
            let recordStoryboard = UIStoryboard.init(name: "Ingredient", bundle: nil)
            guard let dvc = recordStoryboard.instantiateViewController(withIdentifier: "IngredientDetailVC") as? IngredientDetailVC else {
                return
            }
            
            dvc.detailList = ingredientList[indexPath.row]
            
            self.present(dvc, animated: true)
            
        } else {
            let recordStoryboard = UIStoryboard.init(name: "Article", bundle: nil)
            guard let dvc = recordStoryboard.instantiateViewController(withIdentifier: "ArticleDetailVC") as? ArticleDetailVC else {
                return
            }
            
            dvc.articleIdx = articleList[indexPath.row].article_idx
            
            self.present(dvc, animated: true)
            
        }
    }
}

extension IngredientStudyVC {
    func setIngredient() {
        let ingredient1 = Ingredient(image: "hongsam", detailImage: "flickrMarcoVerch", name: "홍삼", detail: "홍삼우리나라 사람이 가장 애용하는 건강기능식품으로, 전체 건강기능식품 매출액의 약 36%를 차지하고 있다. 홍삼은 인삼의 재배 적지에서 생산된 좋은 품질의 6년근 수삼을 엄선하여 껍질을 벗기지 않은 상태로 장시간 증기로 쪄서 건조시킨 담황갈색 또는 담적갈색을 띠는 인삼이다. 즉 밭에서 캔 수삼은 우선 크기와 모양 등을 따져 1∼5등급으로 분류하여 씻기, 찌기, 건조를 거쳐 홍삼으로 변한다.\n\n인삼은 대개 4년까지는 똑같이 자라지만 4년 이후부터는 토양, 환경, 재배자의 기술에 따라 질이 크게 달라진다. 환경과 재배기술이 맞지 않으면 대부분 4년 이후부터 인삼이 썩기 시작한다. 또 6년이 넘으면 대부분의 인삼에서 목질화(나무처럼 딱딱해지는 것)가 진행된다.\n\n홍삼의 제조 공정에서 우리 몸에 좋은 여러 가지 새로운 생리활성 성분들이 생성된다. 이들 성분들은 수삼이나 백삼에는 없는 홍삼 특유의 성분이다. 또한 홍삼은 수삼 등에 비해 오래 보관할 수 있다.\n\n홍삼 제조 과정에서 인삼의 주요 약리 작용을 하는 진세노사이드의 화학구조가 변한다. 이때 항암 성분, 항당뇨 성분, 항염증 성분, 항산화 성분, 간 기능 해독 성분, 중금속 해독 성분 등 수삼에는 없거나 함유량이 극히 미미했던 성분 10여 가지가 새로 생겨나거나 함유량이 몇 배로 커진다. 홍삼은 인삼에 비해 장기 보관이 용이하고 효능도 훨씬 좋다.\n\n\n\n")
        let ingredient2 = Ingredient(image: "omega", detailImage: "https://care-direction.s3.ap-northeast-2.amazonaws.com/ect/origin/x6odph2Il.1578053632573.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVNA3U6Q4VJ2GYAIX%2F20200104%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20200104T042701Z&X-Amz-Expires=3000&X-Amz-Signature=4a07dc06bd0b790ac811f01ee0d3b102cf8e958a524f6d457ff910564504995a&X-Amz-SignedHeaders=host", name: "오메가3", detail: "심혈관 질환을 개선하고 다이어트에도 도움을 주는 등 다양한 기능을 인정받은 오메가3.\n\n케디는 오메가3 선정 기준으로 함량, 흡수율, 인증마크 3가지를 선택했습니다.먼저EPA+DHA 함량을 확인해야합니다. EPA, DHA는 생선, 크릴새우 류에서 주로 발견되며 식약청에서 권장하는 일일섭취량은 500mg~2000mg입니다. EPA+DHA 함량이 이 범위내에 있는 제품을 구입하는것이 좋겠죠?오메가3의 흡수율은 형태에 따라 EE, rTG 두가지 형식으로 나뉩니다. EE형은 반합성형으로 흡수율이 낮은 대신EPA+DHA 함량을 높인 형태입니다. 최근 주목 받고 있는 rTG형은 EE형 만큼 고함량이면서 흡수율역시 높인 형태입니다. 따라서 흡수율은 rTG형이 EE형 보다 높습니다.오메가3에 대한 대표적인 인증마크로는 GMP, IFOS, IVO 등이 있습니다. 해당 인증마크 획득여부를 제품 구입전 꼭확인해주세요!\n\n\n")
        let ingredient3 = Ingredient(image: "milk", detailImage: "https://care-direction.s3.ap-northeast-2.amazonaws.com/ect/origin/DMd-CBoRi.1578053709305.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVNA3U6Q4VJ2GYAIX%2F20200104%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20200104T042113Z&X-Amz-Expires=3000&X-Amz-Signature=da6415cec6863c05fb17f019cf53acaa4eb0c140a865210f2bf19322f2d981d9&X-Amz-SignedHeaders=host", name: "밀크씨슬", detail: "밀크씨슬 속에 다량으로 함유되어 있는 실리마린은아세트알데히드라는 성분을 분해해숙취해소에 효과적인 것은 물론,항산화 작용을 하여 간을 보호하고 간 세포 재생 및 활성화에 도움을 줍니다.또한 밀크씨슬은 식품의약품안전처에서간 건강에 관한 기능성을유일하게 인증 받은 건강기능식품입니다.간의 주요 역할은 독성 물질을 해독하는 것인데,잘못된 식습관이나 스트레스 등의 원인으로독성 물질이 생성돼쌓이게 될 경우,해독을 하는데 있어 무리가 생길 수밖에 없습니다.때문에 밀크씨슬 섭취를 통하여꾸준하게 간 건강을 관리해주는 것이 중요합니다.\n\n\n")
        let ingredient4 = Ingredient(image: "lutain", detailImage: "https://care-direction.s3.ap-northeast-2.amazonaws.com/ect/origin/B3CFYNxMn.1578053696159.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVNA3U6Q4VJ2GYAIX%2F20200104%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20200104T042701Z&X-Amz-Expires=3000&X-Amz-Signature=622b6c1431053c59ab5818f61a166d5a7b74f49741088048b24bb666b84c0a0f&X-Amz-SignedHeaders=host", name: "루테인", detail: "루테인은 카로티노이드 성분 하나로 우리 몸에 합성되지 않고 음식을 통해 흡수할 수 있으며눈의 망막과 수정체에 축적되는 성분입니다.\n\n노화로 인해 감소될 수 있는 황반색소밀도를 유지하여 눈 건강에 도움을 주며, 과다 섭취 시 일시적으로 피부가 황색으로 변할 수 있습니다.망막과 수정체에 축적된 루테인은 자외선이나 외부로부터 눈에 노출되는 청색광을 흡수하여서 눈을 보호해주는 역할을 합니다. 황반색소의 밀도를 증가시켜 시각의 기능을 개선해주며 시세가 손상되어 나빠질 수 있는 시력저하 예방에도 도움을 줍니다.\n\n\n")
        let ingredient5 = Ingredient(image: "you", detailImage: "https://care-direction.s3.ap-northeast-2.amazonaws.com/ect/origin/0RpHkyvq2.1578053663336.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVNA3U6Q4VJ2GYAIX%2F20200104%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20200104T042941Z&X-Amz-Expires=3000&X-Amz-Signature=95029e09c1cc7ba73b1c75f31e39978bd48ab053455f5a4f03c64d7603a249af&X-Amz-SignedHeaders=host", name: "유산균", detail: "유산균은 우리 몸을 건강하게 도와주는 작은 생물이에요.\n유산균은 창자 속에 살면서 해로운 세균을 물리치는 성질이 있어 우리에게 도움을 주는 세균이랍니다.\n유산균은 음식물의 소화를 도와주고 변비를 예방하는 역할을 해요. 이렇게 몸을 건강하게 유지하는 데 도움을 주어 다른 질병을 예방하는 효과가 있어요.\n\n우리에게 도움이 되는 유산균이 창자 속에 많이 살도록 하는 방법이 있어요. 유산균의 먹이가 되는 과일이나 채소를 많이 먹으면 좋아요. 또한 운동을 하면 유산균이 활발하게 활동합니다. 그 밖에도 유산균이 들어 있는김치나 요구르트를 먹으면 창자 속에 유산균이 들어갈 수 있습니다.\n\n\n")
        let ingredient6 = Ingredient(image: "vita", detailImage: "https://care-direction.s3.ap-northeast-2.amazonaws.com/ect/origin/DMd-CBoRi.1578053709305.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVNA3U6Q4VJ2GYAIX%2F20200104%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20200104T042113Z&X-Amz-Expires=3000&X-Amz-Signature=da6415cec6863c05fb17f019cf53acaa4eb0c140a865210f2bf19322f2d981d9&X-Amz-SignedHeaders=host", name: "비타민D", detail: "비타민 D는 달걀노른자, 생선, 간 등에 들어 있지만 대부분은 햇빛을 통해 얻는데 자외선이 피부에 자극을 주면 비타민 D 합성이 일어난다. 그러나 햇빛의 자외선을 오래 쪼이면 피부 노화가 촉진되고 피부암이 생길 수 있어 자외선 차단 크림을 바르고 다니는 사람들이 많아지면서 비타민 D 부족 현상이 나타나고 있다. 또한 겨울철에는 야외 활동이 적어 일조량 부족으로 인한 비타민 D 결핍이 오기 쉽다. 비타민 D가 결핍한 사람은비타민 D와 칼슘 보충제를 복용하는 것이 바람직하다.\n\n비타민 D는 지용성(脂溶性)이므로 몸속에 들어오면 지방조직에 흡수되지만 지방조직은 비타민 D를 쉽게 놓아주지 않는다. 따라서 지방량이 많은 비만 환자일수록 비타민 D 부족이 오기 쉽다. 결국 비만한 사람들은비타민 D가 부족하고 비타민 D 부족이 비만을 악화시키는 악순환을 가져온다. 비타민 D는 지방에 용해되는 지용성 비타민으로서 골격 형성에 필요한 칼슘을 대장과 콩팥에서 흡수시키는 데 기여하는 것으로 알려졌다. 천연이나 식품 가공품에 비타민 D가 함유된 식품 재료는 모두 지방을 동반하고 있다. 비타민 D는 지용성 에르고스테롤이 자외선의 도움으로 만들어진 것으로, 비타민 D의 기본 분자가 스테로이드(steroid) 구조이다.\n\n의사들은 골다공증 환자에게 비타민 D 섭취를 적극적으로 권장하고 있으나 효과는 미미하거나 전혀 느끼지 못한다고들 한다. 비타민 D3를 얻기 위해서는 햇빛을 쪼이라고 가르치면서 피부암의 위험 때문에 햇빛에 너무 노출하지 말아야 한다고 하고 있다.\n\n\n")
        
        ingredientList = [ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, ingredient6]
    }
    
    func setArticle() {
        ArticleService.shared.showArticleMain() {
            [weak self]
            data in
            
            guard let `self` = self else { return }
            
            switch data {
                
            // 매개변수에 어떤 값을 가져올 것인지
            case .success(let res):
                
                self.articleList = res as! [Article]
                self.articleCollectionView.reloadData()
                print("Article Success")
                
            case .requestErr(let message):
                print("request Err")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                print("network Err")
            case .dbErr:
                print("db err")
            }
        }
        
    }
    
    func setSymptom() {
        
        EfficacyService.shared.efficacyList() {
            [weak self]
            data in
            
            guard let `self` = self else { return }
            
            switch data {
                
            // 매개변수에 어떤 값을 가져올 것인지
            case .success(let res):
                
                self.symptomList = res as! [Efficacy]
                //self.reloadData()
                print("Efficacy Success")
            case .requestErr(let message):
                print("request Err")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                print("network Err")
            case .dbErr:
                print("db err")
            }
        }
        
    }
}
