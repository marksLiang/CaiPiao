//
//  NewsDetailModel.swift
//  ProjectFramework
//
//  Created by 恋康科技 on 2017/9/30.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class NewsDetailModel: NSObject {
    var summary=""
    var pubTime=0
    var leagueName=""
    var image=""
    var videos:[videosList]?
    var content=""
    var leagueId=0
    var title=""
    var newsId=""
    var hasVideo=false
    var source=""
    var priority=0
    var phases:Any?
    var images:[imagesList]?
    var top=false
    var addTime = 0
    //var hash=""
    var comment=0
    var playType=""
    var category=""
    var original=false
    var lottery=false
    var topicId=0
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["videos":videosList.self,"images":imagesList.self]
    }
}
class imagesList: NSObject {
    var title=""
    var url=""
    var width=0
    var height=0
}
