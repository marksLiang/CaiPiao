//
//  HighlightsCell.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/9/30.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit
import SnapKit
class HighlightsCell: UITableViewCell {

    @IBOutlet weak var videoIcon: UIImageView!
    @IBOutlet weak var newleagueName: UILabel!
    @IBOutlet weak var newTitle: UILabel!
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newBasebar: UIImageView!
    @IBOutlet weak var newScore: UILabel!
    @IBOutlet weak var newLeftlogo: UIImageView!
    @IBOutlet weak var newRightlogo: UIImageView!
    @IBOutlet weak var newleftName: UILabel!
    @IBOutlet weak var newRightName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        videoIcon.layer.cornerRadius = videoIcon.frame.width/2
        videoIcon.clipsToBounds = true
        videoIcon.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        newBasebar.layer.cornerRadius = 8
        newBasebar.clipsToBounds = true
        newBasebar.snp.makeConstraints { (make) in
            make.center.equalTo(newScore)
            make.left.equalTo(newleftName).offset(-20)
            make.right.equalTo(newRightName).offset(20)
            make.height.equalTo(25)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func InitConfig(_ cell: Any) {
        let model = cell as! HighlightsModel
        newleagueName.text = model.leagueName
        newTitle.text = model.sTitle
        newImage.ImageLoad(PostUrl: model.sImgUrl)
        newScore.text = "\(model.nHomeScore):\(model.nGuestScore)"
        newLeftlogo.ImageLoad(PostUrl: model.sHomeLogo)
        newRightlogo.ImageLoad(PostUrl: model.sGuestLogo)
        newleftName.text = model.sHomeName
        newRightName.text = model.sGuestName
//        if model.sHomeName.characters.count > model.sGuestName.characters.count {
//            newBasebar.frame = CGRect.init(x: 0, y: 145, width: model.sHomeName.getContenSizeWidth(font: UIFont.systemFont(ofSize: 13))*4, height: newBasebar.frame.height)
//        }else{
//            newBasebar.frame = CGRect.init(x:0, y: 145, width: model.sGuestName.getContenSizeWidth(font: UIFont.systemFont(ofSize: 13))*4, height: newBasebar.frame.height)
//        }
//        newBasebar.center.x = CommonFunction.kScreenWidth/2
////        newBasebar.center.y = newScore.center.y
    }
}
