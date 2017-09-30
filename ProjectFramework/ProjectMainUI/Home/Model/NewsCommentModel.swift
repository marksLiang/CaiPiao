//
//  NewsCommentModel.swift
//  ProjectFramework
//
//  Created by 恋康科技 on 2017/9/30.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class NewsCommentModel: NSObject {
    var hotList:[UserCommentModel]?
    var count=0
    var newList:[UserCommentModel]?
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["hotList":UserCommentModel.self,"newList":UserCommentModel.self]
    }
}
class UserCommentModel: NSObject {
    var createTime = 0
    var userIp = ""
    var replyCount=0
    var originId=""
    var state=1
    var userNickname=""
    var id=0
    var content=""
    var parentId=0
    var userLogo=""
    var userId=""
    var machineCode=""
    var approveCount=0//点赞数
}

