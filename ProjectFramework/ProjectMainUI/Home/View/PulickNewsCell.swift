//
//  PulickNewsCell.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class PulickNewsCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsTime: UILabel!
    @IBOutlet weak var newsViews: UILabel!
    @IBOutlet weak var newsComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func InitConfig(_ cell: Any) {
        let model = cell as! HotSpotModel
        newsImage.ImageLoad(PostUrl: model.image)
        newsTitle.text = model.title
        newsTime.text = model.pubTime.description.CompareCurretTime()
        newsViews.text = model.read.description
        newsComment.text = model.comment.description
    }
}
