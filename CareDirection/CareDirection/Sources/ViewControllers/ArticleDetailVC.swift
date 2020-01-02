//
//  ArticleDetailVC.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleDetailVC: UIViewController {
    
    @IBOutlet weak var articleTableView: UITableView!
    @IBOutlet weak var navigationBarView: UIView!
    
    //var articleList : [Article]
    
    var articleList : [MainContents] = []
    var subarticleList : [SubContents] = []
    
    var article : ResponseArticle!
    var articleIdx : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 셀 사이즈 동적으로 조절해주기
        articleTableView.rowHeight = UITableView.automaticDimension
        articleTableView.estimatedRowHeight = 600
        
        navigationBarView.layer.addBorder([.bottom], color: UIColor.brownishGrey30, width: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let idx = self.articleIdx else {return}
        
        ArticleService.shared.showArticleDetail(articleIdx: idx) {
            [weak self]
            data in
            
            guard let `self` = self else { return }
            
            switch data{
            case .success(let res) :
                self.article = res as! ResponseArticle
                self.articleList = self.article.data.main_contents!
                self.subarticleList = self.article.data.sub_contents!
                self.articleTableView.reloadData()
            case .requestErr(_):
                print("request err")
            case .pathErr:
                print("path err")
            case .serverErr:
                print("server err")
            case .networkFail:
                print("network err")
            case .dbErr:
                print("db err")
            }
            
        }
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension ArticleDetailVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return subarticleList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                
                let articleImgCell = articleTableView.dequeueReusableCell(withIdentifier: "articleImgCell") as! ArticleImageCell
                //articleImgCell.articleDetaillImage.image = articleList?.articleDetailImage
                
                let mainArticle = articleList[indexPath.row]
                
                articleImgCell.articleDetaillImage.imageFromUrl(mainArticle.image_key, defaultImgPath: "")
                
                return articleImgCell
                
            } else if indexPath.row == 1 {
                
                let articleTitleCell = articleTableView.dequeueReusableCell(withIdentifier: "articleTitleCell") as! ArticleTitleCell
                
                //let mainArticle = articleList[indexPath.row]
                
                //articleTitleCell.articleTitleLabel.text = mainArticle.article_title
                
                return articleTitleCell
                
            } else if indexPath.row == 2 {
                let articleFirstContent = articleTableView.dequeueReusableCell(withIdentifier: "articleFirstContent") as! ArticleFirstContentCell
                //let mainArticle = articleList[indexPath.row]
                
                //articleFirstContent.articleFirstContentLabel.text = mainArticle.article_content
                
                return articleFirstContent
                
            }
        } else {
            //let subContent = subarticleList[indexPath.row]
            let articleSencondContentCell = articleTableView.dequeueReusableCell(withIdentifier: "articleSencondContent") as! ArticleSecondContentCell
            
            let subArticle = subarticleList[indexPath.row]
            
            articleSencondContentCell.articleSecondTitleLabel.text = subArticle.sub_article_title
            articleSencondContentCell.articleContentLabel.text = subArticle.sub_article_content
            articleSencondContentCell.articleContentImage.imageFromUrl(subArticle.image_key, defaultImgPath: "")
            
            return articleSencondContentCell
        }
        let articleSencondContentCell = articleTableView.dequeueReusableCell(withIdentifier: "articleSencondContent") as! ArticleSecondContentCell
        return articleSencondContentCell
    }
}

extension ArticleDetailVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
