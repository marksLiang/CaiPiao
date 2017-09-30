//
//  HotSpotModel.swift
//  ProjectFramework
//
//  Created by 恋康科技 on 2017/9/29.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class AdvertisingModel: NSObject {
    var id=""
    var title=""
    var order=0
    var pic=""
    var type=""
}

//热门列表
class HotSpotModel: NSObject {
    var summary=""//标题
    var pubTime=0//时间戳
    var leagueName=""//联赛类型
    var isHome=0
    var playType=""
    var leagueId=""//联赛ID
    var title=""//标题
    var hasVideo=false//是否显示视频
    var priority=0//优先级
    var read=0//阅读量
    var redirect=false//重定向
    var top=false//是否显示置顶
    var index=0
    var Hash=""
    var videos:[videosList]?
    var image=""
    var lottery=false//是否彩票
    var url=""//视频地址
    var category=0//类别
    var newsId=""//新闻ID
    var source=""
    var topicId=0//置顶ID
    var original=false//原始
    var comment=0//评论数
    var first=false//是否第一
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["videos":videosList.self]
    }
}
class videosList: NSObject {
    var thumb=""
    var url=""
}
