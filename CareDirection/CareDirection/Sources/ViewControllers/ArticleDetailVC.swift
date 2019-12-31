//
//  ArticleDetailVC.swift
//  CareDirection
//
//  Created by 안재은 on 29/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ArticleDetailVC: UIViewController {
    
    @IBOutlet weak var articleTableView: UITableView!
    
    var articleList : Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 셀 사이즈 동적으로 조절해주기
        articleTableView.rowHeight = UITableView.automaticDimension
        articleTableView.estimatedRowHeight = 600
    }
    
    
    @IBAction func backButtonClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension ArticleDetailVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let articleImgCell = articleTableView.dequeueReusableCell(withIdentifier: "articleImgCell") as! ArticleImageCell
            articleImgCell.articleDetaillImage.image = articleList?.articleDetailImage
            
            return articleImgCell
            
        } else if indexPath.row == 1 {
            
            let articleTitleCell = articleTableView.dequeueReusableCell(withIdentifier: "articleTitleCell") as! ArticleTitleCell
            
            articleTitleCell.articleTitleLabel.text = articleList?.articleTitle
            
            return articleTitleCell
            
        } else if indexPath.row == 2 {
            
            let articleFirstContent = articleTableView.dequeueReusableCell(withIdentifier: "articleFirstContent") as! ArticleFirstContentCell
            
            articleFirstContent.articleFirstContentLabel.text = articleList?.articleDetailContent
            
            return articleFirstContent
            
        } else {
            let articleSencondContentCell = articleTableView.dequeueReusableCell(withIdentifier: "articleSencondContent") as! ArticleSecondContentCell
            
            articleSencondContentCell.articleSecondTitleLabel.text = articleList?.articleDetailContentTitle
            articleSencondContentCell.articleContentLabel.text = articleList?.articleDetailContentPara
            articleSencondContentCell.articleContentImage.image = articleList?.articleDetailContentImage
            
            return articleSencondContentCell
        }
    }
}


extension ArticleDetailVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
