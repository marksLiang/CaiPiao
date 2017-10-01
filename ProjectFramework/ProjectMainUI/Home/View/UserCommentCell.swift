//
//  UserCommentCell.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/9/30.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class UserCommentCell: UITableViewCell {

    //用户头像
    lazy var userIcon: UIImageView = {
        let userIcon = UIImageView.init(frame: CommonFunction.CGRect_fram(15, y: 10, w: 35, h: 35))
        userIcon.image = UIImage.init(named: "testimg")
        userIcon.layer.cornerRadius = userIcon.frame.width / 2
        userIcon.clipsToBounds = true
        return userIcon
    }()
    //用户昵称
    lazy var userNickName: UILabel = {
        let userNickName = UILabel.init(frame: CommonFunction.CGRect_fram(self.userIcon.frame.maxX + 5, y: 13, w: 150, h:15 ))
        userNickName.font = UIFont.systemFont(ofSize: 12)
        userNickName.text = "住朋购友"
        return userNickName
    }()
    //时间
    lazy var timeLable: UILabel = {
        let timeLable = UILabel.init(frame: CommonFunction.CGRect_fram(self.userIcon.frame.maxX + 5, y: self.userNickName.frame.maxY + 1, w: 50, h:15 ))
        timeLable.font = UIFont.systemFont(ofSize: 10)
        timeLable.textColor = UIColor.lightGray
        timeLable.text = "3天前"
        return timeLable
    }()
    //点赞按钮
    lazy var dianzanBtn: UIButton = {
       let dianzanBtn = UIButton.init(type: .custom)
        dianzanBtn.frame = CGRect.init(x: CommonFunction.kScreenWidth - 50, y: 10, width: 40, height: 20)
        dianzanBtn.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        dianzanBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0)
        dianzanBtn.titleEdgeInsets = UIEdgeInsetsMake(2, -20, 0, 0)
        dianzanBtn.setTitleColor(UIColor.gray, for: .normal)
        dianzanBtn.setTitleColor(UIColor.gray, for: .selected)
        dianzanBtn.setImage(UIImage.init(named: "dianzan_normal"), for: .normal)
        dianzanBtn.setImage(UIImage.init(named: "dianzan_select"), for: .selected)
        dianzanBtn.addTarget(self, action: #selector(dianzanClick), for: .touchUpInside)
        //dianzanBtn.backgroundColor = UIColor.red
        return dianzanBtn
    }()
    lazy var commentLable: UILabel = {
        let commentLable = UILabel.init(frame: CommonFunction.CGRect_fram(self.userIcon.frame.maxX + 5, y: self.userIcon.frame.maxY + 5, w: CommonFunction.kScreenWidth - 30 - self.userIcon.frame.maxX - 5, h:0 ))
        commentLable.font = UIFont.systemFont(ofSize: 13)
        commentLable.numberOfLines = 0
        return commentLable
    }()
    
    var flag: Bool = false
    var cuurenDianzan = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: 构造方法
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.clipsToBounds = true
        self.selectionStyle = .none
        self.contentView.addSubview(self.userIcon)
        self.contentView.addSubview(self.userNickName)
        self.contentView.addSubview(self.timeLable)
        self.contentView.addSubview(self.commentLable)
        self.contentView.addSubview(self.dianzanBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func InitConfig(_ cell: Any) {
        let model = cell as! UserCommentModel
        if flag == false {
            //debugPrint(model.approveCount)
            cuurenDianzan = model.approveCount
            let commontHeight = model.content.ContentSize(font: UIFont.systemFont(ofSize: 13), maxSize: CGSize(width: CommonFunction.kScreenWidth - 30 - self.userIcon.frame.maxX - 5, height: 0)).height
            commentLable.frame = CommonFunction.CGRect_fram(commentLable.frame.origin.x, y: commentLable.frame.origin.y, w: CommonFunction.kScreenWidth - 30 - self.userIcon.frame.maxX - 5, h: commontHeight)
            userIcon.ImageLoad(PostUrl: model.userLogo)
            userNickName.text=model.userNickname
            let time = model.createTime.description as NSString
            let timeStr = time.substring(to: time.length - 3) as String
            timeLable.text = timeStr.description.CompareCurretTime()
            commentLable.text = model.content
            if cuurenDianzan != 0 {
                dianzanBtn.setTitle(cuurenDianzan.description, for: .normal)
            }
            flag = true
        }
    }
    func dianzanClick(button:UIButton) -> Void {
        button.isSelected = !button.isSelected
        if button.isSelected == true {
            cuurenDianzan = cuurenDianzan+1
            dianzanBtn.setTitle(cuurenDianzan.description, for: .normal)
        }else {
            cuurenDianzan = cuurenDianzan-1
            if cuurenDianzan <= 0 {
                dianzanBtn.setTitle("", for: .normal)
            }else{
                dianzanBtn.setTitle(cuurenDianzan.description, for: .normal)
            }
        }
    }
}
