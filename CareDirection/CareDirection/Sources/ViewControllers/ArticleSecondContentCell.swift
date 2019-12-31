//
//  ArticleSecondContentCell.swift
//  CareDirection
//
//  Created by 안재은 on 31/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ArticleSecondContentCell: UITableViewCell {

    @IBOutlet weak var articleSecondTitleLabel: UILabel!
    
    @IBOutlet weak var articleContentImage: UIImageView!
    
    @IBOutlet weak var articleContentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
