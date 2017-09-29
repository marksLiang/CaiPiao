//
//  MyCellViewCell.swift
//  ProjectFramework
//
//  Created by hcy on 2017/9/29.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit


class MyCell: UITableViewCell {
    
    //图标
    lazy var img:UIImageView = {
        let img = UIImageView(frame: CGRect(x: 10, y: 8, width: 25, height: 25))
        img.contentMode = .center
        return img
    }()
    
    //文本
    lazy var lab:UILabel = {
        let lab = UILabel(frame: CGRect(x: self.img.frame.maxX+10, y: 5, width: 80, height: 30))
        lab.text=""
        lab.font=UIFont.systemFont(ofSize: 13)
        return lab
    }() 
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func InitConfig(_ cell: Any) {
        super.InitConfig(cell)
        self.contentView.addSubview(img)
        self.contentView.addSubview(lab)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
